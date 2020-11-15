<style>
  .scroll {
    max-height: 500px;
    overflow-y: auto;
  }
</style>
<div class="font-weight-bold mb-4">BILLING DETAIL</div>
<div class="row">
  <div class="col mb-4">
    <div class="card shadow">
      <div class="card-body p-4">
        <div class="row">
          <div class="col-auto">
            <i class="fas fa-user-circle fa-4x mr-4 mb-4"></i>
          </div>
          <div class="row">
            <div class="col">
              <h4><?= $detail_trans['nama_lengkap'] ?></h4>
              <p>#<?= $detail_trans['id'] . " / " . $detail_trans['medrek'] ?></p>
              <div><?= $detail_trans['jk'] == 'l' ? "Laki-laki" : "Perempuan" ?> / <?= umur($detail_trans['tgl_lahir']) ?></div>
              <div>
                <?= $detail_trans['alamat'] . ", " . $detail_trans['kelurahan'] . ", " . $detail_trans['kecamatan'] . ", " . $detail_trans['kabupaten'] . ", " . $detail_trans['provinsi'] ?>
              </div>

            </div>
          </div>
          <div class="col text-right">
            <div class="badge badge-primary "><?= $detail_trans['pembayaran'] ?></div>
            <div class="font-weight-bold">Tanggal berobat</div>
            <p><?= formatTanggal($detail_trans['tgl_berobat']) ?></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-lg-8">
    <div class="card shadow mb-4 h-100 ">
      <div class="card-body">
        <div class="font-weight-bold mb-2">Detail Billing</div>
        <div class="row">
          <div class="col scroll">
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
                    <td class="text-right"><?= number_format($admin['harga']) ?></td>

                  </tr>
                  <?php $total += $admin['harga'] ?>
                  <?php $i++ ?>
                <?php endforeach; ?>
              </tbody>
              <thead>
                <tr>
                  <th colspan="2">Total</th>
                  <th class="text-right"><?= number_format($total) ?></th>
                </tr>
              </thead>
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
              <thead>
                <tr>
                  <th colspan="2">Total</th>
                  <th class="text-right"><?= number_format($total) ?></th>
                </tr>
              </thead>
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
                  <th class="text-right"><?= number_format($total) ?></th>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>

      </div>
    </div>
  </div>
  <div class="col-lg-4">
    <div class="card shadow mb-4 h-100">
      <div class="card-body">

      </div>
    </div>
  </div>

</div>