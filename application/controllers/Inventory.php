<?php
defined('BASEPATH') or exit('no direct access script allowed');
class Inventory extends CI_Controller
{
  var $table = 'tbl_user';
  public function __construct()
  {
    parent::__construct();

    $this->load->model('Inventory_model', 'inventory_m');
  }

  public function index()
  {
    $data['title'] = 'Daftar Stock Obat & Alkes';
    $data['is_keyword'] = FALSE;
    $data['l_satuan'] = $this->db->get('m_obat_satuan')->result_array();
    $data['l_jenis'] = $this->db->get('m_obat_jenis')->result_array();

    $this->load->view('templates/header', $data);
    $this->load->view('inventory/index', $data);
    $this->load->view('templates/footer');
  }

  public function add_item()
  {
    $data['title'] = 'Add Item';

    $this->load->view('templates/header', $data);
    $this->load->view('inventory/add-item', $data);
    $this->load->view('templates/footer');
  }
}
