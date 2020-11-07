<?php
defined('BASEPATH') or exit('no direct access script allowed');
class Klinik_model extends CI_Model
{
  public function getDetailKlinikTrans()
  {
    return $this->db->get('klinik_transaction')->result_array();
  }
}
