<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 uppercase">Inventory</div>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item active" aria-current="page">Pencarian</li>
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
            <form action="" method="get" autocomplete="off">
              <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Masukan nama obat/alkes..." aria-label="Example text with button addon" name="keyword" aria-describedby="button-addon1" value="<?= $is_keyword ? $this->input->get('keyword') : '' ?>" autofocus>
                <div class="input-group-prepend">
                  <button class="btn btn-primary" type="submit" id="button-addon1"><i class="fas fa-search"></i> Cari</button>
                </div>
              </div>
            </form>
          </div>
          <div class="col-auto">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-plus    "></i> Item</button>
          </div>
        </div>
        <table class="table table-striped">
          <thead>
            <th>#</th>
            <th>Nama Obat & Alkes</th>
            <th>Satuan</th>
            <th>Jenis Obat</th>
            <th>Stok</th>
            <th>Harga</th>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
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
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary"><i class="fas fa-plus"></i> Tambahkan</button>
        </form>
      </div>
    </div>
  </div>
</div>