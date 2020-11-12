<?php
$total = $rekap_admin['total'] + $rekap_tindakan['total'] + $rekap_obat['total']
?>
<div class="row">
  <div class="col mb-4">
    <div class="card shadow">
      <div class="card-body">
        <h3>Proses Input Klinik</h3>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-lg-6 mb-4">
    <div class="card shadow h-100">
      <div class="card-body">
        <h4>Input Biaya</h4>
        <hr>
        <?= $this->session->flashdata('msg_admin') ?>

        <div class="my-2"></div>
        <a href="<?= base_url('Klinik/input_admin/' . $detail_antrean['id']) ?>" class="btn btn-light btn-lg btn-icon-split btn-block d-flex justify-content-start border">
          <span class="icon bg-primary text-white-50">
            <i class="fas fa-hand-holding-usd"></i>
          </span>
          <span class="text">Administrasi</span>
        </a>
        <div class="my-2"></div>
        <div class="my-2"></div>
        <a href="<?= base_url('Klinik/input_tindakan/' . $detail_antrean['id']) ?>" class="btn btn-light btn-icon-split btn-lg d-flex justify-content-start border">
          <span class="icon bg-primary text-white-50">
            <i class="fas fa-syringe "></i>
          </span>
          <span class="text">Tindakan</span>
        </a>
        <div class="my-2"></div>
        <div class="my-2"></div>
        <a href="<?= base_url('Klinik/input_obat/' . $detail_antrean['id']) ?>" class="btn btn-light btn-icon-split btn-lg d-flex justify-content-start border">
          <span class="icon bg-primary text-white-50 ">
            <i class="fas fa-pills "></i>
          </span>
          <span class="text">Obat & Alkes</span>
        </a>
        <div class="my-2"></div>
      </div>
    </div>
  </div>
  <div class="col-lg-6 mb-4">
    <div class="card shadow">
      <div class="card-body">
        <h4>Biodata Pasien</h4>
        <div class="text-sm font-weight-bold text-gray-500"># <?= $detail_antrean['id'] ?></div>
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
            <td><?= $pasien['tempat_lahir'] . ', ' . $pasien['tgl_lahir'] ?></td>
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
  <!-- Earnings (Monthly) Card Example -->
  <div class="col-lg-6 col-md-6 mb-4 ">
    <div class="card border-left-danger shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters align-items-center">
          <div class="col mb-4 mr-2">
            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Rekap Biaya</div>
            <div class="h5 mb-0 font-weight-bold text-gray-800">Rp. <?= number_format($total) ?></div>
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
      </div>
    </div>
  </div>
</div>