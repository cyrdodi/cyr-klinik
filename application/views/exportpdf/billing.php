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
    padding: 10px
  }

  footer .page:after {
    content: counter(page);
  }
</style>

<body>
  <footer>
    <span class="page">Page <?php $PAGE_NUM ?></span> <span style="margin-left: 20px"> Printed at : <?= $date = date('H:i:s d-m-Y') ?></span>
    <span>
    </span>
  </footer>
  <!-- header -->
  <div class="header">
    <img class="logo" src="<?= base_url('assets/img/logo-by.png') ?>" alt="" width="80px">
    <h3>Klinik Bhakti Yuana</h3>
    <span>Jl. Multatuli No. 48</span><br>
    <span>Rangkasbitung - Lebak - Banten</span><br>
    <span>Tlp . 0252-5551022 email : klinikbhaktiyuana@gmail.com</span>
  </div>
  <hr>
  <!--  -->
  <div class="billing-detail">
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
        <td class="profil-table"><?= $detail_billing['tgl_berobat'] ?></td>
      </tr>
    </table>
  </div>
  <br>
  <div class="data-pasien">
    <h4>Biodata Pasien</h4>
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
        <th class="profil-table">Umur</th>
        <td class="profil-table"><?= $detail_billing['nama_lengkap'] ?></td>
      </tr>
      <tr>
        <th class="profil-table">Alamat</th>
        <td class="profil-table">
          <?= $detail_billing['alamat'] . ", " . $detail_billing['kelurahan'] . ", " . $detail_billing['kecamatan'] . ", " . $detail_billing['kabupaten'] . ", " . $detail_billing['provinsi'] ?>
        </td>
      </tr>
    </table>
  </div>
  <div id="content">
    <h4>Detail Billing</h4>
    <h5>Administrasi</h5>
    <table>
      <tbody>
        <?php $total = 0 ?>
        <?php foreach ($l_admin as $row) : ?>
          <tr>
            <td><?= $row['nama_admin'] ?></td>
            <td><?= number_format($row['harga']) ?></td>
          </tr>
          <?php $total += $row['harga'] ?>
        <?php endforeach; ?>
      <tfoot>
        <tr>
          <th>Total</th>
          <th>Rp. <?= number_format($total) ?></th>
        </tr>
      </tfoot>
      </tbody>
    </table>
    <h5>Tindakan</h5>
    <table>
      <tbody>
        <?php $total = 0 ?>
        <?php foreach ($l_tindakan as $row) : ?>
          <tr>
            <td><?= $row['nama_tindakan'] ?></td>
            <td><?= number_format($row['tarif']) ?></td>
          </tr>
          <?php $total += $row['tarif'] ?>
        <?php endforeach; ?>
      </tbody>
      <tfoot>
        <tr>
          <th>Total</th>
          <th>Rp. <?= number_format($total) ?></th>
        </tr>
      </tfoot>
    </table>
    <h5>Obat & Alkes</h5>
    <table>
      <thead>
        <tr>
          <th>#</th>
          <th>Obat & Alkes</th>
          <th>Harga</th>
          <th>Jumlah</th>
          <th>Total</th>
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
            <td><?= number_format($totalrow) ?></td>
          </tr>
          <?php $total += $totalrow ?>
          <?php $i++ ?>
        <?php endforeach; ?>
      </tbody>
      <tfoot>
        <tr>
          <th colspan="4">Total</th>
          <th>Rp. <?= number_format($total) ?></th>
        </tr>
      </tfoot>
    </table>
  </div>

</body>

</html>