<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 uppercase">Inventory</div>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item"><a href="<?= base_url('Billing') ?>">Billing</a></li>
        <li class="breadcrumb-item"><a href="<?= base_url('Billing/pencarian/') ?>">Pencarian</a></li>
        <li class="breadcrumb-item active" aria-current="page">Detail</li>
      </ol>
    </nav>
  </div>
</div>
<div class="row">
  <div class="col">
    <div class="card shadow mb-4">
      <div class="card-body">
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
            <?php $i = $this->uri->segment(3) + 1; ?>
            <?php foreach ($l_obat as $row) : ?>
              <tr>
                <td><?= $i ?></td>
                <td><?= $row->nama_obat ?></td>
                <td><?= $row->satuan ?></td>
                <td><?= $row->jenis_obat ?></td>
                <td><?= $row->stok ?></td>
                <td><?= $row->harga ?></td>
              </tr>
              <?php $i++ ?>
            <?php endforeach; ?>
          </tbody>
        </table>
        <div class="row">
          <div class="col">
            <?= $pagination ?>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>