<?php
defined('BASEPATH') or exit('No direct access script allowed');
class Inventory_model extends CI_Model
{
  public function getObat($limit, $start)
  {
    return $this->db->get('b_obat', $limit, $start)->result();
  }
}
