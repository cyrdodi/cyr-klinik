<?php
class MyReport extends \koolreport\KoolReport
{
  // use \koolreport\codeigniter\Friendship;
  function setup()
  {
    $this->src("sale_database")
      ->query("select * from klinik_transaction")
      ->pipe($this->dataStore("orders"));
  }
}
