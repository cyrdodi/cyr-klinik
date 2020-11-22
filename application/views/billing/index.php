<style>
  .scroll {
    max-height: 500px;
    overflow-y: auto;
  }
</style>

<div class="font-weight-bold mb-4">BILLING</div>

<?= $this->session->flashdata('msg') ?>
<div class="row">
  <div class="col">
    <div class="card shadow">
      <div class="card-body">
        <h4>Antrean Billing Belum Selesai</h4>
        <hr>
        <table class="table table-sm">
          <thead>
            <tr>
              <th>#</th>
              <th>Register</th>
              <th>Tanggal</th>
              <th>MR</th>
              <th>Nama</th>
              <th>PJ</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <?php $i = 1; ?>
            <?php foreach ($l_billing as $billing) : ?>
              <tr>
                <td> <?= $i ?></td>
                <td> <?= $billing->id ?></td>
                <td> <?= $billing->tgl_berobat ?></td>
                <td> <?= $billing->nama_lengkap ?></td>
                <td> <?= $billing->pembayaran ?></td>
                <td>
                  <div class="badge badge-primary"><?= $billing->pembayaran ?></div>
                </td>
                <td><a href="<?= base_url('Billing/billing_detail/' . encrypt_url($billing->no_billing)) ?>" class="btn btn-primary btn-sm">Pillih</a></td>
                <?php $i++ ?>
              <?php endforeach; ?>
              </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>