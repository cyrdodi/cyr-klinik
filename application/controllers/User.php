<?php
defined('BASEPATH') or exit('no direct access script allowed');
class User extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();
  }

  public function index()
  {
    $data['title'] = 'User Setup';
    $data['users'] = $this->db->query("SELECT * FROM user WHERE id NOT IN('1')")->result_array();

    $this->load->view('templates/header', $data);
    $this->load->view('user/index', $data);
    $this->load->view('templates/footer');
  }

  public function reset_password($id)
  {
    $data['title'] = 'Reset Password';
    $id = decrypt_url($id);
    $data['user'] = $this->db->get_where('user', ['id' => $id])->row_array();

    $this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[6]|matches[password2]', ["matches" => "password don't match!", 'min_length' => 'password too short!']);
    $this->form_validation->set_rules('password2', 'Password', 'required|trim|matches[password1]');
    if ($this->form_validation->run() == false) {
      $this->load->view('templates/auth_header', $data);
      $this->load->view('user/reset-password', $data);
      $this->load->view('templates/auth_footer');
    } else {
      $data = [
        'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT)
      ];

      $this->db->update('user', $data, ['id' => $this->input->post('id')]);
      $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">user berhasil dibuat!</div>');
      redirect('user');
    }
  }

  // ajax
  public function get_user_by_id()
  {
    $result = $this->db->get_where('user', ['id' => $this->input->post('id')])->row_array();

    echo json_encode($result);
  }

  public function edit_user()
  {
    $data = [
      'nama' => $this->input->post('namauser'),
      'role_id' => $this->input->post('role'),
      'petugas' => $this->input->post('petugas'),
      'is_active' => $this->input->post('aktif'),
    ];

    $this->db->update('user', $data, ['id' => $this->input->post('id')]);
    $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">User berhasil diupdate<button type="button" class="close" data-dismiss="alert" aria-label="Close">
       <span aria-hidden="true">&times;</span>
     </button></div>');
    // redirect('Tindakan');
    echo json_encode('mantul');
  }
}
