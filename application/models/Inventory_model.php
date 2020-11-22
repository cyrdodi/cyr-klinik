<?php
defined('BASEPATH') or exit('No direct access script allowed');
class Inventory_model extends CI_Model
{
  public function getObat($limit, $start)
  {
    return $this->db->get('b_obat', $limit, $start)->result();
  }

  public function searchItem($keyword)
  {
    return $this->db->query(
      "SELECT * FROM b_obat 
      WHERE nama_obat LIKE '%" . $keyword . "%'
      LIMIT 100"
    )->result();
  }

  public function searchPasien($keyword)
  {
    return $this->db->query(
      "SELECT * FROM data_pasien 
      WHERE CONCAT(nama_lengkap, medrek) LIKE '%" . $keyword . "%'
      LIMIT 50"
    )->result_array();
  }

  public function insertItem()
  {
    $post = $this->input->post();
    $data = [
      'nama_obat' => $this->input->post('nama_item'),
      'satuan' => $post['satuan'],
      'jenis_obat' => $post['jenis'],
      'stok' => 0,
      'harga' => $post['harga'],
      'is_active' => '1',
    ];

    $this->db->insert('b_obat', $data);
  }

  public function insertStockIn()
  {
    $post = $this->input->post(true);
    $data = [
      'b_obat_id' => ''
    ];
  }
}
