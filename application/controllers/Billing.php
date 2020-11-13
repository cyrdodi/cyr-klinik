<?php
defined('BASEPATH') or exit('no direct access alowed');

class Billing extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();

    if ($this->session->userdata('is_login') !== TRUE) {
      redirect('Auth');
    }

    $this->load->model('Billing_model');
  }

  public function index()
  {
    $data['judul'] = 'Billing';

    $this->load->view('templates/header', $data);
    $this->load->view('billing/index', $data);
    $this->load->view('templates/footer');
  }
}
