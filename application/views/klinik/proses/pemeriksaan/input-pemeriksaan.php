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
                <label for="dokter">Dokter</label>
                <select name="dokter" id="dokter" class="form-control">
                  <?php foreach ($l_dokter as $dokter) : ?>
                    <option value="<?= $dokter['id'] ?>"><?= $dokter['nama_dokter'] ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="form-group">
                <label for="keluhan">Keluhan</label>
                <textarea name="keluhan" cols="30" rows="2" class="form-control"><?= set_value('keluhan') ?></textarea>
                <?= form_error('keluhan', '<small class="text-danger pl-3">', '</small>') ?>
              </div>
              <div class="form-group">
                <label for="pemeriksaan">Pemeriksaan</label>
                <input type="text" class="form-control" name="pemeriksaan" value="<?= set_value('pemeriksaan') ?>">
                <?= form_error('pemeriksaan', '<small class="text-danger pl-3">', '</small>') ?>
              </div>
              <div class="form-group">
                <label for="diagnosa">ICD 10</label>
                <select name="diagnosa" id="diagnosa" class="form-control"></select>
                <?= form_error('diagnosa', '<small class="text-danger pl-3">', '</small>') ?>
              </div>
              <div class="form-group">
                <label for="nama_diagnosa">Diagnosa</label>
                <input type="text" class="form-control" name="nama_diagnosa" id="namaDx" readonly>
              </div>
              <div class="form-group">
                <label for="keterangan">Keterangan</label>
                <textarea name="keterangan" cols="30" rows="2" class="form-control"><?= set_value('keterangan') ?></textarea>
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="col">
                    <label for="suhu">Suhu Tubuh</label>
                  </div>
                  <div class="col">
                    <label for="tensi">Tensi</label>
                  </div>
                </div>
                <div class="row">
                  <div class="col">
                    <input type="text" class="form-control" name="suhu" id="" value="<?= set_value('suhu') ?>">
                  </div>
                  <div class="col">
                    <input type="text" class="form-control" name="tensi" id="" value="<?= set_value('tensi') ?>">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="col">
                    <label for="tinggi">Tinggi</label>
                  </div>
                  <div class="col">
                    <label for="berat">Berat</label>
                  </div>
                </div>
                <div class="row">
                  <div class="col">
                    <input type="text" class="form-control" name="tinggi" id="" value="<?= set_value('tinggi') ?>">
                  </div>
                  <div class="col">
                    <input type="text" class="form-control" name="berat" id="" value="<?= set_value('berat') ?>">
                  </div>
                </div>
              </div>
              <button type="submit" class="btn btn-primary float-right"><i class="fas fa-check    "></i> Simpan</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  $(document).ready(function() {
    $('#diagnosa').select2({
      placeholder: '-- pilih icd 10 --',
      ajax: {
        url: '<?= base_url('Klinik/searchDx') ?>',
        type: 'POST',
        dataType: 'json',
        data: function(params) {
          return {
            searchTerm: params.term // search term
          };
        },
        processResults: function(response) {
          return {
            results: response
          };
        },
        pagination: {
          more: true
        },
        cache: true
      }
    });

    $('#diagnosa').change(function() {
      $.ajax({
        url: "<?= base_url('Klinik/getNamaDx') ?>",
        type: 'post',
        dataType: 'json',
        data: {
          'id': this.value
        },
        success: function(data) {
          console.log(data.stok)
          $('#namaDx').val(data.nama_diagnosa);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
          alert("some error");
          console.log(errorThrown);
        }
      });
    })
  })
</script>