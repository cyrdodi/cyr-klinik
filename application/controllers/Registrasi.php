<?php
defined('BASEPATH') or exit('No direct access allowed');
class Registrasi extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();

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

    $this->form_validation->set_rules('nama_depan', 'Nama Depan', 'required');
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
    } else if ($this->Registrasi_model->insertDataPasien()) {
      $this->session->set_flashdata('data_pasien_msg', '<div class="alert alert-success" role="alert">Data pasien berhasil ditambahkan ke database</div>');
      redirect('Registrasi/pasien_baru');
    } else {
      $this->session->set_flashdata('data_pasien_msg', '<div class="alert alert-danger" role="alert">Data pasien gagal ditambahkan ke database</div>');
      redirect();
    }
  }

  public function pendaftaran($mr)
  {
    $data['title'] = 'Pendaftaran';
    $data['pasien'] = $this->Registrasi_model->getDataPasien($mr);


    $this->load->view('templates/header', $data);
    $this->load->view('registrasi/pendaftaran', $data);
    $this->load->view('templates/footer');
  }

  public function proses_klinik()
  {
    $data['title'] = 'Proses Klinik';
  }

  public function test()
  {
    $data = $this->Registrasi_model->generateMedrek();
    echo $data;
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
