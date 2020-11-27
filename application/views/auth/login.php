<div class="row mt-5 justify-content-center h-100">
  <div class="col-4">
    <div class="card shadow-sm mt-5">
      <div class="card-body">
        <div class="row text-center">
          <div class="col">
            <img src="<?= base_url('assets/img/logo-by.png') ?>" alt="" width="120px">
          </div>
        </div>
        <h1 class="text-center">cyr-simklinik</h1>
        <hr>
        <?= $this->session->flashdata('message') ?>
        <form action="" method="POST">
          <input type="text" class="form-control" name="username" placeholder="username">
          <input type="password" class="form-control mt-2" name="password" placeholder="password">
          <button class="btn btn-primary btn-block mt-2">Login</button>
        </form>
        <hr>
        <p class="text-center">cyrdodi</p>
      </div>
    </div>
  </div>
</div>