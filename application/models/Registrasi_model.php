<?php
defined('BASEPATH') or exit('No direct access allowed');
class Registrasi_model extends CI_Model
{

  public function getProvinsi()
  {
    $this->db->order_by('name');
    return $this->db->get('add_provinces')->result_array();
  }

  public function getKabupaten($id)
  {
    $this->db->order_by('name');
    return $this->db->get_where('add_regencies', ['province_id' => $id])->result_array();
  }

  public function getKecamatan($id)
  {
    $this->db->order_by('name');
    return $this->db->get_where('add_districts', ['regency_id' => $id])->result_array();
  }

  public function getKelurahan($id)
  {
    $this->db->order_by('name');
    return $this->db->get_where('add_villages', ['district_id' => $id])->result_array();
  }

  public function insertDataPasien()
  {
    $medrek = $this->generateMedrek();
    $tglLahir = $this->input->post('tahun_lhr') . '-' . $this->input->post('bulan_lhr') . "-" . sprintf('%02d', $this->input->post('tgl_lhr'));
    $data = [
      'medrek' => sprintf($medrek),
      'nama_lengkap' => $this->input->post('nama_lengkap', TRUE),
      'nik' => $this->input->post('nik', TRUE),
      'no_bpjs' => $this->input->post('no_bpjs', TRUE),
      'jk' => $this->input->post('jk', TRUE),
      'tempat_lahir' => $this->input->post('tempat_lahir', TRUE),
      'tgl_lahir' => $tglLahir,
      'provinsi' => ucfirst(strtolower($this->input->post('provinsi', TRUE))),
      'kabupaten' => ucfirst(strtolower($this->input->post('kabupaten', TRUE))),
      'kecamatan' => ucfirst(strtolower($this->input->post('kecamatan', TRUE))),
      'kelurahan' => ucfirst(strtolower($this->input->post('kelurahan', TRUE))),
      'alamat' => $this->input->post('alamat', TRUE),
      'no_hp' => $this->input->post('no_hp', TRUE),
      'agama' => $this->input->post('agama', TRUE),
      'pekerjaan' => $this->input->post('pekerjaan', TRUE),
      'status_perkawinan' => $this->input->post('status', TRUE),
      'nama_penjamin' => $this->input->post('penjamin', TRUE),
      'no_hp_penjamin' => $this->input->post('no_hp_penjamin', TRUE),
      'hubungan' => $this->input->post('hubungan', TRUE),
      'is_active' => '1',
    ];
    $this->db->trans_begin();

    $this->db->insert('data_pasien', $data);
    $ins = $this->db->affected_rows();
    if ($this->db->trans_status()) {
      // check double input
      if ($ins === 1) {
        $this->db->trans_commit();
        return ['status' => TRUE, 'msg' => 'Pasien berhasil ditambahkan', 'mr' => $medrek];
      } else {
        $this->db->trans_rollback();
        return ['status' => FALSE, 'msg' => 'Gagal insert pasien'];
      }
    } else {
      $this->db->trans_rollback();
      return ['status' => FALSE, 'msg' => 'Gagal transaksi'];
    }
  }

  public function editProfilPasien($mr)
  {
    $tglLahir = $this->input->post('tahun_lhr') . '-' . $this->input->post('bulan_lhr') . "-" . sprintf('%02d', $this->input->post('tgl_lhr'));
    $data = [
      'nama_lengkap' => $this->input->post('nama_lengkap', TRUE),
      'nik' => $this->input->post('nik', TRUE),
      'no_bpjs' => $this->input->post('no_bpjs', TRUE),
      'jk' => $this->input->post('jk', TRUE),
      'tempat_lahir' => $this->input->post('tempat_lahir', TRUE),
      'tgl_lahir' => $tglLahir,
      'provinsi' => ucfirst(strtolower($this->input->post('provinsi', TRUE))),
      'kabupaten' => ucfirst(strtolower($this->input->post('kabupaten', TRUE))),
      'kecamatan' => ucfirst(strtolower($this->input->post('kecamatan', TRUE))),
      'kelurahan' => ucfirst(strtolower($this->input->post('kelurahan', TRUE))),
      'alamat' => $this->input->post('alamat', TRUE),
      'no_hp' => $this->input->post('no_hp', TRUE),
      'agama' => $this->input->post('agama', TRUE),
      'pekerjaan' => $this->input->post('pekerjaan', TRUE),
      'status_perkawinan' => $this->input->post('status', TRUE),
      'nama_penjamin' => $this->input->post('penjamin', TRUE),
      'no_hp_penjamin' => $this->input->post('no_hp_penjamin', TRUE),
      'hubungan' => $this->input->post('hubungan', TRUE),
      'is_active' => '1',
    ];

    $this->db->update('data_pasien', $data, ['medrek' => $mr]);
  }

