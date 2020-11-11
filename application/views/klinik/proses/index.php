<div class="row">
  <div class="col">
    <div class="card ">
      <div class="card-body">
        <h3>Proses Input Klinik</h3>
      </div>
    </div>
  </div>
</div>
<div class="row mt-1">
  <div class="col-lg-7">
    <div class="card h-100">
      <div class="card-body">
        <h4>Input Biaya</h4>
        <hr>
        <?= $this->session->flashdata('msg_admin') ?>
        <div class="list-group">
          <a href="<?= base_url('Klinik/input_admin/' . $detail_antrean['id']) ?>" class="list-group-item list-group-item-action">Administrasi</a>
          <a href="<?= base_url('Klinik/input_tindakan/' . $detail_antrean['id']) ?>" class="list-group-item list-group-item-action">Tindakan</a>
          <a href="<?= base_url('Klinik/input_admin/' . $detail_antrean['id']) ?>" class="list-group-item list-group-item-action">Obat</a>
        </div>

      </div>
    </div>
  </div>
  <div class="col-lg-5">
    <div class="card">
      <div class="card-body">
        <h4>Biodata Pasien</h4>
        <table class="table">
          <tr>
            <td>Medrek</td>
            <td><?= $pasien['medrek'] ?></td>
          </tr>
          <tr>
            <td>Nama</td>
            <td><?= $pasien['nama_lengkap'] ?></td>
          </tr>
          <tr>
            <td>JK</td>
            <td><?= $pasien['jk'] == 'l' ? 'Laki-laki' : 'Perempuan' ?></td>
          </tr>
          <tr>
            <td>TTL</td>
            <td><?= $pasien['tempat_lahir'] == 'l' ? 'Laki-laki' : 'Perempuan' ?></td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</div>
<div class="row mt-2">
  <div class="col">
    <div class="card shadow-sm">
      <div class="card-body">
        <h4>Daftar Biaya</h4>
        <h5>Admin</h5>
        <table class="table table-sm">
          <thead>
            <tr>
              <th>No</th>
              <th>Nama</th>
              <th>Harga</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <?php $i = 1; ?>
            <?php foreach ($l_admin as $admin) : ?>
              <tr>
                <td><?= $i ?></td>
                <td><?= $admin['nama_admin'] ?></td>
                <td><?= $admin['harga'] ?></td>
                <td><a href="" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt    "></i></a></td>
              </tr>
              <?php $i++ ?>
            <?php endforeach; ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>