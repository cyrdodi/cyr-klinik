<div class="row">
  <div class="col">
    <div class="card shadow-sm">
      <div class="card-body">
        <h3>Daftar Antrean Klinik</h3>
        <hr>
        <table class="table">
          <thead>
            <tr>
              <th>No</th>
              <th>MR</th>
              <th>Register</th>
              <th>Nama</th>
              <th>Alamat</th>
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
              </tr>
              <?php $i++ ?>
            <?php endforeach; ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>