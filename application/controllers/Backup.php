<?php
defined('BASEPATH') or exit('no direct access script allowed');
class Backup extends CI_Controller
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
  }
  public function index()
  {
    $data['title'] = 'Backup Database';

    $this->load->view('templates/header', $data);
    $this->load->view('backup/index', $data);
    $this->load->view('templates/footer');
  }

  public function backup_db()
  {
    // load Class utilitas form Database
    $this->load->dbutil();

    // Aturan ketika file terdownload
    $aturan = [
      'format' => 'zip',
      'filename' => 'backup.sql'
    ];
    $backup = &$this->dbutil->backup($aturan);

    // nama database sudah ada tanggal downloadnya
    $nama_database = 'backup-simklinik-' . date('Y-m-d') . '.zip';
    $simpan = './backup' . $nama_database;

    $this->load->helper('file');
    write_file($simpan, $backup);

    $this->load->helper('download');
    force_download($nama_database, $backup);
  }
}
