<?php
require_once APPPATH . 'libraries/dompdf/autoload.inc.php';

use Dompdf\Dompdf;

class Exportpdf extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();

    $this->load->model('Billing_model');
    $this->load->model('Klinik_model');
  }

  public function billing($nobilling)
  {
    $nobilling = decrypt_url($nobilling);
    // cetakan tidak dilog jika mengklik kurang dr 15 detik
    $this->add_log($nobilling, 'billing', '');

    $data['detail_billing'] = $this->Billing_model->getBillingDetail($nobilling);
    $data['detail_klinik'] = $this->db->get_where('m_informasi', ['id' => '1'])->row_array();

    $reg = $data['detail_billing']['id'];

    $data['l_admin'] = $this->Klinik_model->getListAdmin($reg);
    $data['l_tindakan'] = $this->Klinik_model->getListTindakan($reg);
    $data['l_obat'] = $this->Klinik_model->getListObat($reg);

    $data['rekap_admin'] = $this->Klinik_model->getRekapAdmin($reg);
    $data['rekap_tindakan'] = $this->Klinik_model->getRekapTindakan($reg);
    $data['rekap_obat'] = $this->Klinik_model->getRekapObat($reg);
    $data['count_print'] = $this->Billing_model->getBillingCounter($nobilling, 'billing');
    $data['petugas'] = $this->session->userdata('nama_akun');

    $this->load->library('pdf');
    $this->pdf->setPaper('A4', 'portrait');

    $this->pdf->filename = "Billing - " . $nobilling . " (" . date('d-m-Y') . ")";
    $this->pdf->load_view('exportpdf/billing', $data);
  }

  // export pdf
  public function kwitansi()
  {
    $nobilling = $this->input->get('no_billing');
    $data['penerima'] = $this->input->get('penerima');
    $this->add_log($nobilling, 'kwitansi', $data['penerima']);
    $data['detail_billing'] = $this->Billing_model->getBillingDetail($nobilling);

    $reg = $data['detail_billing']['id'];
    $data['l_admin'] = $this->Klinik_model->getListAdmin($reg);
    $data['l_tindakan'] = $this->Klinik_model->getListTindakan($reg);
    $data['l_obat'] = $this->Klinik_model->getListObat($reg);

    $data['rekap_admin'] = $this->Klinik_model->getRekapAdmin($reg);
    $data['rekap_tindakan'] = $this->Klinik_model->getRekapTindakan($reg);
    $data['rekap_obat'] = $this->Klinik_model->getRekapObat($reg);
    $data['count_print'] = $this->Billing_model->getBillingCounter($nobilling, 'billing');
    $data['petugas'] = $this->session->userdata('nama_akun');

    $this->load->library('pdf');
    $this->pdf->setPaper('A5', 'landscape');

    $this->pdf->filename = "Kwitansi - " . $nobilling . " (" . date('d-m-Y') . ")";
    $this->pdf->load_view('exportpdf/kwitansi', $data);
  }

  public function add_log($nobilling, $jenis, $penerima)
  {
    $lastlog = $this->db->query("SELECT 
    timestamp 
    FROM log_print_billing 
    WHERE no_billing = '" . $nobilling . "'
    ORDER BY id_log DESC
    LIMIT 1")->row_array();
    $lastlog = $lastlog['timestamp'];
    $now = date('Y-m-d H:i:s');
    if ($lastlog == NULL) {
      $lastlog = '2020-11-18 07:00:00';
    }
    $diff = (strtotime($now) - strtotime($lastlog)) / 60;
    // convert to minute
    $diff = $diff * 60;

    if ($diff > 15) {
      $this->Billing_model->addPrintLog($nobilling, $jenis, $penerima);
    }
  }
}
