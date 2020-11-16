<?php
$totalall = $rekap_admin['total'] + $rekap_tindakan['total'] + $rekap_obat['total']
?>

<div class="font-weight-bold mb-4">BILLING TIDAK SESUAI</div>
<div class="alert alert-danger">
  <h4>Total pembayaran billing dan detail transaksi tidak sesuai</h4>
  <h4>Nomor Billing = <?= $detail_billing['no_billing'] ?></h4>
  <hr>
  <a href="<?= base_url('Billing/hapus_billing/' . $detail_billing['no_billing']) ?>" class="btn btn-primary">Hapus Billing</a>
</div>
<div class="row">
  <div class="col-lg-6">
    <div class="card shadow mb-4">
      <div class="card-body">
        <div class="font-weight-bold text-primary text-uppercase mb-1">Detail Transaksi</div>
        <div class="font-weight-bold text-uppercase mb-1">Rekap Biaya Transaksi</div>
        <div class="row">
          <div class="col">
            <table class="table table-sm ">
              <tbody>
                <tr>
                  <td>Administrasi</td>
                  <td class="text-right"><?= number_format($rekap_admin['total']) ?></td>
                </tr>
                <tr>
                  <td>Tindakan</td>
                  <td class="text-right"><?= number_format($rekap_tindakan['total']) ?></td>
                </tr>
                <tr>
                  <td>Obat & Alkes</td>
                  <td class="text-right"><?= number_format($rekap_obat['total']) ?></td>
                </tr>
              </tbody>
              <tfoot>
                <tr>
                  <th>Total</th>
                  <th class="text-right">Rp. <?= number_format($totalall) ?></th>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
        <div class="font-weight-bold">Administrasi</div>
        <table class="table table-sm table-striped">
          <thead>
            <tr>
              <th>No</th>
              <th>Nama</th>
              <th class="text-right">Tarif</th>
            </tr>
          </thead>
          <tbody>
            <?php $i = 1; ?>
            <?php $total = 0 ?>
            <?php foreach ($l_admin as $admin) : ?>
              <tr>
                <td><?= $i ?></td>
                <td><?= $admin['nama_admin'] ?></td>
                <td class="text-right "><?= number_format($admin['harga']) ?></td>
              </tr>
              <?php $total += $admin['harga'] ?>
              <?php $i++ ?>
            <?php endforeach; ?>
          </tbody>
          <tfoot>
            <tr>
              <th colspan="2">Total</th>
              <th class="text-right text-info"><?= number_format($total) ?></th>
            </tr>
          </tfoot>
        </table>
        <div class="font-weight-bold">Tindakan</div>
        <table class="table table-sm table-striped">
          <thead>
            <tr>
              <th>No</th>
              <th>Nama Tindakan</th>
              <th class="text-right">Tarif</th>
            </tr>
          </thead>
          <tbody>
            <?php $i = 1; ?>
            <?php $total = 0 ?>
            <?php foreach ($l_tindakan as $tindakan) : ?>
              <tr>
                <td><?= $i ?></td>
                <td><?= $tindakan['nama_tindakan'] ?></td>
                <td class="text-right"><?= number_format($tindakan['tarif']) ?></td>
              </tr>
              <?php $total += $tindakan['tarif'] ?>
              <?php $i++ ?>
            <?php endforeach; ?>
          </tbody>
          <tfoot>
            <tr>
              <th colspan="2">Total</th>
              <th class="text-right text-info"><?= number_format($total) ?></th>
            </tr>
          </tfoot>
        </table>
        <div class="font-weight-bold">Obat & Alkes</div>
        <table class="table table-sm table-striped">
          <thead>
            <tr>
              <th>No</th>
              <th>Nama Obat & Alkes</th>
              <th class="text-right">Harga</th>
              <th class="text-right">Jumlah</th>
              <th class="text-right">Total</th>
            </tr>
          </thead>
          <tbody>
            <?php $i = 1; ?>
            <?php $total = 0; ?>
            <?php foreach ($l_obat as $obat) : ?>
              <?php $totalrow = $obat['harga'] * $obat['jumlah'] ?>
              <tr>
                <td><?= $i ?></td>
                <td><?= $obat['nama_obat'] . ' / ' . $obat['satuan'] ?></td>
                <td class="text-right"><?= number_format($obat['harga'])  ?></td>
                <td class="text-right"><?= number_format($obat['jumlah']) ?></td>
                <td class="text-right"><?= number_format($totalrow) ?></td>
              </tr>
              <?php $total += $totalrow; ?>
              <?php $i++ ?>
            <?php endforeach; ?>
          </tbody>
          <tfoot>
            <tr>
              <th colspan="4">Total</th>
              <th class="text-right text-info"><?= number_format($total) ?></th>
            </tr>
          </tfoot>
        </table>

      </div>
    </div>
  </div>
  <div class="col-lg-6">
    <div class="card shadow">
      <div class="card-body">
        <div class="font-weight-bold text-primary text-uppercase mb-1">Detail Rekap Billing</div>
        <div class="row no-gutters align-items-center">
          <div class="col mb-4 mr-2">
            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Rekap Biaya</div>
            <div class="h5 mb-0 font-weight-bold text-gray-800">Rp. <?= number_format($detail_billing['total_bayar']) ?></div>
          </div>
          <div class="col-auto">
            <i class="fas fa-money-bill-alt fa-2x text-gray-300"></i>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <table class="table table-sm ">
              <tbody>
                <tr>
                  <td>Administrasi</td>
                  <td class="text-right text-info"><?= number_format($detail_billing['total_administrasi']) ?></td>
                </tr>
                <tr>
                  <td>Tindakan</td>
                  <td class="text-right text-info"><?= number_format($detail_billing['total_tindakan']) ?></td>
                </tr>
                <tr>
                  <td>Obat & Alkes</td>
                  <td class="text-right text-info"><?= number_format($detail_billing['total_obat']) ?></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>