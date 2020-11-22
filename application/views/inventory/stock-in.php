<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase">Stock In</div>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item"><a href="<?= base_url('Inventory') ?>">Inventory</a></li>
        <li class="breadcrumb-item active" aria-current="page">Stock In</li>
      </ol>
    </nav>
  </div>
</div>
<div class="row">
  <div class="col">
    <div class="card shadow mb-4">
      <div class="card-body">
        <div class="row">
          <div class="col">
            <h5>Transaksi terakhir</h5>
          </div>
          <div class="col-auto">
            <a href="<?= base_url('Inventory/add_stock_in') ?>" class="btn btn-sm btn-primary"><i class="fas fa-plus    "></i> Stock In</a>
          </div>
        </div>
        <table class="table table-sm table-striped">
          <thead>
            <tr>
              <th>#</th>
              <th>Nama Item</th>
              <th>Tanggal</th>
              <th>Supplier</th>
              <th>Keterangan</th>
              <th>Jumlah</th>
              <th>Timestamp</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>
</div>