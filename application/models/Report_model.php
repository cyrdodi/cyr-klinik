<?php
defined('BASEPATH') or exit('No direct access script allowed');
class Report_model extends CI_Model
{
  public function getPersonalBillingRecap($bln, $thn)
  {
    return $this->db->query(
      "SELECT 
      bt.no_billing,
      kt.id,
      dp.medrek,
      dp.nama_lengkap,
      dp.kabupaten,
      dp.kecamatan,
      tp.pemeriksaan,
      bt.total_bayar
      FROM billing_transaction bt
      JOIN klinik_transaction kt ON kt.id = bt.klinik_transaction_id
      JOIN data_pasien dp ON dp.medrek = kt.medrek
      LEFT JOIN t_pemeriksaan_klinik tp ON tp.klinik_transaction_id = kt.id 
      WHERE status_pembayaran = '2'
      AND YEAR(kt.tgl_berobat) = '" . $thn . "' AND MONTH(kt.tgl_berobat) = '" . $bln . "'"
    )->result_array();
  }
}
