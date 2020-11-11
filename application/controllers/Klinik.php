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

  public function proses_klinik($reg)
  {
    $data['title'] = 'Proses Klinik';
    $data['detail_antrean'] = $this->Klinik_model->getDetailAntrean($reg);
    $data['pasien'] = $this->Klinik_model->getDetailPasien($data['detail_antrean']['medrek']);
    $data['l_admin'] = $this->Klinik_model->getListAdmin($reg);

    $this->load->view('templates/header', $data);
    $this->load->view('klinik/proses/index', $data);
    $this->load->view('templates/footer');
  }

  public function input_admin($reg)
  {
    $data['title'] = 'Input Admin';
    $data['b_admin'] = $this->db->get('b_admin')->result_array();

    $this->form_validation->set_rules('admin', 'Admin', 'required');
    if ($this->form_validation->run() == FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('klinik/proses/admin/input-admin', $data);
      $this->load->view('templates/footer');
    } else {
      $this->Klinik_model->inputBiayaAdmin($reg);
      $this->session->set_flashdata('msg_admin', '<div class="alert alert-success" role="alert">Biaya admin berhasil diinput</div>');
      redirect('Klinik/proses_klinik.' . $reg);
    }
  }

  public function input_tindakan($reg)
  {
    $data['title'] = 'Input Tindakan';
    $data['b_tindakan'] = $this->db->get('b_tindakan')->result_array();
    $data['l_tindakan'] = $this->Klinik_model->getListTindakan($reg);

    $this->form_validation->set_rules('tindakan', 'tindakan', 'required');
    if ($this->form_validation->run() == FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('klinik/proses/tindakan/input-tindakan', $data);
      $this->load->view('templates/footer');
    } else {
      $this->Klinik_model->inputBiayaTindakan($reg);
      $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Tindakan berhasil diinput</div>');
      redirect('Klinik/input_tindakan/' . $reg);
    }
  }
}
