<?php
defined('BASEPATH') or exit('no direct access script allowed');
class Inventory3 extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();

    $this->load->library('datatables');
    $this->load->model('crud_model');
  }



  public function index()
  {
    $data['title'] = 'Daftar Stock Obat & Alkes';
    $x['category'] = $this->crud_model->get_category();

    $this->load->view('templates/header', $data, $x);
    $this->load->view('inventory/index3', $data, $x);
    $this->load->view('templates/footer');
  }

  function get_product_json()
  { //get product data and encode to be JSON object
    header('Content-Type: application/json');
    echo $this->crud_model->get_all_product();
  }

  function save()
  { //insert record method
    $this->crud_model->insert_product();
    redirect('crud');
  }

  function update()
  { //update record method
    $this->crud_model->update_product();
    redirect('crud');
  }

  function delete()
  { //delete record method
    $this->crud_model->delete_product();
    redirect('crud');
  }
}
