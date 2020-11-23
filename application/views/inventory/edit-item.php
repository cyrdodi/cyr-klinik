<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase">Edit Item</div>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item"><a href="<?= base_url('Inventory') ?>">Inventory</a></li>
        <li class="breadcrumb-item active" aria-current="page">Edit Item</li>
      </ol>
    </nav>
  </div>
</div>
<?= $this->session->flashdata('msg') ?>
<div class="row">
  <div class="col-lg-4">
    <div class="card shadow mb-4">
      <div class="card-body">
        <div class="row">
          <div class="col">
            <form action="" method="post">
              <input type="text" value="<?= $detail_item['id'] ?>" name="id" hidden>
              <div class="form-group">
                <label for="nama_item">Nama Item</label>
                <input type="text" class="form-control" name="nama_item" id="nama_item" value="<?= $detail_item['nama_obat'] ?>" placeholder="Nama Obat / Alkes">
                <?= form_error('nama_item', '<small class="text-danger pl-3">', '</small>'); ?>
              </div>
              <div class="form-group">
                <label for="satuan">Satuan</label>
                <select name="satuan" id="satuan" class="form-control">
                  <?php foreach ($l_satuan as $satuan) : ?>
                    <option value="<?= $satuan['nama_satuan'] ?>" <?= $satuan['nama_satuan'] == $detail_item['satuan'] ? 'selected' : '' ?>><?= $satuan['nama_satuan'] ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="form-group">
                <label for="jenis">Jenis</label>
                <select name="jenis" id="jenis" class="form-control">
                  <?php foreach ($l_jenis as $jenis) : ?>
                    <option value="<?= $jenis['nama_jenis'] ?>" <?= $jenis['nama_jenis'] == $detail_item['jenis_obat'] ? 'selected' : '' ?>><?= $jenis['nama_jenis'] ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="form-group">
                <label for="harga">Harga</label>
                <input type="text" class="form-control" id="harga" name="harga" value="<?= $detail_item['harga'] ?>" placeholder="Harga jual">
                <?= form_error('harga', '<small class="text-danger pl-3">', '</small>'); ?>
              </div>
              <div class=" p-2 border rounded-lg mb-2">
                <div class="form-group">
                  <label for="aktif" class="text-danger">Aktif</label>
                  <select name="aktif" class="form-control" id="aktif">
                    <option value="1" <?= $detail_item['is_active'] == '1' ? 'selected' : '' ?>>Ya</option>
                    <option value="0" <?= $detail_item['is_active'] == '0' ? 'selected' : '' ?>>Tidak</option>
                  </select>
                </div>
              </div>
              <button class="btn btn-primary float-right" id="simpan-btn" type="submit"><i class="fa fa-check" aria-hidden="true"></i> Update</button>
              <a href="<?= base_url('Inventory') ?>" class="btn btn-secondary"><i class="fas fa-chevron-left"></i> Kembali </a>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<script>
  $(document).ready(function() {
    var harga = new AutoNumeric('#harga', {
      currencySymbol: 'Rp. ',
      allowDecimalPadding: 'false',
      decimalCharacter: ',',
      digitGroupSeparator: '.'
    });

    $('#simpan-btn').click(function() {
      $('#harga').val(harga.rawValue)
    })
  })
</script>