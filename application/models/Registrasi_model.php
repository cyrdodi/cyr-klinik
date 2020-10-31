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
    $medrek = sprintf('%06d', $this->generateMedrek());
    $tglLahir = $this->input->post('tahun_lhr') . '-' . $this->input->post('bulan_lhr') . "-" . sprintf('%02d', $this->input->post('tgl_lhr'));
    $data = [
      'medrek' => sprintf($medrek),
      'nama_depan' => $this->input->post('nama_depan', TRUE),
      'nama_belakang' => $this->input->post('nama_belakang', TRUE),
      'nik' => $this->input->post('nik', TRUE),
      'no_bpjs' => $this->input->post('no_bpjs', TRUE),
      'jk' => $this->input->post('jk', TRUE),
      'tempat_lahir' => $this->input->post('tempat_lahir', TRUE),
      'tgl_lahir' => $tglLahir,
      'provinsi' => $this->input->post('provinsi', TRUE),
      'kabupaten' => $this->input->post('kabupaten', TRUE),
      'kecamatan' => $this->input->post('kecamatan', TRUE),
      'kelurahan' => $this->input->post('kelurahan', TRUE),
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

    $this->db->insert('data_pasien', $data);

    return ($this->db->affected_rows() != 1) ? false : true;
  }

  public function generateMedrek()
  {
    // last record
    $lastRecord = $this->db->query("SELECT medrek FROM data_pasien ORDER BY timestamp DESC")->row_array();
    // cek apakah ada row
    if ($lastRecord === NULL) {
      $count = 1;
    } else {
      $lastRecord = $lastRecord['medrek'];
      $count = $lastRecord + 1;
    }
    return $count;
  }
}
