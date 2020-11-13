<?php
defined('BASEPATH') or exit('No direct access script allowed!');

function formatTanggal($date)
{
  return date('d-m-Y', strtotime($date));
}

function umur($date)
{
  // get umur
  $date = new DateTime($date);
  $now = new DateTime();
  $interval = $now->diff($date);
  // echo $interval->y;
  return $interval->format('%y tahun %m bulan');
}
