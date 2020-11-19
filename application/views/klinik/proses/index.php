<?php
$totalall = $rekap_admin['total'] + $rekap_tindakan['total'] + $rekap_obat['total'];
?>
<div class="row">
  <div class="col">
    <div class="font-weight-bold text-lg"><?= $detail_antrean['nama_klinik'] ?></div>
    <div class="mb-4"></div>
    <?= $this->session->flashdata('msg') ?>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item"><a href="<?= base_url('Klinik') ?>">Daftar Antrean Klinik</a></li>
        <li class="breadcrumb-item active" aria-current="page">Proses Klinik</li>
      </ol>
    </nav>
  </div>
</div>
<div class="row">
  <div class="col-lg-6">
    <div class="row">
      <div class="col ">
        <div class="card shadow mb-4">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col">
                <h4>Biodata Pasien</h4>
              </div>
              <div class="col-auto">
                <i class="far fa-id-card fa-2x text-gray-300"></i>
              </div>
            </div>
            <div class="text-sm font-weight-bold text-gray-500">
              # <?= $detail_antrean['id'] ?>
              <div class="badge badge-primary ml-2 my-2 float-right"><?= $detail_antrean['pembayaran'] ?></div>
            </div>
            <table class="table">
              <tr>
                <td>Medrek</td>
                <td><?= $pasien['medrek'] ?></td>
              </tr>
              <tr>
                <td>Nama</td>
                <td><?= $pasien['nama_lengkap'] ?></td>
              </tr>
              <tr>
                <td>JK</td>
                <td><?= $pasien['jk'] == 'l' ? 'Laki-laki' : 'Perempuan' ?></td>
              </tr>
              <tr>
                <td>TTL</td>
                <td><?= $pasien['tempat_lahir'] . ', ' . formatTanggal($pasien['tgl_lahir']) ?></td>
              </tr>
              <tr>
                <td>Umur</td>
                <td><?= umur($pasien['tgl_lahir']) ?></td>
              </tr>
              <tr>
                <td>Alamat</td>
                <td><?= $pasien['alamat'] . ', ' . $pasien['kelurahan'] . ', ' . $pasien['kecamatan'] . ', ' . $pasien['kabupaten'] . ', ' . $pasien['provinsi'] ?></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <div class="card shadow mb-4 h-100">
          <div class="card-body">
            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#carabayarmodal">Ubah cara bayar pasien</button>
            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#batalmodal">Batalkan</button>
          </div>
        </div>
      </div>
    </div>

  </div>
  <div class="col-lg-6 mb-4">
    <div class="card shadow h-100">
      <div class="card-body">
        <div class="row no-gutters align-items-center">
          <div class="col">
            <h4>Input</h4>
          </div>
          <div class="col-auto">
            <i class="fas fa-laptop-medical fa-2x text-gray-300"></i>
          </div>
        </div>
        <hr>
        <?= $this->session->flashdata('msg_admin') ?>

        <div class="my-2"></div>
        <a href="<?= base_url('Klinik/input_admin/' . encrypt_url($detail_antrean['id'])) ?>" class="btn btn-light btn-lg btn-icon-split btn-block d-flex justify-content-start border">
          <span class="icon bg-primary text-white-50 col-2">
            <i class="fas fa-hand-holding-usd"></i>
          </span>
          <span class="text">Administrasi</span>
        </a>
        <div class="my-2"></div>
        <div class="my-2"></div>
        <a href="<?= base_url('Klinik/input_tindakan/' . encrypt_url($detail_antrean['id'])) ?>" class="btn btn-light btn-icon-split btn-lg d-flex justify-content-start border">
          <span class="icon bg-primary text-white-50 col-2">
            <i class="fas fa-syringe "></i>
          </span>
          <span class="text">Tindakan</span>
        </a>
        <div class="my-2"></div>
        <div class="my-2"></div>
        <a href="<?= base_url('Klinik/input_obat/' . encrypt_url($detail_antrean['id'])) ?>" class="btn btn-light btn-icon-split btn-lg d-flex justify-content-start border">
          <span class="icon bg-primary text-white-50 col-2">
            <i class="fas fa-pills "></i>
          </span>
          <span class="text">Obat & Alkes</span>
        </a>
        <div class="my-2"></div>
        <div class="my-2"></div>
        <a href="<?= base_url('Klinik/input_obat/' . encrypt_url($detail_antrean['id'])) ?>" class="btn btn-light btn-icon-split btn-lg d-flex justify-content-start border">
          <span class="icon bg-primary text-white-50 col-2">
            <i class="fas fa-user-md"></i>
          </span>
          <span class="text">Pemeriksaan </span>
        </a>
        <div class="my-2"></div>
        <hr>
        <div class="row no-gutters align-items-center">
          <div class="col mb-4 mr-2">
            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Rekap Biaya</div>
            <div class="h5 mb-0 font-weight-bold text-gray-800">Rp. <?= number_format($totalall) ?></div>
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
            </table>
          </div>
        </div>
        <hr>
        <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#staticBackdrop"><i class="fas fa-check  mr-2  "></i>OK</button>
        <a href="<?= base_url('Klinik') ?>" class="btn btn-secondary"><i class="fas fa-chevron-left mr-2   "></i>Kembali</a>
      </div>

    </div>
  </div>

