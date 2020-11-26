<style>
  .scroll {
    max-height: 500px;
    overflow-y: auto;
  }
</style>
<div class="row ">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase ">Pencarian</div>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item"><a href="<?= base_url('Billing') ?>">Billing</a></li>
        <li class="breadcrumb-item active" aria-current="page">Pencarian</li>
      </ol>
    </nav>
  </div>
</div>
<?= $this->session->flashdata('msg') ?>
<div class="row">
  <div class="col">
    <div class="card shadow">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-6">
            <form action="" method="get" autocomplete="off">
              <div class="input-group mb-3">
                <input type="text" minlength="2" class="form-control" placeholder="Masukan Nama / Medrek ..." aria-label="Example text with button addon" name="keyword" aria-describedby="button-addon1" value="<?= $is_keyword ? $this->input->get('keyword') : '' ?>" autofocus>
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
              <?php $i = 1; ?>
              <?php if (count($search_result) > 0) : ?>
                <p>Hasil pencarian</p>
                <div class="row">
                  <div class="col">
                    <table class="table table-responsive table-sm">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>Register</th>
                          <th>Tanggal berobat</th>
                          <th>Medrek</th>
                          <th>Nama</th>
                          <th>Alamat</th>
                          <th>PJ</th>
                          <th>Status</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php foreach ($search_result as $result) : ?>
                          <tr>
                            <td><?= $i ?></td>
                            <td><?= $result['id'] ?></td>
                            <td><?= formatTanggal($result['tgl_berobat']) ?></td>
                            <td><?= $result['medrek'] ?></td>
                            <td><?= $result['nama_lengkap']  ?></td>
                            <td><?= $result['kecamatan'] ?></td>
                            <td>
                              <div class="badge" <?= badgeCB($result['cara_bayar']) ?>><?= $result['pembayaran'] ?></div>
                            </td>
                            <td>
                              <?= badgePembayaran($result['status_pembayaran']) ?>
                            </td>
                            <td><a href="<?= base_url('Billing/billing_detail/' . encrypt_url($result['no_billing'])) ?>" class="btn btn-sm btn-primary">Pilih</a></td>
                            <td><?php $i++ ?></td>
                          </tr>
                        <?php endforeach; ?>
                      </tbody>
                    </table>
                  </div>
                </div>
                <div class="text-secondary">Search limit 100 records</div>
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