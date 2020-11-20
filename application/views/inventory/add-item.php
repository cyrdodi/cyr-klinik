<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 uppercase">Add Item</div>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item"><a href="<?= base_url('Billing') ?>">Inventory</a></li>
        <li class="breadcrumb-item active" aria-current="page">Add Item</li>
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
              <div class="form-group">
                <label for="nama_item">Nama Item</label>
                <input type="text" class="form-control" name="nama_item" id="nama_item" value="<?= set_value('nama_item') ?>">
                <?= form_error('nama_item', '<small class="text-danger pl-3">', '</small>'); ?>
              </div>
              <div class="form-group">
                <label for="satuan">Satuan</label>
                <select name="satuan" id="satuan" class="form-control">
                  <?php foreach ($l_satuan as $satuan) : ?>
                    <option value="<?= $satuan['nama_satuan'] ?>" <?= set_select('satuan', $satuan) ?>><?= $satuan['nama_satuan'] ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="form-group">
                <label for="jenis">Jenis</label>
                <select name="jenis" id="jenis" class="form-control">
                  <?php foreach ($l_jenis as $jenis) : ?>
                    <option value="<?= $jenis['nama_jenis'] ?>" <?= set_select('jenis', $jenis) ?>><?= $jenis['nama_jenis'] ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="form-group">
                <label for="harga">Harga</label>
                <input type="number" class="form-control" name="harga" value="<?= set_value('harga') ?>">
                <?= form_error('harga', '<small class="text-danger pl-3">', '</small>'); ?>
              </div>
              <button class="btn btn-primary float-right" type="submit"><i class="fa fa-check" aria-hidden="true"></i> Simpan</button>
              <a href="<?= base_url('Inventory') ?>" class="btn btn-secondary"><i class="fas fa-chevron-left"></i> Kembali </a>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>