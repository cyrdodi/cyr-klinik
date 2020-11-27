<?php
defined('BASEPATH') or exit('No direct access script allowed');
class Dokter extends CI_Controller
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

    $this->load->model('Dokter_model', 'dokter_m');
  }

  public function index()
  {
    $data['title'] = "Manage Dokter";

    $data['l_klinik'] = $this->db->get_where('m_klinik')->result_array();

    $data['is_keyword'] = FALSE;
    $keyword = $this->input->get('keyword');
    $data['search_result'] = $this->dokter_m->getDokter();
    if ($keyword !== NULL) {
      if (strlen($keyword) > 0) {
        $data['is_keyword'] = TRUE;
        $data['search_result'] = $this->dokter_m->searchTindakan($keyword);
      }
    }

    $this->form_validation->set_rules('kodedokter', 'Kode Dokter', 'required|trim');
    $this->form_validation->set_rules('namadokter', 'Nama Dokter', 'required|trim');
    if ($this->form_validation->run() === FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('dokter/index', $data);
      $this->load->view('templates/footer');
    } else {
      $this->dokter_m->insertDokter();
      $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Dokter berhasil ditambahkan<button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button></div>');
      redirect('Dokter');
    }
  }

  // ajax
  public function get_dokter_by_id()
  {
    $result = $this->db->get_where('dokter', ['id' => $this->input->post('id')])->row_array();

    echo json_encode($result);
  }

  public function edit_dokter()
  {
    $this->dokter_m->updateDokter();
    $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Dokter berhasil diupdate<button type="button" class="close" data-dismiss="alert" aria-label="Close">
     <span aria-hidden="true">&times;</span>
   </button></div>');
    // redirect('Tindakan');
    echo json_encode('mantul');
  }
}
