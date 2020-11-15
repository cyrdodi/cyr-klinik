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
    $this->load->model('Klinik_model');
  }

  public function index()
  {
    $data['title'] = 'Billing';
    $data['is_keyword'] = FALSE;

    $keyword = $this->input->get('keyword');

    if ($keyword !== NULL) {
      if (strlen($keyword) > 0) {
        $data['is_keyword'] = TRUE;
        $data['search_result'] = $this->Billing_model->searchPasien($keyword);
      }
    }

    $this->load->view('templates/header', $data);
    $this->load->view('billing/index', $data);
    $this->load->view('templates/footer');
  }

  public function billing_detail($reg)
  {
    $reg = decrypt_url($reg);

    $data['title'] = 'Billing Detail';
    $data['detail_trans'] = $this->Billing_model->getTransactionDetail($reg);

    $data['l_admin'] = $this->Klinik_model->getListAdmin($reg);
    $data['l_tindakan'] = $this->Klinik_model->getListTindakan($reg);
    $data['l_obat'] = $this->Klinik_model->getListObat($reg);


    $this->load->view('templates/header', $data);
    $this->load->view('billing/billing-detail', $data);
    $this->load->view('templates/footer');
  }
}
