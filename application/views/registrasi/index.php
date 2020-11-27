<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase">Registrasi Klinik</div>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item active" aria-current="page">Pencarian</li>
      </ol>
    </nav>
  </div>
</div>
<div class="row">
  <div class="col">
    <div class="card shadow-sm">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-6">
            <form action="" method="get" autocomplete="off">
              <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Masukan Nama / Medrek ..." aria-label="Example text with button addon" name="keyword" aria-describedby="button-addon1" value="<?= $is_keyword ? $this->input->get('keyword') : '' ?>" autofocus>
                <div class="input-group-prepend">
                  <button class="btn btn-primary" type="submit" id="button-addon1"><i class="fas fa-search"></i> Cari</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <hr>
        <?php if ($is_keyword) : ?>
          <div class="row">
            <div class="col">
              <?php if (count($search_result) > 0) : ?>
                <table class="table table-responsive">
                  <thead>
                    <tr>
                      <th>Medrek</th>
                      <th>Nama</th>
                      <th>NIK</th>
                      <th>No. BPJS</th>
                      <th>Umur</th>
                      <th>Alamat</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($search_result as $result) : ?>
                      <tr>
                        <td><?= $result['medrek'] ?></td>
                        <td><?= $result['nama_lengkap']  ?></td>
                        <td><?= $result['nik'] ?></td>
                        <td><?= $result['no_bpjs'] ?></td>
                        <td><?= $result['tgl_lahir'] ?></td>
                        <td><?= $result['alamat'] ?></td>
                        <td><a href="<?= base_url('Registrasi/pendaftaran/' . encrypt_url($result['medrek'])) ?>" class="btn btn-primary">Pilih</a></td>

                      </tr>
                    <?php endforeach; ?>
                  </tbody>
                </table>
                <div class="text-secondary">Search limit 50 records</div>
              <?php else : ?>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="alert alert-warning" role="alert">
                      <h4><i class="fas fa-exclamation-circle"></i> Data Pasien tidak ditemukan</h4>
                      <hr>
                      <a href="<?= base_url('Registrasi/pasien_baru') ?>" class="btn btn-primary"><i class="fas fa-user-plus"></i> Pasien Baru</a>
                    </div>
                  </div>
                </div>
              <?php endif; ?>
            </div>
          </div>
        <?php endif; ?>
      </div>
    </div>
  </div>
</div>