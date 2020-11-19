<?php
defined('BASEPATH') or exit('no direct access script allowed');
class Inventory2 extends CI_Controller
{
  var $table = 'b_obat'; // nama table dr database
  var $column_order = ['null', 'nama_obat', 'satuan', 'jenis_obat', 'stok', 'harga']; // field dr table b_obat
  var $column_search = ['nam_obat', 'jenis_obat']; // field yg diizinkan pencarian
  var $order = ['id' => 'asc']; // default order

  public function __construct()
  {
    parent::__construct();

    $this->load->model('Inventory_model', 'inventory_m');
  }



  public function index()
  {
    $data['title'] = 'Daftar Stock Obat & Alkes';

    // konfigurasi pagination
    $config['base_url'] = site_url('Inventory/index');
    $config['total_rows'] = $this->db->count_all('b_obat');
    $config['per_page'] = 10;
    $config['uri_segment'] = 3;
    $choice = $config['total_rows'] / $config['per_page'];
    $config['num_links'] = floor($choice);

    $config['first_link']       = 'First';
    $config['last_link']        = 'Last';
    $config['next_link']        = 'Next';
    $config['prev_link']        = 'Prev';
    $config['full_tag_open']    = '<div class="pagging text-center"><nav><ul class="pagination justify-content-center">';
    $config['full_tag_close']   = '</ul></nav></div>';
    $config['num_tag_open']     = '<li class="page-item"><span class="page-link">';
    $config['num_tag_close']    = '</span></li>';
    $config['cur_tag_open']     = '<li class="page-item active"><span class="page-link">';
    $config['cur_tag_close']    = '<span class="sr-only">(current)</span></span></li>';
    $config['next_tag_open']    = '<li class="page-item"><span class="page-link">';
    $config['next_tagl_close']  = '<span aria-hidden="true">&raquo;</span></span></li>';
    $config['prev_tag_open']    = '<li class="page-item"><span class="page-link">';
    $config['prev_tagl_close']  = '</span>Next</li>';
    $config['first_tag_open']   = '<li class="page-item"><span class="page-link">';
    $config['first_tagl_close'] = '</span></li>';
    $config['last_tag_open']    = '<li class="page-item"><span class="page-link">';
    $config['last_tagl_close']  = '</span></li>';

    $this->pagination->initialize($config);
    $data['page'] = ($this->uri->segment(3)) ? $this->uri->segment(3) : 0;
    $data['l_obat'] = $this->inventory_m->getObat($config['per_page'], $data['page']);

    $data['pagination'] = $this->pagination->create_links();

    $this->load->view('templates/header', $data);
    $this->load->view('inventory/index', $data);
    $this->load->view('templates/footer');
  }
}
