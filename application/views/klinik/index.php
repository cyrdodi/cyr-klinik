<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase ">daftar antrean klinik</div>
  </div>
</div>
<div class="row">
  <div class="col">
    <div class="card shadow-sm">
      <div class="card-body">
        <?= $this->session->flashdata('msg') ?>
        <table class="table" id="myTable">
          <thead>
            <tr>
              <th>#</th>
              <th>Klinik</th>
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
                <td><?= $pasien['nama_klinik'] ?></td>
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