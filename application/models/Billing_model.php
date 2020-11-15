<?php
defined('BASEPATH') or exit('No direct access script allowed');

class Billing_model extends CI_Model
{
  public function searchPasien($keyword)
  {
    return $this->db->query(
      "SELECT 
      dp.nama_lengkap,
        dp.medrek,
        dp.kecamatan,
        dp.tgl_lahir,
        kt.id,
        kt.tgl_berobat,
        kt.cara_bayar,
        kt.status,
        cara_bayar.pembayaran
    FROM klinik_transaction AS kt
    JOIN data_pasien AS dp ON dp.medrek = kt.medrek
    JOIN cara_bayar ON cara_bayar.id = kt.cara_bayar
    WHERE CONCAT(dp.medrek, dp.nama_lengkap) LIKE '%" . $keyword . "%' 
    AND kt.status = '2'
    LIMIT 100"
    )->result_array();
  }

  public function getTransactionDetail($reg)
  {
    return $this->db->query(
      "SELECT
        dp.medrek,
        dp.nama_lengkap,
        dp.jk,
        dp.tgl_lahir,
        dp.alamat,
        dp.provinsi,
        dp.kabupaten,
        dp.kecamatan,
        dp.kelurahan,
        dp.no_hp,
        kt.id,
        kt.tgl_berobat,
        kt.user_id,
        cara_bayar.pembayaran
    FROM klinik_transaction AS kt
    JOIN data_pasien AS dp ON dp.medrek = kt.medrek
    JOIN cara_bayar ON cara_bayar.id = kt.cara_bayar
    WHERE kt.id='" . $reg . "'
      "
    )->row_array();
  }
}
