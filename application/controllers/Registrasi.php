<?php
defined('BASEPATH') or exit('No direct access allowed');
class Registrasi extends CI_Controller
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

    $this->load->model('Registrasi_model');
  }

  public function index()
  {
    $data['title'] = 'Registrasi';
    $data['is_keyword'] = FALSE;

    $keyword = $this->input->get('keyword');

    if ($keyword !== NULL) {
      if (strlen($keyword) > 0) {
        $data['is_keyword'] = TRUE;
        $data['search_result'] = $this->Registrasi_model->searchPasien($keyword);
      }
    }

    $this->load->view('templates/header', $data);
    $this->load->view('registrasi/index', $data);
    $this->load->view('templates/footer');
  }

  public function pasien_baru()
  {
    $data['title'] = 'Pasien Baru';
    $data['provinsi'] = $this->Registrasi_model->getProvinsi();

    $this->form_validation->set_rules('nama_lengkap', 'Nama Lengkap', 'required');
    $this->form_validation->set_rules('jk', 'Jenis Kelamin', 'required');
    $this->form_validation->set_rules('tempat_lahir', 'Tempat Lahir', 'required');
    $this->form_validation->set_rules('tgl_lhr', 'Tanggal Lahir', 'required');
    $this->form_validation->set_rules('tahun_lhr', 'Tahun Lahir', 'required');
    $this->form_validation->set_rules('bulan_lhr', 'Bulan Lahir', 'required');
    $this->form_validation->set_rules('alamat', 'Alamat', 'required');
    $this->form_validation->set_rules('provinsi', 'Provinsi', 'required');
    $this->form_validation->set_rules('kabupaten', 'Kabupaten', 'required');
    $this->form_validation->set_rules('kecamatan', 'Kecamatan', 'required');
    $this->form_validation->set_rules('kelurahan', 'Kelurahan', 'required');
    $this->form_validation->set_rules('pekerjaan', 'Pekerjaan', 'required');
    $this->form_validation->set_rules('no_hp', 'Nomor Handphone', 'required');
    $this->form_validation->set_rules('agama', 'Agama', 'required');
    $this->form_validation->set_rules('status', 'Status', 'required');
    $this->form_validation->set_rules('penjamin', 'Penjamin', 'required');
    $this->form_validation->set_rules('hubungan', 'Hubungan', 'required');

    if ($this->form_validation->run() == FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('registrasi/pasien-baru', $data);
      $this->load->view('templates/footer');
    } else {
      $mr = $this->Registrasi_model->insertDataPasien();
      $this->session->set_flashdata('data_pasien_msg', '<div class="alert alert-success" role="alert">Data pasien berhasil ditambahkan ke database</div>');
      redirect('Registrasi/pendaftaran/' . encrypt_url($mr));
    }
  }

  public function pendaftaran($mr)
  {
    $mr = decrypt_url($mr);
    $data['title'] = 'Pendaftaran';
    $data['pasien'] = $this->Registrasi_model->getDataPasien($mr);
    $data['l_klinik'] = $this->db->get('m_klinik')->result();
    /**
     * Pasien tidak bisa didaftarkan jika:
     * - Masih dalam antrean aktif 
     *    ::(klinik_transaction.status = 1)
     * - Masih dalam antrean billing aktif dan belum lunas 
     *    ::(billing_transaction.is_active = 1 AND billing_transaction. status_pembayaran = 1)
     */

    $data['antrean_aktif'] = $this->Registrasi_model->isMedrekInAntrean($mr);
    $data['billing_nunggak'] = $this->Registrasi_model->isBillingNunggak($mr);


    $this->form_validation->set_rules('medrek', 'Medrek', 'required');
    $this->form_validation->set_rules('user_id', 'User ID', 'required');
    $this->form_validation->set_rules('caraBayar', 'Cara Bayar', 'required');
    if ($this->form_validation->run() == FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('registrasi/pendaftaran', $data);
      $this->load->view('templates/footer');
    } else {
      $id_klinik = $this->Registrasi_model->insertPendaftaran();
      redirect('Klinik/proses_klinik/' . encrypt_url($id_klinik));
    }
  }


  public function test($mr)
  {
    $data = $this->Registrasi_model->isMedrekInAntrean($mr);
    var_dump($data);
  }

  /**
   * JQUERY SECTION
   */

  public function get_kabupaten_()
  {
    $provinsiId = $this->input->post('province');
    $data = $this->Registrasi_model->getKabupaten($provinsiId);
    echo json_encode($data);
  }

  public function get_kecamatan_()
  {
    $kabupatenId = $this->input->post('regency');
    $data = $this->Registrasi_model->getKecamatan($kabupatenId);
    echo json_encode($data);
  }

  public function get_kelurahan_()
  {
    $kecamatanId = $this->input->post('district');
    $data = $this->Registrasi_model->getKelurahan($kecamatanId);
    echo json_encode($data);
  }
}
