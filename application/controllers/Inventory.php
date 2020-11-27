<?php
defined('BASEPATH') or exit('no direct access script allowed');
class Inventory extends CI_Controller
{
  var $table = 'tbl_user';
  public function __construct()
  {
    parent::__construct();

    if ($this->session->userdata('is_login') !== TRUE) {
      redirect('Auth');
    } else if ($this->session->userdata('role_id') != '1') {
      if ($this->session->userdata('role_id') != '2') {
        if ($this->session->userdata('petugas') != 'farmasi') {
          redirect('Auth');
        }
      }
    }

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
      $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Item berhasil ditambahkan</div>');
      redirect('Inventory');
    }
  }

  public function edit_item($id)
  {
    $data['title'] = 'Add Item';
    $data['l_satuan'] = $this->db->get('m_obat_satuan')->result_array();
    $data['l_jenis'] = $this->db->get('m_obat_jenis')->result_array();
    $data['detail_item'] = $this->db->get_where('b_obat', ['id' => $id])->row_array();

    $this->form_validation->set_rules('nama_item', 'Nama Item', 'required');
    $this->form_validation->set_rules('harga', 'Harga Jual', 'required');
    if ($this->form_validation->run() === FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('inventory/edit-item', $data);
      $this->load->view('templates/footer');
    } else {
      $this->inventory_m->updateItem();
      $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Item berhasil diupdate</div>');
      redirect('Inventory');
    }
  }

  public function stock_in()
  {
    $data['title'] = 'Stock In';
    $data['l_stok_in'] = $this->inventory_m->getTStockIn();

    $data['l_supplier'] = $this->db->get_where('m_supplier', ['is_active' => TRUE])->result_array();
    $this->form_validation->set_rules('tanggal', 'Tanggal', 'required');
    $this->form_validation->set_rules('item', 'Item', 'required');
    $this->form_validation->set_rules('jumlah', 'Jumlah', 'required');
    if ($this->form_validation->run() == FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('inventory/stock-in', $data);
      $this->load->view('templates/footer');
    } else {
      $this->inventory_m->insertStockIn();
      $this->inventory_m->updateStock($this->input->post('item', true), 'in', $this->input->post('jumlah'));
      $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Stock sudah ditambahkan</div>');
      redirect('Inventory/stock_in');
    }
  }

  public function stock_out()
  {
    $data['title'] = 'Stock In';
    $data['l_alasan'] = $this->db->get('m_alasan_item_out')->result_array();
    $data['l_stock_out'] = $this->inventory_m->getTStockOut();

    $this->form_validation->set_rules('tanggal', 'Tanggal', 'required');
    $this->form_validation->set_rules('item', 'Item', 'required');
    $this->form_validation->set_rules('jumlah', 'Jumlah', 'required');
    if ($this->form_validation->run() == FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('inventory/stock-out', $data);
      $this->load->view('templates/footer');
    } else {
      $this->inventory_m->insertStockOut();
      $this->inventory_m->updateStock($this->input->post('item', true), 'out', $this->input->post('jumlah'));
      $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Stock sudah dikurangi</div>');
      redirect('Inventory/stock_out');
    }
  }

  public function search_stock_in()
  {
    $data['title'] = 'Search Stock In';

    $data['is_keyword'] = FALSE;

    $d1 = $this->input->get('d1');
    $d2 = $this->input->get('d2');
    // $data['search_result'] = $this->inventory_m->getTStockInByDate($d1, $d2);
    if ($d1 !== NULL and $d2 !== NULL) {
      if (strlen($d1) > 0 and strlen($d1) > 0) {
        $data['is_keyword'] = TRUE;
        $data['search_result'] = $this->inventory_m->getTStockInByDate($d1, $d2);
      }
    }

    $this->load->view('templates/header', $data);
    $this->load->view('inventory/search-stock-in', $data);
    $this->load->view('templates/footer');
  }

  public function search_stock_out()
  {
    $data['title'] = 'Search Stock Out';

    $data['is_keyword'] = FALSE;

    $d1 = $this->input->get('d1');
    $d2 = $this->input->get('d2');
    // $data['search_result'] = $this->inventory_m->getTStockInByDate($d1, $d2);
    if ($d1 !== NULL and $d2 !== NULL) {
      if (strlen($d1) > 0 and strlen($d1) > 0) {
        $data['is_keyword'] = TRUE;
        $data['search_result'] = $this->inventory_m->getTStockOutByDate($d1, $d2);
      }
    }

    $this->load->view('templates/header', $data);
    $this->load->view('inventory/search-stock-out', $data);
    $this->load->view('templates/footer');
  }

  public function delete_stock_in($id, $obat_id, $jumlah)
  {
    $this->db->delete('t_inventory_in', ['id' => $id]);
    $this->inventory_m->updateStock($obat_id, 'out', $jumlah);
    $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Trasaksi berhasil dihapus</div>');
    redirect('Inventory/stock_in');
  }

  public function delete_stock_out($id, $obat_id, $jumlah)
  {
    $this->db->delete('t_inventory_out', ['id' => $id]);
    $this->inventory_m->updateStock($obat_id, 'in', $jumlah);
    $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Trasaksi berhasil dihapus</div>');
    redirect('Inventory/stock_out');
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
