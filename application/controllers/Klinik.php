<?php
defined('BASEPATH') or exit('No direct access script allowed');
class Klinik extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();

    if ($this->session->userdata('is_login') !== TRUE) {
      redirect('Auth');
    }

    $this->load->model('Klinik_model');
  }

  public function index()
  {
    $data['title'] = 'Daftar Antrean Klinik';

    $this->load->view('templates/header', $data);
    $this->load->view('klinik/index', $data);
    $this->load->view('templates/footer');
  }
}
