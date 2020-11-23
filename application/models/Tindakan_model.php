<?php
defined('BASEPATH') or exit('No direct access script allowed');
class Tindakan_model extends CI_Model
{
  public function searchTindakan($keyword)
  {
    $this->db->like('nama_tindakan', $keyword);
    return $this->db->get('b_tindakan')->result_array();
  }

  public function addTindakan()
  {
    $data = [
      'nama_tindakan' => $this->input->post('tindakan', TRUE),
      'tarif' => $this->input->post('tarif', TRUE),
      'is_active' => '1',
    ];

    $this->db->insert('b_tindakan', $data);
  }
}
