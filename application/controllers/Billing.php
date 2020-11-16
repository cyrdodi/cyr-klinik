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

  public function pencarian()
  {
    $data['title'] = 'Pencarian Billing';
    $data['is_keyword'] = FALSE;

    $keyword = $this->input->get('keyword');

    if ($keyword !== NULL) {
      if (strlen($keyword) > 0) {
        $data['is_keyword'] = TRUE;
        $data['search_result'] = $this->Billing_model->searchPasien($keyword);
      }
    }

    $this->load->view('templates/header', $data);
    $this->load->view('billing/pencarian', $data);
    $this->load->view('templates/footer');
  }

  public function billing_detail($nobilling)
  {
    $nobilling = decrypt_url($nobilling);

    $data['title'] = 'Billing Detail';
    $data['detail_billing'] = $this->Billing_model->getBillingDetail($nobilling);

    $reg = $data['detail_billing']['id'];

    $data['l_admin'] = $this->Klinik_model->getListAdmin($reg);
    $data['l_tindakan'] = $this->Klinik_model->getListTindakan($reg);
    $data['l_obat'] = $this->Klinik_model->getListObat($reg);

    $data['rekap_admin'] = $this->Klinik_model->getRekapAdmin($reg);
    $data['rekap_tindakan'] = $this->Klinik_model->getRekapTindakan($reg);
    $data['rekap_obat'] = $this->Klinik_model->getRekapObat($reg);

    $total_detail = $data['rekap_admin']['total'] + $data['rekap_tindakan']['total'] + $data['rekap_obat']['total'];

    // cek apakah total bayar di billing dan di detail transaksi sesuai
    if ($total_detail == $data['detail_billing']['total_bayar']) {
      $this->load->view('templates/header', $data);
      $this->load->view('billing/billing-detail', $data);
      $this->load->view('templates/footer');
    } else {
      redirect('Billing/billing_not_legit/' . encrypt_url($nobilling));
    }
  }

  public function billing_not_legit($nobilling)
  {
    $nobilling = decrypt_url($nobilling);
    $data['title'] = 'Billing bermasalah';
    $data['detail_billing'] = $this->Billing_model->getBillingDetail($nobilling);
    $reg = $data['detail_billing']['id'];

    $data['l_admin'] = $this->Klinik_model->getListAdmin($reg);
    $data['l_tindakan'] = $this->Klinik_model->getListTindakan($reg);
    $data['l_obat'] = $this->Klinik_model->getListObat($reg);

    $data['rekap_admin'] = $this->Klinik_model->getRekapAdmin($reg);
    $data['rekap_tindakan'] = $this->Klinik_model->getRekapTindakan($reg);
    $data['rekap_obat'] = $this->Klinik_model->getRekapObat($reg);

    $this->load->view('templates/header', $data);
    $this->load->view('billing/billing-not-legit', $data);
    $this->load->view('templates/footer');
  }

  public function hapus_billing($nobilling)
  {
    $nobilling = decrypt_url($nobilling);

    $reg = $this->db->get_where('Billing_transaction', ['no_billing' => $nobilling])->row_array();
    $reg = $reg['klinik_transaction_id'];

    $this->Billing_model->nonAktifBilling($nobilling);
    $this->Klinik_model->updateStatusKlinikTransaction($reg, '1');

    $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Billing sudah dihapus dan data dikembalikan ke antrean klinik</div>');
    redirect('Klinik/proses_klinik/' . encrypt_url($reg));
  }

  public function simpan_billing($nobilling)
  {
    $nobilling = decrypt_url($nobilling);

    $this->Billing_model->simpanBilling($nobilling);

    $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Billing sudah disimpan, silahkan cetak kwitansi</div>');
    redirect('Billing/billing_detail/' . encrypt_url($nobilling));
  }
}
