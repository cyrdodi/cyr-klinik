<?php
defined('BASEPATH') or exit('no direct access script allowed');
class Inventory extends CI_Controller
{
  var $table = 'tbl_user';
  public function __construct()
  {
    parent::__construct();

    $this->load->model('Inventory_model', 'inventory_m');
    $this->load->model('Klinik_model');
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

  public function stock_in()
  {
    $data['title'] = 'Stock In';

    $this->load->view('templates/header', $data);
    $this->load->view('inventory/stock-in', $data);
    $this->load->view('templates/footer');
  }

  public function stock_out()
  {
    $data['title'] = 'Stock In';
    $data['l_supplier'] = $this->db->get('m_supplier')->result();

    $this->load->view('templates/header', $data);
    $this->load->view('inventory/stock_in', $data);
    $this->load->view('templates/footer');
  }

  public function add_stock_in()
  {
    $data['title'] = 'Add Stock In';
    $data['l_supplier'] = $this->db->get_where('m_supplier', ['is_active' => TRUE])->result_array();

    $this->form_validation->set_rules('tanggal', 'Tanggal', 'required');
    $this->form_validation->set_rules('item', 'Item', 'required');
    $this->form_validation->set_rules('jumlah', 'Jumlah', 'required');
    if ($this->form_validation->run() == FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('inventory/add-stock-in', $data);
      $this->load->view('templates/footer');
    } else {
      $this->inventory_m->insertStockIn();
    }
  }

  // ajax
  public function searchObat()
  {
    $searchterm = $this->input->post('searchTerm');

    $response = $this->Klinik_model->getObat($searchterm);

    echo json_encode($response);
  }

  public function getStok()
  {
    $id = $this->input->post('id');
    $response = $this->db->get_where('b_obat', ['id' => $id])->row_array();
    echo json_encode($response);
  }
}