</div>


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Detail Transaksi</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col">
            <div class="font-weight-bold text-primary text-uppercase mb-1">Detail Biaya</div>
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
            <div class="font-weight-bold text-primary text-uppercase mb-1">Rekap Biaya</div>
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

          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
        <a href="<?= base_url('Klinik/simpan_transaksi/' . encrypt_url($detail_antrean['id'])) ?>" class="btn btn-primary" onclick="checkBiaya(event)">Kirim ke billing</a>
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="carabayarmodal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Ubah cara bayar pasien</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
          <form action="<?= base_url('Klinik/ubah_cara_bayar') ?>" method="get">
            <div class="form-group">
              <label for="carabayar">Cara bayar</label>
              <select class="form-control" name="carabayar" id="carabayar">
                <option value="p1" <?= $detail_antrean['cara_bayar'] == 'p1' ? 'selected' : '' ?>>Bpjs Kesehatan</option>
                <option value="p2" <?= $detail_antrean['cara_bayar'] == 'p2' ? 'selected' : '' ?>>Asuransi Lain</option>
                <option value="p3" <?= $detail_antrean['cara_bayar'] == 'p3' ? 'selected' : '' ?>>Umum/Pribadi</option>
              </select>
              <input type="text" value="<?= $detail_antrean['id'] ?>" name="noreg" hidden>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
        <button type="submit" class="btn btn-primary">Ubah</button>
        </form>
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="batalmodal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Batal Antrean Klinik</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
          <div id="batalcontent">
            <div class="alert alert-warning">Sebelum membatalkan antrean klinik, hapus dulu semua item biaya dan obat</div>
          </div>
          <table class="table">
            <tr>
              <td>Administrasi</td>
              <td>
                <?= empty($l_admin) == TRUE ? '<i class="fas fa-check "></i>' : '<i class="fas fa-times    "></i>' ?>
              </td>
            </tr>
            <tr>
              <td>Tindakan</td>
              <td>
                <?= empty($l_tindakan) == TRUE ? '<i class="fas fa-check "></i>' : '<i class="fas fa-times    "></i>' ?>
              </td>
            </tr>
            <tr>
              <td>Obat</td>
              <td><?= empty($l_obat) == TRUE ? '<i class="fas fa-check "></i>' : '<i class="fas fa-times    "></i>' ?></td>
            </tr>
          </table>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <?php if ($deletable) : ?>
          <a href="<?= base_url('Klinik/batalkan_antrean/' . encrypt_url($detail_antrean['id'])) ?>" type="button" class="btn btn-primary">Batalkan Antrean</a>
        <?php endif; ?>
      </div>
    </div>
  </div>
</div>

<script>
  $('#exampleModal').on('show.bs.modal', event => {
    var button = $(event.relatedTarget);
    var modal = $(this);
    // Use above variables to manipulate the DOM

  });
</script>

<script>
  $('#exampleModal').on('show.bs.modal', event => {
    var button = $(event.relatedTarget);
    var modal = $(this);
    // Use above variables to manipulate the DOM

  });
</script>

<script>
  var biaya = <?= $totalall ?>;

  function checkBiaya(e) {
    if (biaya == 0) {
      e.preventDefault();
      return alert('Item biaya tidak boleh kosong!');
    }
  }
</script>