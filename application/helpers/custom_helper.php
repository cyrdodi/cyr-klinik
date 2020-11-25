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

function badgeKlinik($data)
{
  switch ($data) {
    case 'KL001';
      return 'style="background-color: #16a596; color: #fff"';
    case 'KL002';
      return 'style="background-color: #e05297; color: #fff"';
    default:
      return '';
  }
}

function badgeCB($data)
{
  switch ($data) {
    case 'p1';
      return 'style="background-color: #16a596; color: #fff"';
    case 'p2';
      return 'style="background-color: #31326f; color: #fff"';
    case 'p3';
      return 'style="background-color: #db6400; color: #fff"';
    default:
      return '';
  }
}
