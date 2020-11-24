<?php
defined('BASEPATH') or exit('No direct access script allowed');
class Tindakan extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();
    $this->load->model('Tindakan_model', 'tindakan_m');
  }

  public function index()
  {
    $data['title'] = 'Daftar Tindakan';

    $data['is_keyword'] = FALSE;
    $keyword = $this->input->get('keyword');
    $data['search_result'] = $this->db->get('b_tindakan')->result_array();
    if ($keyword !== NULL) {
      if (strlen($keyword) > 0) {
        $data['is_keyword'] = TRUE;
        $data['search_result'] = $this->tindakan_m->searchTindakan($keyword);
      }
    }


    $this->form_validation->set_rules('tindakan', 'Nama Tindakan', 'required|trim');
    $this->form_validation->set_rules('tarif', 'Tarif', 'required');
    if ($this->form_validation->run() === FALSE) {
      $this->load->view('templates/header', $data);
      $this->load->view('tindakan/index', $data);
      $this->load->view('templates/footer');
    } else {
      $this->tindakan_m->addTindakan();
      $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Item berhasil ditambahkan</div>');
      redirect('Tindakan');
    }
  }

  public function add_tag($tindakan_id)
  {
    $data['title'] = 'Add Tag';

    $data['detail_tindakan'] = $this->db->get_where('b_tindakan', ['id' => $tindakan_id])->row_array();
    $data['tags'] = $this->tindakan_m->getTagByTindakan($tindakan_id);

    if (count($data['tags']) === 0) {
      $data['l_klinik'] = $this->db->get('m_klinik')->result_array();
    } else {
      $data['l_klinik'] = $this->tindakan_m->getKlinik($tindakan_id);
    }

    $this->load->view('templates/header', $data);
    $this->load->view('tindakan/add_tag', $data);
    $this->load->view('templates/footer');
  }

  // ajax
  public function get_tindakan_by_id()
  {
    $result = $this->db->get_where('b_tindakan', ['id' => $this->input->post('id')])->row_array();

    echo json_encode($result);
  }

  public function edit_tindakan()
  {
    $this->tindakan_m->updateTindakan();
    $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Item berhasil diupdate</div>');
    // redirect('Tindakan');
    echo json_encode('mantul');
  }
}
