<?php
function penyebut($nilai)
{
  $nilai = abs($nilai);
  $huruf = array("", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
  $temp = "";
  if ($nilai < 12) {
    $temp = " " . $huruf[$nilai];
  } else if ($nilai < 20) {
    $temp = penyebut($nilai - 10) . " belas";
  } else if ($nilai < 100) {
    $temp = penyebut($nilai / 10) . " puluh" . penyebut($nilai % 10);
  } else if ($nilai < 200) {
    $temp = " seratus" . penyebut($nilai - 100);
  } else if ($nilai < 1000) {
    $temp = penyebut($nilai / 100) . " ratus" . penyebut($nilai % 100);
  } else if ($nilai < 2000) {
    $temp = " seribu" . penyebut($nilai - 1000);
  } else if ($nilai < 1000000) {
    $temp = penyebut($nilai / 1000) . " ribu" . penyebut($nilai % 1000);
  } else if ($nilai < 1000000000) {
    $temp = penyebut($nilai / 1000000) . " juta" . penyebut($nilai % 1000000);
  } else if ($nilai < 1000000000000) {
    $temp = penyebut($nilai / 1000000000) . " milyar" . penyebut(fmod($nilai, 1000000000));
  } else if ($nilai < 1000000000000000) {
    $temp = penyebut($nilai / 1000000000000) . " trilyun" . penyebut(fmod($nilai, 1000000000000));
  }
  return $temp;
}

function terbilang($nilai)
{
  if ($nilai < 0) {
    $hasil = "minus " . trim(penyebut($nilai));
  } else {
    $hasil = trim(penyebut($nilai));
  }
  return $hasil;
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


  <title>Document</title>
</head>
<style>
  body {
    font-family: arial, sans-serif;
    font-size: 13px;
  }

  @page {
    margin: 20px;
  }

  body {
    margin: 0px;
  }

  .bordered {
    border-style: solid;
    padding: 10px;

  }


  table {
    border-collapse: collapse;
    width: 100%;
  }

  td,
  th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
  }

  .profil-table {
    border: none;
  }

  .card {
    border: 1px;
  }

  /* Footer */
  footer {
    position: fixed;
    bottom: -60px;
    left: 0px;
    right: 0px;
    background-color: #f4f4f4;
    height: 30px;
    padding: 10px 20px;
  }

  footer .page:after {
    content: counter(page);
  }

  .subtotal {
    background-color: #9ad3bc;
  }

  .text-right {
    text-align: right;
  }

  #cara-bayar {
    float: right;
    margin-bottom: 10px;
    border-style: solid;
    border-radius: 10px;
    border-width: thin;
    margin: 5px;
    padding: 3px 6px;
  }

  #terbilang {
    font-style: italic;
    font-size: 16px;
    background-color: #9ad3bc;
    padding: 5px;
  }

  .border-top {
    border-right: none;
    border-left: none;
    border-bottom: none;
    margin-right: 10px;
  }
</style>

<body>
  <div class="bordered">


    <!-- header -->
    <div class="header">
      <img class="logo" src="<?= base_url('assets/img/logo-by.png') ?>" alt="" width="80px" style="float:right;">
      <h3>Klinik Bhakti Yuana</h3>
      <span class="serif-font">Jl. Multatuli No. 48</span><br>
      <span class="serif-font">Rangkasbitung - Lebak - Banten</span><br>
      <span class="serif-font">Tlp . 0252-5551022 email : klinikbhaktiyuana@gmail.com</span>
    </div>
    <hr>
    <h4>Kwitansi Pelayanan Rawat Jalan</h4>
    <!--  -->
    <div class="billing-detail">
      <table>
        <tr>
          <th class="profil-table" style="width: 200px">Terima dari</th>
          <td class="profil-table">: <?= $penerima ?></td>
        </tr>
        <tr>
          <th class="profil-table" style="width: 150px">Pembayaran</th>
          <td class="profil-table">: Pelayanan Rawat Jalan</td>
        </tr>
        <tr>
          <th class="profil-table">No Billing/Registrasi</th>
          <td class="profil-table">: <?= $detail_billing['no_billing'] . ' / ' . $detail_billing['id'] ?></td>
        </tr>
        <tr>
          <th class="profil-table">Nama Pasien/MR</th>
          <td class="profil-table">: <?= $detail_billing['nama_lengkap'] . ' / ' . $detail_billing['medrek'] ?></td>
        </tr>
      </table>
    </div>
    <hr>
    <p>Terbilang</p>
    <div id="terbilang">
      <span><?= ucfirst(terbilang($detail_billing['total_bayar'])) ?> rupiah</span>
    </div>
    <table>
      <tr>
        <th rowspan="4" class="profil-table" style="font-size: 24px">
          Rp. <?= number_format($detail_billing['total_bayar']) ?>
        </th>
        <td style="text-align: center;" class="profil-table">
          <?= formatTanggal(date('d-m-Y')) ?>
        </td>
      </tr>
      <tr>
        <td class="profil-table"></td>
      </tr>
      <tr>
        <td class="profil-table"></td>
      </tr>
      <tr>
        <td style="text-align: center;" class="border-top"><?= $petugas ?></td>
      </tr>
    </table>
  </div>
</body>

</html>