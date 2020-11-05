<?php
defined('BASEPATH') or exit('no direct access script allowed');
class Auth extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();
  }

  public function index()
  {
    $this->form_validation->set_rules('username', 'Username', 'required|trim');
    $this->form_validation->set_rules('password', 'Password', 'required|trim');
    if ($this->form_validation->run() == FALSE) {
      $data['title'] = 'Login';
      $this->load->view('templates/auth_header', $data);
      $this->load->view('auth/login', $data);
      $this->load->view('templates/auth_footer');
    } else {
      $this->_login();
    }
  }

  public function _login()
  {
    $username = htmlspecialchars($this->input->post('username', TRUE));
    $password = htmlspecialchars($this->input->post('password', TRUE));

    $user = $this->db->get_where('user', ['username' => $username])->row_array();
    // user ada
    if ($user) {
      if ($user['is_active'] == 1) {
        // cek password
        if (password_verify($password, $user['password'])) {
          $data = [
            'user_id' => $user['id'],
            'nama_akun' => $user['nama'],
            'username' => $user['username'],
            'role_id' => $user['role_id']
          ];
          $this->session->set_userdata($data);
          redirect('Home');
        } else {
          $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Password salah!</div>');
          redirect('Auth');
        }
      } else {
        $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">User ini tidak aktif!</div>');
        redirect('Auth');
      }
    } else {
      $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Login gagal!</div>');
      redirect('Auth');
    }
  }

  public function registration()
  {
    // form validation required dan trim=spasi sebelum dan sesudah value agar dihapus
    $this->form_validation->set_rules('nama', 'Name', 'required|trim');
    $this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[6]|matches[password2]', ["matches" => "password don't match!", 'min_length' => 'password too short!']);
    $this->form_validation->set_rules('password2', 'Password', 'required|trim|matches[password1]');
    if ($this->form_validation->run() == false) {
      $data["judul"] = 'Registration';
      $this->load->view('templates/auth_header', $data);
      $this->load->view('auth/registration');
      $this->load->view('templates/auth_header');
    } else {
      $data = [
        'username' => htmlspecialchars($this->input->post('username', true)),
        'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
        'nama' => htmlspecialchars($this->input->post('nama', true)),
        'role_id' => 1,
        'is_active' => 1
      ];

      $this->db->insert('user', $data);
      $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Akun anda sudah berhasil dibuat!</div>');
      redirect('auth');
    }
  }

  public function logout()
  {
    $this->session->unset_userdata('nama_akun');
    $this->session->unset_userdata('username');
    $this->session->unset_userdata('role_id');

    $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Anda sudah logout</div>');
    redirect('auth');
  }
}
