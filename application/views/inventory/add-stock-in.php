<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase">Add Stock In</div>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item"><a href="<?= base_url('Inventory') ?>">Inventory</a></li>
        <li class="breadcrumb-item"><a href="<?= base_url('Inventory') ?>">Stock In</a></li>
        <li class="breadcrumb-item active" aria-current="page">Add Stock In</li>
      </ol>
    </nav>
  </div>
</div>
<div class="row">
  <div class="col-lg-4">
    <div class="card shadow mb-4">
      <div class="card-body">
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
              <a href="<?= base_url('Inventory/stock_in') ?>" class="btn btn-secondary"><i class="fas fa-chevron-left"></i> Kembali </a>
            </form>
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