<?php
class Home extends CI_Controller
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
    $this->load->view('templates/header');
    $this->load->view('home/index');
    $this->load->view('templates/footer');
  }
}
