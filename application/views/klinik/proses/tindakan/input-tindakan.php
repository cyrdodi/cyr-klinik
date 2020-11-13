<div class="row">
  <div class="col-lg-6 mb-4">
    <div class="card shadow">
      <div class="card-body">
        <h4>Input Biaya Tindakan</h4>
        <?= $this->session->flashdata('msg') ?>
        <hr>
        <form action="" method="post">
          <div class="form-group">
            <label for="tindakan">Tindakan</label>
            <select name="tindakan" id="tindakan" class="form-control">
              <?php foreach ($b_tindakan as $tindakan) : ?>
                <option value="<?= $tindakan['id'] ?>"><?= $tindakan['nama_tindakan'] . ' - ' . number_format($tindakan['tarif']) ?></option>
              <?php endforeach; ?>
            </select>
          </div>
          <button type="submit" class="btn btn-primary float-right">Tambah</button>
          <a href="<?= base_url('Klinik/proses_klinik/' . $this->uri->segment(3)) ?>" class="btn btn-secondary">Kembali</a>
        </form>
      </div>
    </div>
  </div>
  <div class="col-lg-6 mb-4">
    <div class="card border-left-success shadow">
      <div class="card-body">
        <h4>Daftar Tindakan</h4>
        <?= $this->session->flashdata('msg_delete') ?>
        <table class="table table-sm table-striped">
          <thead>
            <tr>
              <th>No</th>
              <th>Nama Tindakan</th>
              <th class="text-right">Tarif</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <?php $i = 1; ?>
            <?php $total = 0 ?>
            <?php foreach ($l_tindakan as $tindakan) : ?>
              <tr>
                <td><?= $i ?></td>
                <td><?= $tindakan['nama_tindakan'] ?></td>
                <td class="text-right"><?= number_format($tindakan['tarif']) ?></td>
                <td class="text-center"><a href="<?= base_url('Klinik/delete_tindakan/' . encrypt_url($tindakan['id'])) ?>" class="btn btn-circle btn-sm btn-danger" onclick="return confirm('Yakin mau dihapus?')"><i class="fas fa-trash-alt"></i></a></td>
              </tr>
              <?php $total += $tindakan['tarif'] ?>
              <?php $i++ ?>
            <?php endforeach; ?>
          </tbody>
          <thead>
            <tr>
              <th colspan="2">Total</th>
              <th class="text-right"><?= number_format($total) ?></th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>
</div>

<script>
  $(document).ready(function() {
    $('#tindakan').select2();
  })
</script>