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

  public function getListAdmin($reg)
  {
    return $this->db->get_where('t_admin', ['klinik_transaction_id' => $reg])->result_array();
  }

  public function getListTindakan($reg)
  {
    return $this->db->get_where('t_tindakan', ['klinik_transaction_id' => $reg])->result_array();
  }
}
