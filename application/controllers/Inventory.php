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

    $keyword = $this->input->get('keyword');
    $data['search_result'] = $this->db->query("SELECT * FROM b_obat order by id DESC LIMIT 50")->result();
    if ($keyword !== NULL) {
      if (strlen($keyword) > 0) {
        $data['is_keyword'] = TRUE;
        $data['search_result'] = $this->inventory_m->searchItem($keyword);
      }
    }

    $this->load->view('templates/header', $data);
    $this->load->view('inventory/index', $data);
    $this->load->view('templates/footer');
  }

  public function add_item()
  {
    $data['title'] = 'Add Item';
    $data['l_satuan'] = $this->db->get('m_obat_satuan')->result_array();
    $data['l_jenis'] = $this->db->get('m_obat_jenis')->result_array();

    $this->form_validation->set_rules('nama_item', 'Nama Item', 'required');
    $this->form_validation->set_rules('harga', 'Harga Jual', 'required');
    if ($this->form_validation->run() === FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('inventory/add-item', $data);
      $this->load->view('templates/footer');
    } else {
      $this->inventory_m->insertItem();
      $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Item sudah ditambahkan</div>');
      redirect('Inventory');
    }
  }

  public function transaksi()
  {
    $data['title'] = 'Transaksi Item';

    $this->load->view('templates/header', $data);
    $this->load->view('inventory/transaksi', $data);
    $this->load->view('templates/footer');
  }
}
