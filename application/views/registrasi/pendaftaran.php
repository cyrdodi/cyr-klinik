<div class="row">
  <div class="col">
    <div class="card shadow mb-4">
      <div class="card-body">
        <h3>Pendaftaran</h3>
        <hr>
        <?php if ($antrean_aktif) : ?>
          <div class="row">
            <div class="col">
              <div class="alert alert-warning" role="alert">
                <h4 class="alert-heading"><i class="fas fa-exclamation-triangle"></i> Perhatian</h4>
                <p class="mt-2">Pasien <?= $pasien['nama_lengkap'] ?> dengan No MR <?= $pasien['medrek'] ?> masih dalam antrean klinik.</p>
                <hr>
                <p class="mb-0"><a href="<?= base_url('Klinik') ?>" class="btn btn-primary">Antrean Klinik</a></p>
              </div>
            </div>
          </div>
        <?php elseif ($billing_nunggak) : ?>
          <div class="row">
            <div class="col">
              <div class="alert alert-warning" role="alert">
                <h4 class="alert-heading"><i class="fas fa-exclamation-triangle"></i> Perhatian</h4>
                <p class="mt-2">Pasien <?= $pasien['nama_lengkap'] ?> dengan No MR <?= $pasien['medrek'] ?> masih dalam antrean billing belum lunas.</p>
                <hr>
                <p class="mb-0"><a href="<?= base_url('Billing') ?>" class="btn btn-primary">Antrean Billing</a></p>
              </div>
            </div>
          </div>
        <?php else : ?>
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
                  <td><?= $pasien['nama_lengkap'] ?></td>
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
                  <td><?= $pasien['jk'] == 'l' ? 'Laki-laki' : 'Perempuan' ?></td>
                </tr>
                <tr>
                  <th>Tempat & Tanggal lahir</th>
                  <td><?= $pasien['tempat_lahir'] . ', ' . formatTanggal($pasien['tgl_lahir']) ?></td>
                </tr>
                <tr>
                  <th>Umur</th>
                  <td><?= umur($pasien['tgl_lahir']) ?></td>
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

          </div>

          <hr>
        <?php endif; ?>
      </div>
    </div>
  </div>
  <div class="col-lg-4">
    <div class="card shadow">
      <div class="card-body">
        <div class="row">
          <div class="col">
            <div class="text-sm font-weight-bold text-primary">Proses Pendaftaran</div>
          </div>
        </div>
        <form action="" method="post">
          <input type="text" name="medrek" value="<?= $pasien['medrek'] ?>" hidden>
          <input type="text" name="user_id" value="<?= $this->session->userdata('user_id') ?>" hidden>
          <div class="form-group">
            <label for="tanggal">Tanggal Berobat</label>
            <input type="date" class="form-control" name="tgl_berobat" value="<?= date('Y-m-d') ?>" readonly>
          </div>
          <div class="form-group">
            <label for="klinik">Klinik</label>
            <select class="form-control" name="klinik" id="klinik">
              <?php foreach ($l_klinik as $klinik) : ?>
                <option value="<?= $klinik->klinik_id ?>"><?= $klinik->nama_klinik ?></option>
              <?php endforeach; ?>
            </select>
          </div>
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