<?php
defined('BASEPATH') or exit('no direct access script allowed');
class Klinik_model extends CI_Model
{
  public function getDetailKlinikTrans()
  {
    return $this->db->get('klinik_transaction')->result_array();
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
}
