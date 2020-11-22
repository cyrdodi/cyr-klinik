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
    // $view_data['clean_output'] = TRUE;
    $data = 'mudata';
    $this->data = $data;
    $view_data['name'] = "<script>alert('Kena Hacked');</script>";
    $this->load->view('templates/header', $view_data);
    $this->load->view('home/index');
    $this->load->view('templates/footer');
  }
}
