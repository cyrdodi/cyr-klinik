<?php
$totalall = $rekap_admin['total'] + $rekap_tindakan['total'] + $rekap_obat['total'];

function colorBadge($status)
{
  if ($status == '1') {
    return 'warning';
  } else if ($status == '2') {
    return 'success';
  }
}

?>
<style>
  .scroll {
    max-height: 500px;
    overflow-y: auto;
  }
</style>
<div class="font-weight-bold mb-4">BILLING DETAIL</div>
<?= $this->session->flashdata('msg') ?>
<div class="row">
  <div class="col mb-4">
    <div class="card shadow">
      <div class="card-body p-4">
        <div class="row">
          <div class="col-auto">
            <i class="far fa-user-circle fa-4x mr-2 mb-4"></i>
          </div>
          <div class="row">
            <div class="col">
              <h4><?= $detail_billing['nama_lengkap'] ?></h4>
              <p>#<?= $detail_billing['id'] . " / " . $detail_billing['medrek'] ?></p>
              <div><?= $detail_billing['jk'] == 'l' ? "Laki-laki" : "Perempuan" ?> / <?= umur($detail_billing['tgl_lahir']) ?></div>
              <div>
                <?= $detail_billing['alamat'] . ", " . $detail_billing['kelurahan'] . ", " . $detail_billing['kecamatan'] . ", " . $detail_billing['kabupaten'] . ", " . $detail_billing['provinsi'] ?>
              </div>
            </div>
          </div>
          <div class="col text-right">
            <div class="badge badge-primary "><?= $detail_billing['pembayaran'] ?></div>
            <div class="font-weight-bold">Tanggal berobat</div>
            <p><?= formatTanggal($detail_billing['tgl_berobat']) ?></p>
            <?php if ($detail_billing['status_pembayaran'] == '2') : ?>
              <div class="font-weight-bold">Tanggal pembayaran</div>
              <p><?= formatTanggal($detail_billing['tgl_pembayaran']) ?></p>
            <?php endif; ?>

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
        <div class="row">
          <div class="col">
            <div class="font-weight-bold mb-2">Detail Billing</div>
          </div>
          <div class="col-auto">
            <div class="font-weight-bold text-gray-500"><?= $detail_billing['no_billing'] ?></div>
          </div>
        </div>
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
        <div class="row no-gutters align-items-center">
          <div class="col mb-4 mr-2">
            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Rekap Biaya</div>
            <div class="h5 mb-0 font-weight-bold text-gray-800">Rp. <?= number_format($detail_billing['total_bayar']) ?></div>
            <div class="font-weight-bold font-italic badge badge-<?= colorBadge($detail_billing['status_pembayaran']) ?>"><?= $detail_billing['nama_status'] ?></div>
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
                  <td class="text-right"><?= number_format($detail_billing['total_administrasi']) ?></td>
                </tr>
                <tr>
                  <td>Tindakan</td>
                  <td class="text-right"><?= number_format($detail_billing['total_tindakan']) ?></td>
                </tr>
                <tr>
                  <td>Obat & Alkes</td>
                  <td class="text-right"><?= number_format($detail_billing['total_obat']) ?></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <a href="" class="btn btn-primary btn-block">Cetak Billing</a>
            <?php if ($detail_billing['status_pembayaran'] == '1') : ?>
              <button type="button" class="btn btn-primary btn-primary btn-block" data-toggle="modal" data-target="#savebillingmodal">Simpan</button>
              <hr>
              <button type="button" class="btn btn-danger btn-block" data-toggle="modal" data-target="#exampleModal">Kembalikan ke antrean</button>
            <?php else : ?>
              <a href="" class="btn btn-primary btn-block">Cetak Kwitansi</a>
            <?php endif; ?>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Konfirmasi</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Billing akan dihapus dan data dikembalikan ke antrean klinik, anda yakin?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
        <a href="<?= base_url('Billing/hapus_billing/' . encrypt_url($detail_billing['no_billing'])) ?>" class="btn btn-danger">Ya, hapus billing</a>
      </div>
    </div>
  </div>
</div>



<!-- Modal -->
<div class="modal fade" id="savebillingmodal" tabindex="-1" aria-labelledby="savebillingmodalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="savebillingmodalLabel">Simpan billing untuk mencetak kwitansi dan menyelesaikan transaksi</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>
          Pastikan pembayaran sudah diterima.
        </p>
        <div class="alert alert-warning">
          <div class="row">
            <div class="col-auto">
              <i class="fas fa-exclamation-triangle fa-2x "></i>
            </div>
            <div class="col">
              Billing tidak akan bisa diedit/dihapus setelah disimpan, lanjutkan?
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
        <a href="<?= base_url('Billing/simpan_billing/' . encrypt_url($detail_billing['no_billing'])) ?>" type="button" class="btn btn-primary">Simpan Billing</a>
      </div>
    </div>
  </div>
</div>