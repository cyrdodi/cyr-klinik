<?php
defined('BASEPATH') or exit('No direct access script allowed');
class Billing extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();

    if ($this->session->userdata('is_login') !== TRUE) {
      redirect('Auth');
    } else if ($this->session->userdata('role_id') != '1') {
      if ($this->session->userdata('role_id') != '2') {
        if ($this->session->userdata('petugas') != 'perawat') {
          redirect('Auth');
        }
      }
    }
    // if ($this->session->userdata('is_login') !== TRUE || $this->session->userdata('role_id') !== '1' || $this->session->userdata('role_id') !== '2' || $this->session->userdata('petugas') !== 'perawat') {
    //   redirect('Auth');
    // }

    $this->load->model('Billing_model');
    $this->load->model('Klinik_model');
  }

  public function index()
  {
    $data['title'] = 'Billing';
    $data['l_billing'] = $this->Billing_model->getAntreanBilling()->result();

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

    // prevent access jika is_active = 0
    if ($data['detail_billing']['is_active'] != 1) {
      $this->session->set_flashdata('msg', '<div class="alert alert-danger" role="alert">Billing sudah dihapus</div>');
      redirect('Billing');
    }
    $reg = $data['detail_billing']['id'];

    $data['l_admin'] = $this->Klinik_model->getListAdmin($reg);
    $data['l_tindakan'] = $this->Klinik_model->getListTindakan($reg);
    $data['l_obat'] = $this->Klinik_model->getListObat($reg);
    $data['l_pemeriksaan'] = $this->Klinik_model->getListPemeriksaan($reg);

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

  public function test_print($nobilling)
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
    $data['petugas'] = $this->session->userdata('nama_akun');
    $this->load->view('exportpdf/billing', $data);
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

    $reg = $this->db->get_where('billing_transaction', ['no_billing' => $nobilling])->row_array();
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

  public function test()
  {
    $nobilling = 'IBK/2011/00008';
    $lastlog = $this->db->query("SELECT 
    timestamp 
    FROM log_print_billing 
    WHERE no_billing = '" . $nobilling . "'
    ORDER BY id_log DESC
    LIMIT 1")->row_array();
    $lastlog = $lastlog['timestamp'];
    $now = date('Y-m-d H:i:s');
    if ($lastlog == NULL) {
      $lastlog = $now;
    }


    /**
     * add log jika 
     *  */


    $diff = (strtotime($now) - strtotime($lastlog)) / 60;
    if ($diff < 1) {
      echo "cetak log";
    }
  }
}
