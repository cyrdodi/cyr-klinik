<div class="row">
  <div class="col-lg-6">
    <div class="card shadow-sm">
      <div class="card-body">
        <h4>Input Biaya admin</h4>
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
          <button type="submit" class="btn btn-primary float-right">Simpan</button>
          <a href="<?= base_url('Klinik/proses_klinik/' . $this->uri->segment(3)) ?>" class="btn btn-secondary">Kembali</a>
        </form>
      </div>
    </div>
  </div>
</div>