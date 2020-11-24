<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase">Tambah tindakan ke klinik</div>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item"><a href="<?= base_url('Inventory') ?>">Daftar Tindakan</a></li>
        <li class="breadcrumb-item"><a href="<?= base_url('Inventory') ?>">Stock In</a></li>
        <li class="breadcrumb-item active" aria-current="page">Add Stock In</li>
      </ol>
    </nav>
  </div>
</div>
<div class="row">
  <div class="col-lg-6">
    <div class="card shadow mb-4">
      <div class="card-body">
        <div class="row">
          <div class="col">
            <form action="" method="post">
              <label for="klinik">Klinik</label>
              <div class="row">
                <div class="col">
                  <div class="form-group">
                    <select name="klinik" id="klinik" class="form-control">
                      <?php foreach ($l_klinik as $klinik) : ?>
                        <option value="<?= $klinik['klinik_id'] ?>"><?= $klinik['nama_klinik'] ?></option>
                      <?php endforeach; ?>
                    </select>
                  </div>
                </div>
                <div class="col-auto">
                  <button class="btn btn-primary"><i class="fas fa-plus    "></i> Tambah</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <hr>
        <div class="row">
          <div class="col">
            <div class="list-group">
              <a href="#" class="list-group-item list-group-item-action ">Active item</a>
              <a href="#" class="list-group-item list-group-item-action">Item</a>
              <a href="#" class="list-group-item list-group-item-action ">Disabled item</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>