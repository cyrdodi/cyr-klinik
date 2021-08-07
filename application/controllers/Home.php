<?php
class Home extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();

    if ($this->session->userdata('is_login') !== TRUE) {
      redirect('Auth');
    } else if ($this->session->userdata('role_id') != '1') {
      if ($this->session->userdata('role_id') != '2') {
        redirect('Auth');
      }
    }

    $this->load->model('Klinik_model');
    $this->load->model('Report_model');
  }

  public function index()
  {
    // $view_data['clean_output'] = TRUE;
    $data['title'] = 'Dashboard';
    $data['jml_umum'] = $this->db->query(
      "SELECT COUNT(*) AS jml 
      FROM klinik_transaction 
      WHERE MONTH(tgl_berobat)= '" . date('m') . "' AND YEAR(tgl_berobat) = '" . date('Y') . "' AND klinik_id = 'KL001' AND status='2'"
    )->row_array();
    $data['jml_klt'] = $this->db->query(
      "SELECT COUNT(*) AS jml 
      FROM klinik_transaction 
      WHERE MONTH(tgl_berobat)= '" . date('m') . "'  AND YEAR(tgl_berobat) = '" . date('Y') . "' AND klinik_id = 'KL002' AND status='2'"
    )->row_array();
    $data['pendapatan'] = $this->db->query(
      "SELECT 
      SUM(a.total_bayar) total
      FROM billing_transaction a 
      JOIN klinik_transaction b ON b.id = a.klinik_transaction_id
      WHERE a.status_pembayaran='2' 
      AND a.is_active='1' 
      AND YEAR(b.tgl_berobat) = '" . date('Y') . "' 
      AND MONTH(b.tgl_berobat) = '" . date('m') . "'"
    )->row_array();
    // print_r($this->db->last_query());
    $this->load->view('templates/header', $data);
    $this->load->view('home/index');
    $this->load->view('templates/footer');
  }

  public function laporan_pendapatan()
  {
    $data['title'] = 'Laporan Pendapatan';

    $data['general'] = $this->Report_model->getPersonalBillingRecap($this->input->get('bln'), $this->input->get('thn'));


    $this->load->view('templates/header', $data);
    $this->load->view('home/laporan-pendapatan', $data);
    $this->load->view('templates/footer');
  }
}
