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
    $reg = decrypt_url($reg);
    $data['title'] = 'Proses Klinik';
    $data['detail_antrean'] = $this->Klinik_model->getDetailAntrean($reg);
    $data['pasien'] = $this->Klinik_model->getDetailPasien($data['detail_antrean']['medrek']);

    // prevent access jika status selain antrean 1
    // 1 = Antrean
    // 2 = Selesai
    // 3 = Batal
    if ($data['detail_antrean']['status'] != 1) {
      $this->session->set_flashdata('msg', '<div class="alert alert-danger" role="alert">Pasien bukan dalam antrean</div>');
      redirect('Klinik');
    }

    $data['l_admin'] = $this->Klinik_model->getListAdmin($reg);
    $data['l_tindakan'] = $this->Klinik_model->getListTindakan($reg);
    $data['l_obat'] = $this->Klinik_model->getListObat($reg);

    $data['rekap_admin'] = $this->Klinik_model->getRekapAdmin($reg);
    $data['rekap_tindakan'] = $this->Klinik_model->getRekapTindakan($reg);
    $data['rekap_obat'] = $this->Klinik_model->getRekapObat($reg);

    // check if eligible for delete
    $data['deletable'] = FALSE;
    if (empty($data['l_admin'])) {
      if (empty($data['l_tindakan'])) {
        if (empty($data['l_obat'])) {
          $data['deletable'] = TRUE;
        }
      }
    }
    $this->load->view('templates/header', $data);
    $this->load->view('klinik/proses/index', $data);
    $this->load->view('templates/footer');
  }

  public function input_admin($reg)
  {
    $reg = decrypt_url($reg);
    $data['title'] = 'Input Admin';
    $data['b_admin'] = $this->db->get('b_admin')->result_array();
    $data['l_admin'] = $this->Klinik_model->getListAdmin($reg);

    // prevent access jika status selain antrean
    $data['detail_antrean'] = $this->Klinik_model->getDetailAntrean($reg);
    if ($data['detail_antrean']['status'] != 1) {
      $this->session->set_flashdata('msg', '<div class="alert alert-danger" role="alert">Pasien bukan dalam antrean</div>');
      redirect('Klinik');
    }

    $this->form_validation->set_rules('admin', 'Admin', 'required');
    if ($this->form_validation->run() == FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('klinik/proses/admin/input-admin', $data);
      $this->load->view('templates/footer');
    } else {
      $this->Klinik_model->inputBiayaAdmin($reg);
      $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Biaya admin berhasil diinput</div>');
      redirect('Klinik/input_admin/' . encrypt_url($reg));
    }
  }

  public function input_tindakan($reg)
  {
    $reg = decrypt_url($reg);
    $data['title'] = 'Input Tindakan';
    $data['b_tindakan'] = $this->db->get('b_tindakan')->result_array();
    $data['l_tindakan'] = $this->Klinik_model->getListTindakan($reg);

    // prevent access jika status selain antrean
    $data['detail_antrean'] = $this->Klinik_model->getDetailAntrean($reg);
    if ($data['detail_antrean']['status'] != 1) {
      $this->session->set_flashdata('msg', '<div class="alert alert-danger" role="alert">Pasien bukan dalam antrean</div>');
      redirect('Klinik');
    }

    $this->form_validation->set_rules('tindakan', 'tindakan', 'required');
    if ($this->form_validation->run() == FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('klinik/proses/tindakan/input-tindakan', $data);
      $this->load->view('templates/footer');
    } else {
      $this->Klinik_model->inputBiayaTindakan($reg);
      $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Tindakan berhasil diinput</div>');
      redirect('Klinik/input_tindakan/' . encrypt_url($reg));
    }
  }

  public function input_obat($reg)
  {
    $reg = decrypt_url($reg);
    $data['title'] = 'Input Obat & Alkes';
    $data['b_obat'] = $this->Klinik_model->getObat();
    $data['l_obat'] = $this->Klinik_model->getListObat($reg);

    // prevent access jika status selain antrean
    $data['detail_antrean'] = $this->Klinik_model->getDetailAntrean($reg);
    if ($data['detail_antrean']['status'] != 1) {
      $this->session->set_flashdata('msg', '<div class="alert alert-danger" role="alert">Pasien bukan dalam antrean</div>');
      redirect('Klinik');
    }

    $this->form_validation->set_rules('obat', 'obat', 'required');
    $this->form_validation->set_rules('jumlah', 'Jumlah', 'required');
    if ($this->form_validation->run() == FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('klinik/proses/obat/input-obat', $data);
      $this->load->view('templates/footer');
    } else {
      $this->Klinik_model->inputBiayaObat($reg);
      $this->Klinik_model->penguranganStokObat();
      $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Obat berhasil diinput</div>');
      redirect('Klinik/input_obat/' . encrypt_url($reg));
    }
  }

  public function delete_obat($id)
  {
    $id = decrypt_url($id);
    $trans_obat = $this->db->get_where('t_obat', ['id' => $id])->row_array();
    $this->Klinik_model->penambahanStokObat($trans_obat['b_obat_id'], $trans_obat['jumlah']);
    $this->db->delete('t_obat', ['id' => $id]);
    $this->session->set_flashdata('msg_delete', '<div class="alert alert-success" role="alert">Obat berhasil dihapus</div>');
    redirect('Klinik/input_obat/' . encrypt_url($trans_obat['klinik_transaction_id']));
  }

  public function delete_tindakan($id)
  {
    $id = decrypt_url($id);
    $reg = $this->db->get_where('t_tindakan', ['id' => $id])->row_array();
    $this->db->delete('t_tindakan', ['id' => $id]);
    $this->session->set_flashdata('msg_delete', '<div class="alert alert-success" role="alert">Tindakan berhasil dihapus</div>');
    redirect('Klinik/input_tindakan/' . encrypt_url($reg['klinik_transaction_id']));
  }

  public function delete_admin($id)
  {
    $id = decrypt_url($id);
    $reg = $this->db->get_where('t_admin', ['id' => $id])->row_array();
    $this->db->delete('t_admin', ['id' => $id]);
    $this->session->set_flashdata('msg_delete', '<div class="alert alert-success" role="alert">Biaya Administrasi berhasil dihapus</div>');
    redirect('Klinik/input_admin/' . encrypt_url($reg['klinik_transaction_id']));
  }

  public function simpan_transaksi($reg)
  {
    $reg = decrypt_url($reg);

    // ubah status klinik transaction menjadi selesai
    $this->Klinik_model->updateStatusKlinikTransaction($reg, '2');
    // buat nomor kuitansi
    $nobilling = $this->Klinik_model->insertBilling($reg);

    redirect('Billing/billing_detail/' . encrypt_url($nobilling));
  }

  public function ubah_cara_bayar()
  {
    $get = $this->input->get();

    $data = [
      'cara_bayar' => $get['carabayar'],
    ];

    $this->db->update('klinik_transaction', $data, ['id' => $get['noreg']]);

    $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Cara bayar berhasil dirubah menjadi ' . $get['carabayar'] . '</div>');
    redirect('Klinik/proses_klinik/' . encrypt_url($get['noreg']));
  }

  public function batalkan_antrean($reg)
  {
    $reg = decrypt_url($reg);
    $data = [
      'status' => '3'
    ];

    $this->db->update('klinik_transaction', $data, ['id' => $reg]);
    $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Antrean berhasil dibatalkan</div>');
    redirect('Klinik');
  }

  // ajax
  public function searchObat()
  {
    $searchterm = $this->input->post('searchTerm');

    $response = $this->Klinik_model->getObat($searchterm);

    echo json_encode($response);
  }

  public function getStok()
  {
    $id = $this->input->post('id');
    $response = $this->db->get_where('b_obat', ['id' => $id])->row_array();
    echo json_encode($response);
  }
}
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
