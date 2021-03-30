<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase">Dashboard</div>
  </div>

</div>
<?php if (date('Y-m-d') < '2021-04-10') : ?>
  <div class="row">
    <div class="col">
      <div class="alert alert-info lert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h5 class="alert-heading">Update (2021-03-30)</h5>
        <ul>
          <li>Penambahan fitur pencarian billing berdasarkan bulan & tahun</li>
          <li>Penambahan rincian laporan perbulan</li>
          <li>Penambahan fitur edit data pasien</li>
        </ul>
      </div>
    </div>
  </div>
<?php endif; ?>
<div class="row">
  <!-- Earnings (Monthly) Card Example -->
  <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters align-items-center">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Klinik Umum (Bulan Ini)</div>
            <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $jml_umum['jml'] ?></div>
          </div>
          <div class="col-auto">
            <i class="fas fa-user-md fa-2x text-gray-300"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Earnings (Monthly) Card Example -->
  <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters align-items-center">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Klinik Kecantikan (Bulan Ini)</div>
            <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $jml_klt['jml'] ?></div>
          </div>
          <div class="col-auto">
            <i class="fas fa-user-md fa-2x text-gray-300"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Earnings (Monthly) Card Example -->
  <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters align-items-center">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Pendapatan (Bulan Ini)</div>
            <div class="h5 mb-0 font-weight-bold text-gray-800">Rp. <?= number_format($pendapatan['total']) ?></div>
          </div>
          <div class="col-auto">
            <i class="fas fa-money-bill-wave fa-2x text-gray-300"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col">
    <a href="<?= base_url('home/laporan-pendapatan' . '?bln=' . date('m') . '&thn=' . date('Y')) ?>" class="btn btn-primary btn-icon-split">
      <span class="icon text-white-50">
        <i class="fas fa-columns"></i>
      </span>
      <span class="text">Laporan Pendapatan</span>
    </a>
  </div>
</div>