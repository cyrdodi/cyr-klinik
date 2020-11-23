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

function badgePembayaran($status)
{

  if ($status == '1') {
    return '<div class="badge badge-warning">Belum dibayar</div>';
  } else if ($status == '2') {
    return '<div class="badge badge-success">Lunas</div>';
  }
}

function redRow($data)
{
  if ($data == '0') {
    return 'background-color: #ec5858; color: #fff';
  }
}
