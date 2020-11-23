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
      'nama_obat' => $this->input->post('nama_item', TRUE),
      'satuan' => $post['satuan'],
      'jenis_obat' => $post['jenis'],
      'stok' => 0,
      'harga' => $post['harga'],
      'is_active' => '1',
    ];

    $this->db->insert('b_obat', $data);
  }

  public function updateItem()
  {
    $post = $this->input->post();
    $data = [
      'nama_obat' => $this->input->post('nama_item', TRUE),
      'satuan' => $post['satuan'],
      'jenis_obat' => $post['jenis'],
      'harga' => $post['harga'],
      'is_active' => $post['aktif'],
    ];

    $this->db->update('b_obat', $data, ['id' => $post['id']]);
  }

  public function insertStockIn()
  {

    $data = [
      'b_obat_id' =>  $this->input->post('item', TRUE),
      'tanggal' =>  $this->input->post('tanggal'),
      'm_supplier_id' =>  $this->input->post('supplier'),
      'keterangan' =>  $this->input->post('keterangan', TRUE),
      'jumlah' =>  $this->input->post('jumlah'),
    ];

    $this->db->insert('t_inventory_in', $data);
  }
  public function insertStockOut()
  {

    $data = [
      'obat_id' =>  $this->input->post('item', TRUE),
      'alasan_id' =>  $this->input->post('alasan'),
      'tanggal' =>  $this->input->post('tanggal'),
      'jumlah' =>  $this->input->post('jumlah'),
      'keterangan' =>  $this->input->post('keterangan', TRUE),
    ];

    $this->db->insert('t_inventory_out', $data);
  }

  public function updateStock($item_id, $type, $jml)
  {
    $stok = $this->db->get_where('b_obat', ['id' => $item_id])->row_array();
    if ($type == 'in') {
      $data = [
        'stok' => $stok['stok'] + $jml
      ];
    } else if ($type == 'out') {
      $data = [
        'stok' => $stok['stok'] - $jml
      ];
    }
    $this->db->update('b_obat', $data, ['id' => $item_id]);
  }

  public function getTStockIn()
  {
    return $this->db->query(
      "SELECT 
      ti.id,
      ti.b_obat_id,
      b_obat.nama_obat,
      ti.tanggal,
      m_supplier.nama_supplier,
      ti.keterangan,
      ti.jumlah,
      ti.timestamp
      FROM t_inventory_in AS ti
      JOIN b_obat ON b_obat.id = ti.b_obat_id
      JOIN m_supplier ON m_supplier.id_supplier = ti.m_supplier_id
      ORDER BY timestamp DESC
      LIMIT 50"
    )->result();
  }
  public function getTStockOut()
  {
    return $this->db->query(
      "SELECT 
      tout.id,
      tout.obat_id,
      b_obat.nama_obat,
      tout.tanggal,
      m_alasan_item_out.alasan,
      tout.keterangan,
      tout.jumlah,
      tout.timestamp
      FROM t_inventory_out AS tout
      JOIN b_obat ON b_obat.id = tout.obat_id
      JOIN m_alasan_item_out ON m_alasan_item_out.id = tout.alasan_id
      ORDER BY timestamp DESC
      LIMIT 50"
    )->result();
  }

  public function getTStockInByDate($d1, $d2)
  {
    return $this->db->query(
      "SELECT 
      ti.id,
      ti.b_obat_id,
      b_obat.nama_obat,
      ti.tanggal,
      m_supplier.nama_supplier,
      ti.keterangan,
      ti.jumlah,
      ti.timestamp
      FROM t_inventory_in AS ti
      JOIN b_obat ON b_obat.id = ti.b_obat_id
      JOIN m_supplier ON m_supplier.id_supplier = ti.m_supplier_id
      WHERE ti.tanggal  BETWEEN ' $d1 ' AND '$d2'
      ORDER BY ti.timestamp ASC"
    )->result();
  }

  public function getTStockOutByDate($d1, $d2)
  {
    return $this->db->query(
      "SELECT 
      tout.id,
      tout.obat_id,
      b_obat.nama_obat,
      tout.tanggal,
      m_alasan_item_out.alasan,
      tout.keterangan,
      tout.jumlah,
      tout.timestamp
      FROM t_inventory_out AS tout
      JOIN b_obat ON b_obat.id = tout.obat_id
      JOIN m_alasan_item_out ON m_alasan_item_out.id = tout.alasan_id
      WHERE tout.tanggal  BETWEEN ' $d1 ' AND '$d2'
      ORDER BY tout.timestamp ASC"
    )->result();
  }
}
