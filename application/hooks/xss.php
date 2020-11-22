<?php
class xss
{
  function xss_clean()
  {
    $CI = &get_instance();
    // echo "hooker used";
    var_dump($CI->data);
  }
}
