<style>
  .scroll {
    max-height: 500px;
    overflow-y: auto;
  }
</style>
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
<?= $this->session->flashdata('msg') ?>
<div class="row">
  <div class="col-lg-4 mb-4">
    <div class="card shadow mb-4 h-100">
      <div class="card-body">
        <div class="font-weight-bold">Tambah Stock</div>
        <div class="row">
          <div class="col">
            <form action="" method="post">
              .<div class="form-group">
                <label for="tanggal">Tanggal</label>
                <input type="date" class="form-control" name="tanggal" value=<?= date('Y-m-d') ?>>
              </div>
              <div class="form-group">
                <label for="item">Item</label>
                <select name="item" id="item" class="form-control" required>
                </select>
                <?= form_error('obat', '<small class="text-danger pl-3">', '</small>') ?>
              </div>
              <div class="form-group">
                <label for="supplier">Supplier</label>
                <select name="supplier" id="supplier" class="form-control">
                  <?php foreach ($l_supplier as $supplier) : ?>
                    <option value="<?= $supplier['id_supplier'] ?>" <?= set_select('supplier', $supplier['id_supplier']) ?>><?= $supplier['nama_supplier'] ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="form-group">
                <label for="keterangan">Keterangan</label>
                <textarea name="keterangan" id="keterangan" rows="2" class="form-control"></textarea>
              </div>
              <div class="form-group">
                <label for="jumlah">Jumlah</label>
                <input type="number" class="form-control" name="jumlah" value="<?= set_value('jumlah') ?>" required>
                <?= form_error('jumlah', '<small class="text-danger pl-3">', '</small>'); ?>
              </div>
              <button class="btn btn-primary float-right" type="submit"><i class="fa fa-check" aria-hidden="true"></i> Simpan</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="col-lg-8 mb-4">
    <div class="card shadow mb-4 h-100 scroll">
      <div class="card-body">
        <div class="row mb-4">
          <div class="col">
            <h5>Transaksi terakhir</h5>
          </div>
          <div class="col-auto">
            <a href="<?= base_url('Inventory/search_stock_in') ?>" class="btn btn-sm btn-primary"><i class="fas fa-search    "></i> Cari berdasarkan tanggal</a>
          </div>
        </div>
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
                <?php foreach ($l_stok_in as $stok) : ?>
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

      </div>
    </div>
  </div>
</div>

<script>
  $(document).ready(function() {
    $('#item').select2({
      placeholder: '-- pilih obat --',
      ajax: {
        url: '<?= base_url('Inventory/searchObat') ?>',
        type: 'POST',
        dataType: 'json',
        data: function(params) {
          return {
            searchTerm: params.term // search term
          };
        },
        processResults: function(response) {
          return {
            results: response
          };
        },
        pagination: {
          more: true
        },
        cache: true
      }
    });
  })
</script>