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
    return $this->db->get_where('klinik_transaction', ['id' => $reg])->row_array();
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
        cara_bayar.pembayaran
      FROM klinik_transaction AS kt
      JOIN data_pasien AS dp ON dp.medrek = kt.medrek
      JOIN cara_bayar ON cara_bayar.id = kt.cara_bayar
      WHERE kt.is_active = '1'
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
    $fetched_records = $this->db->query("SELECT * FROM b_obat WHERE nama_obat LIKE '%" . $searchTerm . "%' LIMIT 30");
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
}
