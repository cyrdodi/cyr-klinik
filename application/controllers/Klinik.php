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
    var_dump($this->Klinik_model->getDetailKlinikTrans());
  }
}
