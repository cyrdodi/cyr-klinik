<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


  <title>Document</title>
</head>
<style>
  @font-face {
    font-family: fontku;
    src: url('<?= site_url(); ?>/assets/fonts/RobotoSlab.ttf');
  }

  body {
    font-family: fontku, arial, sans-serif;
    font-size: 14px;
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
</style>

<body>
  <footer>
    <span class="page">Halaman <?php $PAGE_NUM ?></span>
    <span style="margin-left: 20px"> Tanggal cetak : <?= $date = date('H:i:s d-m-Y') ?></span>
    <span style="margin-left: 20px">Cetakan ke- <?= $count_print ?></span>
    <span style="float: right; color: #aaaaaa">| cyrdodi</span>
    <span>
    </span>
  </footer>
  <!-- header -->
  <div class="header">
    <img class="logo" src="<?= base_url('assets/img/logo-by.png') ?>" alt="" width="80px" style="float:right;">
    <h3>Klinik Bhakti Yuana</h3>
    <span class="serif-font">Jl. Multatuli No. 48</span><br>
    <span class="serif-font">Rangkasbitung - Lebak - Banten</span><br>
    <span class="serif-font">Tlp . 0252-5551022 email : klinikbhaktiyuana@gmail.com</span>
  </div>
  <hr>
  <!--  -->
  <div class="billing-detail">
    <div id="cara-bayar"><?= $detail_billing['pembayaran'] ?></div>
    <table>
      <tr>
        <th class="profil-table" style="width: 200px">Nomor Billing</th>
        <td class="profil-table"><?= $detail_billing['no_billing'] ?></td>
      </tr>
      <tr>
        <th class="profil-table">Nomor Registrasi</th>
        <td class="profil-table"><?= $detail_billing['id'] ?></td>
      </tr>
      <tr>
        <th class="profil-table">Tanggal Berobat</th>
        <td class="profil-table"><?= formatTanggal($detail_billing['tgl_berobat']) ?></td>
      </tr>
    </table>
    <table>
      <tr>
        <th class="profil-table" style="width: 200px">Nama Pasien</th>
        <td class="profil-table"><?= $detail_billing['nama_lengkap'] ?></td>
      </tr>
      <tr>
        <th class="profil-table">Medical Record</th>
        <td class="profil-table"><?= $detail_billing['medrek'] ?></td>
      </tr>
      <tr>
        <th class="profil-table">Jenis Kelamin</th>
        <td class="profil-table"><?= $detail_billing['jk'] == 'l' ? "Laki-laki" : "Perempuan"  ?></td>
      </tr>
      <tr>
        <th class="profil-table">Alamat</th>
        <td class="profil-table">
          <?= $detail_billing['alamat'] . ", " . $detail_billing['kelurahan'] . ", " . $detail_billing['kecamatan'] . ", " . $detail_billing['kabupaten'] . ", " . $detail_billing['provinsi'] ?>
        </td>
      </tr>
    </table>
  </div>

  <br>
  <div id="content">
    <table>
      <thead>
        <tr>
          <th colspan="2">Rincian Biaya Administrasi & Biaya Lainnya</th>
        </tr>
      </thead>
      <tbody>
        <?php $total = 0 ?>
        <?php foreach ($l_admin as $row) : ?>
          <tr>
            <td><?= $row['nama_admin'] ?></td>
            <td width="100px" class="text-right"><?= number_format($row['harga']) ?></td>
          </tr>
          <?php $total += $row['harga'] ?>
        <?php endforeach; ?>
      <tfoot>
        <tr class="subtotal">
          <th>Sub Total</th>
          <th class="text-right">Rp. <?= number_format($total) ?></th>
        </tr>
      </tfoot>
      </tbody>
    </table>
    <br>
    <table>
      <thead>
        <tr>
          <th colspan="2">Rincian Tindakan Medis</th>
        </tr>
      </thead>
      <tbody>
        <?php $total = 0 ?>
        <?php foreach ($l_tindakan as $row) : ?>
          <tr>
            <td><?= $row['nama_tindakan'] ?></td>
            <td width="100px" class="text-right"><?= number_format($row['tarif']) ?></td>
          </tr>
          <?php $total += $row['tarif'] ?>
        <?php endforeach; ?>
      </tbody>
      <tfoot>
        <tr class="subtotal">
          <th>Sub Total</th>
          <th class="text-right">Rp. <?= number_format($total) ?></th>
        </tr>
      </tfoot>
    </table>
    <br>
    <table>
      <thead>
        <tr>
          <th colspan="5">Rincian Obat & Alkes</th>
        </tr>
        <tr>
          <th>#</th>
          <th>Obat & Alkes</th>
          <th>Harga</th>
          <th>Jumlah</th>
          <th class="text-right">Total</th>
        </tr>
      </thead>
      <tbody>
        <?php $i = 1 ?>
        <?php $total = 0 ?>
        <?php foreach ($l_obat as $row) : ?>
          <?php $totalrow = $row['harga'] * $row['jumlah'] ?>
          <tr>
            <td><?= $i ?></td>
            <td><?= $row['nama_obat'] . ' / ' . $row['satuan'] ?></td>
            <td><?= number_format($row['harga']) ?></td>
            <td><?= $row['jumlah'] ?></td>
            <td width="100px" class="text-right"><?= number_format($totalrow) ?></td>
          </tr>
          <?php $total += $totalrow ?>
          <?php $i++ ?>
        <?php endforeach; ?>
      </tbody>
      <tfoot>
        <tr class="subtotal">
          <th colspan="4">Sub Total</th>
          <th class="text-right">Rp. <?= number_format($total) ?></th>
        </tr>
      </tfoot>
    </table>
  </div>
  <br>
  <div class="rekap">
    <table>
      <thead>
        <tr>
          <th colspan="2">Rekap Biaya</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Biaya Administrasi & Lainnya</td>
          <td width="100px" class="text-right"><?= number_format($detail_billing['total_administrasi'])  ?></td>
        </tr>
        <tr>
          <td>Tindakan Medis</td>
          <td width="100px" class="text-right"><?= number_format($detail_billing['total_tindakan'])  ?></td>
        </tr>
        <tr>
          <td>Obat & Alkes</td>
          <td width="100px" class="text-right"><?= number_format($detail_billing['total_obat'])  ?></td>
        </tr>
      </tbody>
      <tfoot>
        <tr class="subtotal">
          <th style="text-align: right;">Jumlah yang harus dibayarkan</th>
          <th style="text-align: right;">Rp. <?= number_format($detail_billing['total_bayar']) ?></th>
        </tr>
      </tfoot>
    </table>
  </div>
</body>

</html>