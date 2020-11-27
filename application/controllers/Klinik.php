<?php
defined('BASEPATH') or exit('No direct access script allowed');
class Klinik extends CI_Controller
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
    $data['l_pemeriksaan'] = $this->Klinik_model->getListPemeriksaan($reg);

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
    $data['detail_antrean'] = $this->Klinik_model->getDetailAntrean($reg);
    $data['b_tindakan'] = $this->db->get_where('b_tindakan',  ['is_active' => '1', 'klinik_id' => $data['detail_antrean']['klinik_id']])->result_array();
    $data['l_tindakan'] = $this->Klinik_model->getListTindakan($reg);

    // prevent access jika status selain antrean
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
  public function input_pemeriksaan($reg, $klinik)
  {
    $reg = decrypt_url($reg);
    $data['title'] = "input Pemeriksaan";
    $data['l_dokter'] = $this->db->get_where('dokter', ['is_active' => '1', 'klinik_id' => $klinik])->result_array();

    $this->form_validation->set_rules('keluhan', 'Keluhan', 'required|trim');
    $this->form_validation->set_rules('pemeriksaan', 'Pemeriksaan', 'required|trim');
    $this->form_validation->set_rules('diagnosa', 'Icd 10', 'required|trim');
    if ($this->form_validation->run() === FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('klinik/proses/pemeriksaan/input-pemeriksaan', $data);
      $this->load->view('templates/footer');
    } else {
      $this->Klinik_model->inputPemeriksaan($reg);
      $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Pemeriksaan diinput</div>');
      redirect('Klinik/proses_klinik/' . encrypt_url($reg));
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

  public function searchDx()
  {
    $searchterm = $this->input->post('searchTerm');

    $response = $this->Klinik_model->getDiagnosa($searchterm);

    echo json_encode($response);
  }

  public function getNamaDx()
  {
    $id = $this->input->post('id');

    $response = $this->db->get_where('icd10', ['kode_icd10' => $id])->row_array();

    echo json_encode($response);
  }

  public function getStok()
  {
    $id = $this->input->post('id');
    $response = $this->db->get_where('b_obat', ['id' => $id])->row_array();
    echo json_encode($response);
  }
}
