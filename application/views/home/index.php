<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase">Dashboard</div>
  </div>

</div>
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
            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Klinik kulit & kelamin (Bulan Ini)</div>
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