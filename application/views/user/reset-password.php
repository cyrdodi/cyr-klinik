<div class="row mt-5 justify-content-center h-100">
  <div class="col-4">
    <div class="card shadow mt-5">
      <div class="card-body">
        <h1 class="text-center">cyr-klinik</h1>
        <div class="text-uppercase font-weight-bold text-center">Reset Password</div>
        <hr>
        <form action="" method="POST">
          <input type="text" class="form-control" name="id" value="<?= $user['id'] ?>" hidden>
          <input type="text" class="form-control" name="nama" id="nama" value="<?= $user['nama'] ?>" readonly>
          <input type="text" class="form-control mt-2" name="username" id="username" value="<?= $user['username'] ?>" readonly>
          <input type="password" class="form-control mt-2" name="password1" placeholder="password">
          <?= form_error('password1', '<small class="text-danger pl-3">', '</small>'); ?>
          <input type="password" class="form-control mt-2" name="password2" placeholder="ulangi password">
          <?= form_error('password2', '<small class="text-danger pl-3">', '</small>'); ?>
          <button class="btn btn-primary btn-block mt-2"><i class="fas fa-key"></i> Simpan</button>
          <a href="<?= base_url('User') ?>" class="btn btn-secondary btn-block mt-2">Kembali</a>
        </form>
        <hr>
        <p class="text-center">cyrdodi</p>
      </div>
    </div>
  </div>
</div>
<script>
  $(function() {
    $('#username').on('keypress', function(e) {
      if (e.which == 32) {
        console.log('Space Detected');
        return false;
      }
    });
    // force to lowecase
    $('#username').keyup(function() {
      $(this).val($(this).val().toLowerCase());
    });
  });
</script>