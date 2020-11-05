<div class="row">
  <div class="col">
    <div class="card shadow-sm">
      <div class="card-body">
        <h3>Pendaftaran</h3>
        <hr>
        <div class="row">
          <div class="col-lg-8">
            <table class="table table-responsive">
              <tr>
                <th>Medrek</th>
                <td>
                  <?= $pasien['medrek'] ?>
                </td>
              </tr>
              <tr>
                <th>Nama Pasien</th>
                <td><?= $pasien['nama_depan'] . " " . $pasien['nama_belakang'] ?></td>
              </tr>
              <tr>
                <th>NIK</th>
                <td><?= $pasien['nik'] ?></td>
              </tr>
              <tr>
                <th>BPJS</th>
                <td><?= $pasien['no_bpjs'] ?></td>
              </tr>
              <tr>
                <th>Jenis Kelamin</th>
                <td><?= $pasien['jk'] ?></td>
              </tr>
              <tr>
                <th>Tempat & Tanggal lahir</th>
                <td><?= $pasien['tempat_lahir'] . ', ' . $pasien['tgl_lahir'] ?></td>
              </tr>
              <tr>
                <th>Alamat</th>
                <td><?= $pasien['alamat'] . ', ' . $pasien['kelurahan'] . ', ' . $pasien['kecamatan'] . ', ' . $pasien['kabupaten'] . ', ' . $pasien['provinsi'] ?></td>
              </tr>
              <tr>
                <th>No. HP</th>
                <td><?= $pasien['no_hp'] ?></td>
              </tr>
              <tr>
                <th>Agama</th>
                <td><?= $pasien['agama'] ?></td>
              </tr>
              <tr>
                <th>Pekerjaan</th>
                <td><?= $pasien['pekerjaan'] ?></td>
              </tr>
              <tr>
                <th>Status Perkawinan</th>
                <td><?= $pasien['status_perkawinan'] ?></td>
              </tr>
              <tr>
                <th>Nama Penjamin</th>
                <td><?= $pasien['nama_penjamin'] ?></td>
              </tr>
              <tr>
                <th>No. HP Penjamin</th>
                <td><?= $pasien['no_hp_penjamin'] ?></td>
              </tr>
              <tr>
                <th>Hubungan</th>
                <td><?= $pasien['hubungan'] ?></td>
              </tr>
            </table>
          </div>
          <div class="col-lg-4">
            <div class="card">
              <div class="card-body">
                <form action="" method="post">
                  <input type="text" name="medrek" value="<?= $pasien['medrek'] ?>" hidden>
                  <input type="text" name="user_id" value="<?= $this->session->userdata('user_id') ?>" hidden>
                  <div class="form-group">
                    <label for="penjamin">Cara Bayar</label>
                    <select name="caraBayar" id="caraBayar" class="form-control">
                      <option value="p1">BPJS Kesehatan</option>
                      <option value="p2">Asuransi Lain</option>
                      <option value="p3">Umum / Pribadi</option>
                    </select>
                  </div>
                  <button type="submit" class="btn btn-primary">Daftar</button>
                </form>
              </div>
            </div>
          </div>
        </div>
        <hr>
      </div>
    </div>
  </div>
</div>