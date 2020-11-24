<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase">Input Pemeriksaan</div>
  </div>
</div>
<div class="row">
  <div class="col-lg-6">
    <div class="card shadow mb-4">
      <div class="card-body">
        <div class="row">
          <div class="col">
            <form action="" method="post">
              <div class="form-group">
                <label for="diagnosa">Diagnosa</label>
                <input type="text" class="form-control" name="" id="">
              </div>
              <div class="form-group">
                <label for="keterangan">Keterangan</label>
                <textarea name="keterangan" cols="30" rows="2" class="form-control"></textarea>
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="col">
                    <label for="diagnosa">Suhu Tubuh</label>
                  </div>
                  <div class="col">
                    <label for="diagnosa">Tensi</label>
                  </div>
                </div>
                <div class="row">
                  <div class="col">
                    <input type="text" class="form-control" name="" id="">
                  </div>
                  <div class="col">
                    <input type="text" class="form-control" name="" id="">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="col">
                    <label for="diagnosa">Tinggi</label>
                  </div>
                  <div class="col">
                    <label for="diagnosa">Berat</label>
                  </div>
                </div>
                <div class="row">
                  <div class="col">
                    <input type="text" class="form-control" name="" id="">
                  </div>
                  <div class="col">
                    <input type="text" class="form-control" name="" id="">
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label for="keluhan">Keluhan</label>
                <textarea name="keluhan" cols="30" rows="2" class="form-control"></textarea>
              </div>
              <div class="form-group">
                <label for="pemeriksaan">Pemeriksaan</label>
                <input type="text" class="form-control" name="" id="">
              </div>
              <div class="form-group">
                <label for="dokter">Dokter</label>
                <select name="dokter" id="dokter" class="form-control">
                  <?php foreach ($l_dokter as $dokter) : ?>
                    <option value="<?= $dokter['id'] ?>"><?= $dokter['nama_dokter'] ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>