  public function generateMedrek()
  {
    // last record
    $lastRecord = $this->db->query("SELECT medrek FROM data_pasien ORDER BY medrek DESC")->row_array();
    // cek apakah ada row
    if ($lastRecord === NULL) {
      $mr =  sprintf('%06d', 1);;
    } else {
      $lastRecord = $lastRecord['medrek'];
      $mr = $lastRecord + 1;
      $mr = sprintf('%06d', $mr);
    }


    // check duplicate
    $dup = $this->medrekIsDuplicate($mr);
    for ($i = 0; $dup; $i++) {
      $mr = $mr + 1;
      $dup = $this->medrekIsDuplicate($mr);
    }

    return $mr;
  }

  // check dupliate medrek
  private function medrekIsDuplicate($mr)
  {
    $dup = $this->db->get_where('data_pasien', ['medrek' => $mr])->num_rows();
    if ($dup > 0) {
      return true;
    } else {
      return false;
    }
  }

  public function searchPasien($keyword)
  {
    return $this->db->query(
      "SELECT * FROM data_pasien 
      WHERE CONCAT(nama_lengkap, medrek) LIKE '%" . $keyword . "%'
      LIMIT 50"
    )->result_array();
  }

  public function getDataPasien($mr)
  {
    return $this->db->get_where('data_pasien', ['medrek' => $mr])->row_array();
  }

  public function insertPendaftaran()
  {
    $noreg = $this->_generateReg();
    $data = [
      'id' => $noreg,
      'medrek' => $this->input->post('medrek', TRUE),
      'tgl_berobat' => $this->input->post('tgl_berobat', TRUE),
      'cara_bayar' => $this->input->post('caraBayar', TRUE),
      'user_id' => $this->session->userdata('user_id'),
      'status' => 1,
      'klinik_id' => $this->input->post('klinik', TRUE)
    ];

    $this->db->insert('klinik_transaction', $data);
    return $noreg;
  }

  public function _generateReg()
  {
    $date = date('Ymd');
    $count = $this->db->get_where('klinik_transaction', ['MONTH(tgl_berobat)' => date('m'), 'YEAR(tgl_berobat)' => date('Y')])->num_rows();
    $noreg = $date . sprintf('%05d', $count + 1);
    if ($count <= 0) {
      $noreg = $date . sprintf('%05d', $count + 1);
    } else {
      $lastrecord = $this->db->query("SELECT id FROM klinik_transaction ORDER BY timestamp DESC")->row_array();
      $lastrecord = $lastrecord['id'];
      $urutan = substr($lastrecord, 8);
      $urutan = $urutan + 1;
      $noreg = $date . sprintf('%05d', $urutan);
    }

    return $noreg;
  }

  public function isMedrekInAntrean($mr)
  {
    $check = $this->db->query("SELECT * FROM klinik_transaction WHERE medrek = '" . $mr . "' AND status = 1")->num_rows();
    if ($check > 0) {
      return TRUE;
    } else {
      return FALSE;
    }
  }

  public function isBillingNunggak($mr)
  {
    //cek apakah medrek punya billing aktif yang belum lunas
    $check = $this->db->query(
      "SELECT * 
      FROM billing_transaction AS bt
      JOIN klinik_transaction AS kt ON kt.id = bt.klinik_transaction_id
      WHERE kt.medrek = '" . $mr . "' AND bt.status_pembayaran= '1' AND bt.is_active = '1'
      "
    )->num_rows();
    if ($check > 0) {
      return TRUE;
    } else {
      return FALSE;
    }
  }
}
