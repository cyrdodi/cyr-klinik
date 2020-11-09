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
    $data['daftar_pasien'] = $this->Klinik_model->getAntreanKlinik();

    $this->load->view('templates/header', $data);
    $this->load->view('klinik/index', $data);
    $this->load->view('templates/footer');
  }

  public function proses_klinik($reg, $mr)
  {
    $data['title'] = 'Proses Klinik';
    // $data['detail_antrean'] = $this->Klinik_model->getDetailAntrean($reg);
    $data['pasien'] = $this->Klinik_model->getDetailPasien($mr);

    $this->load->view('templates/header', $data);
    $this->load->view('klinik/proses/index', $data);
    $this->load->view('templates/footer');
  }
}
