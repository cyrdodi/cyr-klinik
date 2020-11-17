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
    $data['detail_billing'] = $this->Billing_model->getBillingDetail($nobilling);

    $reg = $data['detail_billing']['id'];

    $data['l_admin'] = $this->Klinik_model->getListAdmin($reg);
    $data['l_tindakan'] = $this->Klinik_model->getListTindakan($reg);
    $data['l_obat'] = $this->Klinik_model->getListObat($reg);

    $data['rekap_admin'] = $this->Klinik_model->getRekapAdmin($reg);
    $data['rekap_tindakan'] = $this->Klinik_model->getRekapTindakan($reg);
    $data['rekap_obat'] = $this->Klinik_model->getRekapObat($reg);

    $this->load->library('pdf');
    $this->pdf->setPaper('A4', 'portrait');

    $this->pdf->filename = "KLINIK Bhakti Yuana - Billing - " . $nobilling . " (" . date('d-m-Y') . ")";
    $this->pdf->load_view('exportpdf/billing', $data);
  }
}
