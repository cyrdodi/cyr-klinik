<div class="row">
  <div class="col">
    <div class="card shadow-sm">
      <div class="card-body">
        <h3>Daftar Antrean Klinik</h3>
        <hr>
        <?= $this->session->flashdata('msg') ?>
        <table class="table">
          <thead>
            <tr>
              <th>No</th>
              <th>MR</th>
              <th>Register</th>
              <th>Nama</th>
              <th>Alamat</th>
              <th>Cara Bayar</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <?php $i = 1 ?>
            <?php foreach ($daftar_pasien as $pasien) : ?>
              <tr>
                <td><?= $i ?></td>
                <td><?= $pasien['medrek'] ?></td>
                <td><?= $pasien['id'] ?></td>
                <td><?= $pasien['nama_lengkap'] ?></td>
                <td><?= $pasien['alamat'] ?></td>
                <td>
                  <div class="badge badge-info"> <?= $pasien['pembayaran'] ?></div>
                </td>
                <td><a href="<?= base_url('Klinik/proses_klinik/' . encrypt_url($pasien['id'])) ?>" class="btn btn-sm btn-primary">Proses</a></td>
              </tr>
              <?php $i++ ?>
            <?php endforeach; ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<div class="form-group">
  <label for=""></label>
  <input type="text" class="form-control" name="">
</div>