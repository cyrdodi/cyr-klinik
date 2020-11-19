<?php
defined('BASEPATH') or exit('No direct access script allowed');
class Inventory_model extends CI_Model
{
  var $table = 'b_obat'; // nama table dr database
  var $column_order = ['null', 'nama_obat', 'satuan', 'jenis_obat', 'stok', 'harga']; // field dr table b_obat
  var $column_search = ['nam_obat', 'jenis_obat']; // field yg diizinkan pencarian
  var $order = ['id' => 'asc']; // default order

  // guide
  // http://mfikri.com/artikel/Datatable-serverside-processing-menggunakan-codeigniter.html

  private function _get_datatables_query()
  {
    $this->db->from($this->table);

    $i = 0;

    foreach ($this->column_search as $item) { //looping awal
      if ($_POST['search']['value']) { // jika  datatble mengirimkan pencarian dengan metode POST
        if ($i === 0) { // looping awal
          $this->db->group_start();
          $this->db->like($item, $_POST['search']['value']);
        } else {
          $this->db->or_like($item, $_POST['search']['value']);
        }
        if (count($this->column_search) - 1 == $i) {
          $this->db->group_end();
        }
        $i++;
      }
    }
    if (isset($_POST['order'])) {
      $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    } else if (isset($this->order)) {
      $order = $this->order;
      $this->db->order_by(key($order), $order[key($order)]);
    }
  }

  function get_datatables()
  {
    $this->_get_datatables_query();
    if ($_POST['length'] != -1)
      $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
  }

  function count_filtered()
  {
    $this->_get_datatables_query();
    $query = $this->db->get();
    return $query->num_rows();
  }

  public function count_all()
  {
    $this->db->from($this->table);
    return $this->db->count_all_results();
  }

  public function getObat($limit, $start)
  {
    return $this->db->get('b_obat', $limit, $start)->result();
  }
}
