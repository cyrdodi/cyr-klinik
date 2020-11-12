<div class="row">
  <div class="col-lg-6 mb-4">
    <div class="card shadow-sm">
      <div class="card-body">
        <h4>Input Biaya admin</h4>
        <?= $this->session->flashdata('msg') ?>
        <hr>
        <form action="" method="post">
          <div class="form-group">
            <label for="admin">Admin</label>
            <select name="admin" id="admin" class="form-control">
              <?php foreach ($b_admin as $admin) : ?>
                <option value="<?= $admin['id'] ?>"><?= $admin['nama'] ?></option>
              <?php endforeach; ?>
            </select>
          </div>
          <button type="submit" class="btn btn-primary float-right">Tambah</button>
          <a href="<?= base_url('Klinik/proses_klinik/' . $this->uri->segment(3)) ?>" class="btn btn-secondary">Kembali</a>
        </form>
      </div>
    </div>
  </div>
  <div class="col-lg-6 mb-4">
    <div class="card shadow-sm">
      <div class="card-body">
        <h4>Daftar Admin</h4>
        <?= $this->session->flashdata('msg_delete') ?>
        <table class="table table-sm table-striped">
          <thead>
            <tr>
              <th>No</th>
              <th>Nama</th>
              <th class="text-right">Tarif</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <?php $i = 1; ?>
            <?php $total = 0 ?>
            <?php foreach ($l_admin as $admin) : ?>
              <tr>
                <td><?= $i ?></td>
                <td><?= $admin['nama_admin'] ?></td>
                <td class="text-right"><?= number_format($admin['harga']) ?></td>
                <td class="text-center"><a href="<?= base_url('Klinik/delete_admin/' . $admin['id']) ?>" class="btn btn-sm btn-circle btn-danger" onclick="return confirm('Yakin mau dihapus?')"><i class="fas fa-trash-alt"></i></a></td>
              </tr>
              <?php $total += $admin['harga'] ?>
              <?php $i++ ?>
            <?php endforeach; ?>
          </tbody>
          <thead>
            <tr>
              <th colspan="2">Total</th>
              <th class="text-right"><?= number_format($total) ?></th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>
</div>