<style>
  .scroll {
    max-height: 500px;
    overflow-y: auto;
  }
</style>
<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase">Cari berdasarkan tangal</div>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item"><a href="<?= base_url('Inventory') ?>">Inventory</a></li>
        <li class="breadcrumb-item"><a href="<?= base_url('Inventory/stock_in') ?>">Stock In</a></li>
        <li class="breadcrumb-item active" aria-current="page">Cari berdasarkan tanggal</li>
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
            <form action="" method="get">
              <div class="row mb-4">
                <div class="col-auto">
                  <div class="input-group">
                    <input type="date" class="form-control" name="d1" required value="<?= $this->input->get('d1') != NULL ? $this->input->get('d1') : date('Y-m-d') ?>">
                    <div class="input-group-prepend">
                      <span class="input-group-text">s/d</span>
                    </div>
                    <input type="date" class="form-control" name="d2" required value="<?= $this->input->get('d2') != NULL ? $this->input->get('d2') : date('Y-m-d') ?>">
                  </div>
                </div>
                <div class="col-auto">
                  <button type="submit" class="btn btn-primary">
                    <i class="fas fa-search mr-2   "></i>
                    Cari
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <?php if ($is_keyword) : ?>
          <div class="row">
            <div class="col scroll">
              <table class="table table-sm table-striped table-responsive-lg">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Nama Item</th>
                    <th>Tanggal</th>
                    <th>Supplier</th>
                    <th>Keterangan</th>
                    <th>Jumlah</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <?php $i = 1; ?>
                  <?php foreach ($search_result as $stok) : ?>
                    <tr>
                      <td><?= $i ?></td>
                      <td><?= cetak($stok->nama_obat) ?></td>
                      <td><?= formatTanggal($stok->tanggal) ?></td>
                      <td><?= $stok->nama_supplier ?></td>
                      <td><?= cetak($stok->keterangan) ?></td>
                      <td><?= $stok->jumlah ?></td>
                      <td>
                        <a href="<?= base_url('Inventory/delete_stock_in/' . $stok->id . '/' . $stok->b_obat_id . '/' . $stok->jumlah) ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin mau dihapus?')">
                          <i class="fas fa-trash"></i>
                        </a>
                      </td>
                    </tr>
                    <?php $i++ ?>
                  <?php endforeach; ?>
                </tbody>
              </table>
            </div>
          </div>
        <?php endif; ?>
      </div>
    </div>
  </div>
</div>