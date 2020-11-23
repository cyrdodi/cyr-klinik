<?php
defined('BASEPATH') or exit('no direct access script allowed');
class Klinik_model extends CI_Model
{
  public function getDetailKlinikTrans()
  {
    return $this->db->get('klinik_transaction')->result_array();
  }

  public function getDetailAntrean($reg)
  {

    return $this->db->query(
      "SELECT 
        kt.id,
        kt.tgl_berobat,
        kt.medrek,
        kt.user_id,
        cara_bayar.pembayaran,
        kt.cara_bayar,
        kt.status,
        m_klinik.nama_klinik
      FROM klinik_transaction AS kt
      JOIN cara_bayar ON cara_bayar.id = kt.cara_bayar
      JOIN m_klinik ON m_klinik.klinik_id = kt.klinik_id
      WHERE kt.id = '" . $reg . "'"
    )->row_array();
  }

  public function getDetailPasien($mr)
  {
    return $this->db->get_where('data_pasien', ['medrek' => $mr])->row_array();
  }

  public function getAntreanKlinik()
  {
    return $this->db->query(
      "SELECT 
        kt.id,
        kt.medrek,
        dp.nama_lengkap,
        dp.alamat,
        cara_bayar.pembayaran,
        m_klinik.nama_klinik
      FROM klinik_transaction AS kt
      JOIN data_pasien AS dp ON dp.medrek = kt.medrek
      JOIN cara_bayar ON cara_bayar.id = kt.cara_bayar
      JOIN m_klinik ON m_klinik.klinik_id = kt.klinik_id
      WHERE kt.status = '1'
        "
    )->result_array();
  }

  public function inputBiayaAdmin($reg)
  {
    $admin = $this->db->get_where('b_admin', ['id' => html_escape($this->input->post('admin', TRUE))])->row_array();
    $data = [
      "nama_admin" => $admin['nama'],
      "harga" => $admin['harga'],
      "b_admin_id" => $admin['id'],
      "klinik_transaction_id" => $reg
    ];
    $this->db->insert('t_admin', $data);
  }

  public function inputBiayaTindakan($reg)
  {
    $detail = $this->db->get_where('b_tindakan', ['id' => html_escape($this->input->post('tindakan', TRUE))])->row_array();
    $data = [
      "nama_tindakan" => $detail['nama_tindakan'],
      "tarif" => $detail['tarif'],
      "b_tindakan_id" => $detail['id'],
      "klinik_transaction_id" => $reg
    ];
    $this->db->insert('t_tindakan', $data);
  }

  public function inputBiayaObat($reg)
  {
    $detail = $this->db->get_where('b_obat', ['id' => html_escape($this->input->post('obat', TRUE))])->row_array();
    $data = [
      "nama_obat" => $detail['nama_obat'],
      "harga" => $detail['harga'],
      "satuan" => $detail['satuan'],
      "jumlah" => html_escape($this->input->post('jumlah', TRUE)),
      "b_obat_id" => $detail['id'],
      "klinik_transaction_id" => $reg
    ];

    $this->db->insert('t_obat', $data);
  }

  public function penguranganStokObat()
  {
    $id_obat = html_escape($this->input->post('obat', TRUE));
    $detail = $this->db->get_where('b_obat', ['id' => $id_obat])->row_array();
    $stok = $detail['stok'] - html_escape($this->input->post('jumlah', TRUE));
    $data = [
      'stok' => $stok
    ];
    $this->db->update('b_obat', $data, ['id' => $id_obat]);
  }

  public function penambahanStokObat($id_obat, $jml)
  {
    $detail = $this->db->get_where('b_obat', ['id' => $id_obat])->row_array();
    $stok = $detail['stok'] + $jml;
    $data = [
      'stok' => $stok
    ];
    $this->db->update('b_obat', $data, ['id' => $id_obat]);
  }

  public function getObat($searchTerm = "")
  {
    $fetched_records = $this->db->query("SELECT * FROM b_obat WHERE nama_obat LIKE '%" . $searchTerm . "%' AND is_active='1' LIMIT 30");
    $obat = $fetched_records->result_array();

    // initialize Array with fetched data
    $data = [];
    foreach ($obat as $row) {
      $data[] = ['id' => $row['id'], 'text' => $row['nama_obat'] . " / " . $row['satuan'] . " @" . number_format($row['harga'])];
    }
    return $data;
  }

  public function getListAdmin($reg)
  {
    return $this->db->get_where('t_admin', ['klinik_transaction_id' => $reg])->result_array();
  }

  public function getListTindakan($reg)
  {
    return $this->db->get_where('t_tindakan', ['klinik_transaction_id' => $reg])->result_array();
  }

  public function getListObat($reg)
  {
    return $this->db->get_where('t_obat', ['klinik_transaction_id' => $reg])->result_array();
  }

  public function getRekapAdmin($reg)
  {
    return $this->db->query(
      "SELECT SUM(harga) AS total FROM t_admin WHERE klinik_transaction_id = '" . $reg . "'"
    )->row_array();
  }
  public function getRekapTindakan($reg)
  {
    return $this->db->query(
      "SELECT SUM(tarif) AS total FROM t_tindakan WHERE klinik_transaction_id = '" . $reg . "'"
    )->row_array();
  }

  public function getRekapObat($reg)
  {
    return $this->db->query(
      "SELECT SUM(harga*jumlah) AS total FROM t_obat WHERE klinik_transaction_id = '" . $reg . "'"
    )->row_array();
  }

  public function updateStatusKlinikTransaction($reg, $status)
  {
    // 1 = Antrean
    // 2 = Selesai
    // 3 = Batal

    $data = [
      'status' => $status
    ];

    $this->db->update('klinik_transaction', $data, ['id' => $reg]);
  }

  public function insertBilling($reg)
  {
    $totaladmin = $this->getRekapAdmin($reg);
    $totaltindakan = $this->getRekapTindakan($reg);
    $totalobat = $this->getRekapObat($reg);
    $nobilling = $this->_generateNoBilling();
    $totalbayar = $totaladmin['total'] + $totaltindakan['total'] + $totalobat['total'];
    $data = [
      'no_billing' => $nobilling,
      'status_pembayaran' => '1',
      'is_active' => '1',
      'total_administrasi' => $totaladmin['total'],
      'total_tindakan' => $totaltindakan['total'],
      'total_obat' => $totalobat['total'],
      'total_bayar' => $totalbayar,
      'klinik_transaction_id' => $reg,
    ];


    $this->db->insert('billing_transaction', $data);
    return $nobilling;
  }

  public function _generateNoBilling()
  {
    $date = date('y-m');
    $count = $this->db->get_where('billing_transaction', ['MONTH(timestamp)' => date('m'), 'YEAR(timestamp)' => date('Y')])->num_rows();
    $nobilling = 'IBK-' . $date . '-' . sprintf('%05d', $count + 1);
    return $nobilling;
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
}
