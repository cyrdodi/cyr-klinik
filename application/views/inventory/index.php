<style>
  .scroll {
    max-height: 500px;
    overflow-y: auto;
  }
</style>
<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase">Inventory</div>
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
            <a href="<?= base_url('Inventory/add_item') ?>" class="btn btn-primary"><i class="fas fa-plus    "></i> Item</a>
          </div>
        </div>
        <?= $this->session->flashdata('msg') ?>
        <div class="row">
          <div class="col scroll">
            <?php if (count($search_result) > 0) : ?>
              <table class="table table-striped table-sm">
                <thead>
                  <th>#</th>
                  <th>Nama Obat & Alkes</th>
                  <th>Satuan</th>
                  <th>Jenis Obat</th>
                  <th>Stok</th>
                  <th>Harga</th>
                  <th>Action</th>
                </thead>
                <tbody>
                  <?php $i = 1 ?>
                  <?php foreach ($search_result as $result) : ?>
                    <tr style="<?= redRow($result->is_active) ?>"">
                      <td><?= $i ?></td>
                      <td><?= htmlentities($result->nama_obat) ?></td>
                      <td><?= $result->satuan ?></td>
                      <td><?= $result->jenis_obat ?></td>
                      <td><?= $result->stok ?></td>
                      <td><?= number_format($result->harga) ?></td>
                      <td>
                        <a href=" <?= base_url('Inventory/edit_item/' . $result->id) ?>" class="btn btn-primary btn-sm"><i class="fas fa-pencil-alt    "></i></a>
                      </td>
                    </tr>
                    <?php $i++ ?>
                  <?php endforeach; ?>
                </tbody>
              </table>
              <div class="text-secondary">Search limit 50 records</div>
          </div>
        <?php else : ?>
          <div class="row">
            <div class="col-lg-6">
              <div class="alert alert-warning" role="alert">
                <h4><i class="fas fa-exclamation-circle"></i> Item tidak ditemukan</h4>
              </div>
            </div>
          </div>
        <?php endif; ?>
        </div>
      </div>
    </div>
  </div>