<?php
defined('BASEPATH') or exit('no direct access script allowed');
class Inventory2 extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();

    $this->load->model('Inventory_model', 'inventory_m');
  }



  public function index()
  {
    $data['title'] = 'Daftar Stock Obat & Alkes';

    $this->load->view('templates/header', $data);
    $this->load->view('inventory/index2', $data);
    $this->load->view('templates/footer');
  }

  public function get_data_user()
  {
    $list = $this->inventory_m->get_datatables();
    $data = [];
    $no = $_POST['start'];
    foreach ($list as $field) {
      $no++;
      $row = [];
      $row[] = $no;
      $row[] = $field->nama_obat;
      $row[] = $field->satuan;
      $row[] = $field->jenis_obat;
      $row[] = $field->stok;
      $row[] = $field->harga;

      $data[] = $row;
    }

    $output = [
      'draw' => $_POST['draw'],
      'recordsTotal' => $this->inventory_m->count_all(),
      'recordsFiltered' => $this->inventory_m->count_filtered(),
      'data' => $data
    ];
    // output dalam format JSON
    echo json_encode($output);
  }
}
