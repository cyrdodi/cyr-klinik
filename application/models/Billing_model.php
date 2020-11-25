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
        cara_bayar.pembayaran,
        bt.no_billing,
        bt.status_pembayaran
    FROM billing_transaction AS bt
    JOIN klinik_transaction AS kt ON kt.id = bt.klinik_transaction_id
    JOIN data_pasien AS dp ON dp.medrek = kt.medrek
    JOIN cara_bayar ON cara_bayar.id = kt.cara_bayar
    WHERE CONCAT(dp.medrek, dp.nama_lengkap) LIKE '%" . $keyword . "%' 
    AND bt.is_active = '1'
    LIMIT 100"
    )->result_array();
  }

  public function getAntreanBilling()
  {
    $sql =
      "SELECT 
        dp.nama_lengkap,
        dp.medrek,
        dp.kecamatan,
        dp.tgl_lahir,
        kt.id,
        kt.tgl_berobat,
        kt.cara_bayar,
        kt.status,
        cara_bayar.pembayaran,
        bt.no_billing
      FROM billing_transaction AS bt
      JOIN klinik_transaction AS kt ON kt.id = bt.klinik_transaction_id
      JOIN data_pasien AS dp ON dp.medrek = kt.medrek
      JOIN cara_bayar ON cara_bayar.id = kt.cara_bayar
      WHERE bt.status_pembayaran = '1'
      AND bt.is_active = '1'";
    return $this->db->query($sql);
  }

  public function getBillingDetail($nobilling)
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
        cara_bayar.pembayaran,
        bt.no_billing,
        bt.tgl_pembayaran,
        sp.nama_status,
        bt.status_pembayaran,
        bt.is_active,
        bt.total_administrasi,
        bt.total_tindakan,
        bt.total_obat,
        bt.total_bayar,
        m_klinik.nama_klinik
    FROM billing_transaction AS bt
    JOIN klinik_transaction AS kt ON kt.id = bt.klinik_transaction_id
    JOIN data_pasien AS dp ON dp.medrek = kt.medrek
    JOIN cara_bayar ON cara_bayar.id = kt.cara_bayar
    JOIN m_status_pembayaran AS sp ON sp.id = bt.status_pembayaran
    JOIN m_klinik ON m_klinik.klinik_id = kt.klinik_id
    WHERE bt.no_billing='" . $nobilling . "'
      "
    )->row_array();
  }

  public function nonAktifBilling($nobilling)
  {
    $data = [
      'is_active' => '0'
    ];

    $this->db->update('billing_transaction', $data, ['no_billing' => $nobilling]);
  }

  public function simpanBilling($nobilling)
  {
    $data = [
      'status_pembayaran' => '2',
      'tgl_pembayaran' => date('Y-m-d')
    ];

    $this->db->update('billing_transaction', $data, ['no_billing' => $nobilling]);
  }

  public function addPrintLog($nobilling, $jenis, $penerima)
  {
    $data = [
      'no_billing' => $nobilling,
      'jenis_dokumen' => $jenis,
      'user_id' => $this->session->userdata('user_id'),
      'penerima' => $penerima
    ];

    $this->db->insert('log_print_billing', $data);
  }

  public function getBillingCounter($nobilling, $jenis)
  {
    return $this->db->get_where('log_print_billing', ['no_billing' => $nobilling, 'jenis_dokumen' => $jenis])->num_rows();
  }
}
