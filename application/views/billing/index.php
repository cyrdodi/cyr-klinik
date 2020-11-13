<div class="row">
  <div class="col">
    <div class="card shadow">
      <div class="card-body">
        <h4>Billing</h4>
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
                <td><?= $pasien['pembayaran'] ?></td>
                <td><a href="<?= base_url('Klinik/proses_klinik/' . encrypt_url($pasien['id'])) ?>" class="btn btn-primary">Proses</a></td>
              </tr>
              <?php $i++ ?>
            <?php endforeach; ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>