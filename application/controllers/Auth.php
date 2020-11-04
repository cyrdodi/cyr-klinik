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
  }
}
