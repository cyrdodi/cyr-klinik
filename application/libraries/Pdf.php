<?php
defined('BASEPATH') or exit('No direct access script allowed');

use Dompdf\Dompdf;
use Dompdf\Options;

class Pdf extends Dompdf
{
  public $filename;
  public function __construct()
  {
    parent::__construct();
    $this->filename = "Laporan.pdf";
  }

  protected function ci()
  {
    return get_instance();
  }

  public function load_view($view, $data = array())
  {
    // link enabled for image link
    $options = new Options();
    $options->setIsRemoteEnabled(true);

    $this->setOptions($options);
    $this->output();
    // end image link

    $html = $this->ci()->load->view($view, $data, TRUE);
    $this->load_html($html);
    $this->render();
    $this->stream($this->filename, ["Attachment" => 1]);
  }
}
