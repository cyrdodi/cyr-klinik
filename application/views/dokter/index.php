<style>
  .scroll {
    max-height: 500px;
    overflow-y: auto;
  }
</style>
<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase">Manage Dokter</div>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item active" aria-current="page">Daftar Dokter</li>
      </ol>
    </nav>
  </div>
</div>
<?= $this->session->flashdata('msg') ?>
<div class="row">
  <div class="col-lg-4">
    <div class="card shadow mb-4  h-100">
      <div class="card-body">
        <div class="font-weight-bold">Add Dokter</div>
        <form action="" method="post">
          <div class="form-group">
            <label for="kodedokter">Kode Dokter</label>
            <input type="text" class="form-control" name="kodedokter">
            <?= form_error('kodedokter', '<small class="text-danger pl-3">', '</small>') ?>
          </div>
          <div class="form-group">
            <label for="namadokter">Nama Dokter</label>
            <input type="text" class="form-control" name="namadokter">
            <?= form_error('namadokter', '<small class="text-danger pl-3">', '</small>') ?>
          </div>
          <div class="form-group">
            <label for="jenis">Jenis</label>
            <select class="form-control" name="jenis">
              <option value="umum">Umum</option>
              <option value="spesialis">Spesialis</option>
            </select>
          </div>
          <div class="form-group">
            <label for="klinik">Klinik</label>
            <select name="klinik" id="klinik" class="form-control">
              <?php foreach ($l_klinik as $klinik) : ?>
                <option value="<?= $klinik['klinik_id'] ?>"><?= $klinik['nama_klinik'] ?></option>
              <?php endforeach; ?>
            </select>
          </div>
          <button type="submit" id="simpan-btn" class="btn btn-primary float-right"><i class="fas fa-check "></i> Simpan</button>
        </form>
      </div>
    </div>
  </div>
  <div class="col-lg-8 ">
    <div class="card shadow mb-4 h-100">
      <div class="card-body">
        <div class="row">
          <div class="col">
            <form action="" method="get" autocomplete="off">
              <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Masukan nama dokter" aria-label="Example text with button addon" name="keyword" aria-describedby="button-addon1" value="<?= $is_keyword ? $this->input->get('keyword') : '' ?>" autofocus>
                <div class="input-group-prepend">
                  <button class="btn btn-primary" type="submit" id="button-addon1"><i class="fas fa-search"></i> Cari</button>
                </div>
              </div>
            </form>
          </div>

        </div>
        <div class="row">

          <div class="col scroll">
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Kode Dokter</th>
                  <th>Nama Dokter</th>
                  <th>Jenis</th>
                  <th>Klinik</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <?php $i = 1; ?>
                <?php foreach ($search_result as $dokter) : ?>
                  <tr style="<?= redRow($dokter['is_active']) ?>">
                    <td><?= $i ?></td>
                    <td><?= $dokter['id'] ?></td>
                    <td><?= $dokter['nama_dokter'] ?></td>
                    <td><?= $dokter['jenis'] ?></td>
                    <td>
                      <div class="badge" <?= badgeKlinik($dokter['klinik_id']) ?>><?= $dokter['nama_klinik'] ?></div>
                    </td>
                    <td>
                      <button class="btn btn-primary btn-sm" dokter-id="<?= $dokter['id'] ?>" type=" button" data-toggle="modal" data-target="#editModal">
                        <i class="fas fa-pen"></i>
                      </button>
                    </td>
                  </tr>
                  <?php $i++ ?>
                <?php endforeach; ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Dokter</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="" method="post">
          <input type="text" class="form-control" id="editId" name="editId" hidden>
          <div class="form-group">
            <label for="editKodedokter">Kode Dokter</label>
            <input type="text" class="form-control" id="editKodedokter" name="editKodedokter" readonly>
          </div>
          <div class="form-group">
            <label for="editNamadokter">Nama Dokter</label>
            <input type="text" class="form-control" id="editNamadokter" name="editNamadokter">
          </div>
          <div class="form-group">
            <label for="editJenis">Jenis</label>
            <select name="editJenis" id="editJenis" class="form-control">
              <option value="umum">Umum</option>
              <option value="spesialis">Spesialis</option>
            </select>
          </div>
          <div class="form-group">
            <label for="editKlinik">Klinik</label>
            <select name="editKlinik" id="editKlinik" class="form-control">
              <?php foreach ($l_klinik as $klinik) : ?>
                <option value="<?= $klinik['klinik_id'] ?>"><?= $klinik['nama_klinik'] ?></option>
              <?php endforeach; ?>
            </select>
          </div>
          <div class="form-group">
            <label for="aktif">Aktif</label>
            <select name="aktif" id="aktif" class="form-control">
              <option value="1">Ya</option>
              <option value="0">Tidak</option>
            </select>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" name="editTarif" id="edit-btn" class="btn btn-primary">Update</button>
        </form>
      </div>
    </div>
  </div>
</div>
<script>
  $(document).ready(function() {
    $('#editModal').on('show.bs.modal', function(e) {
      // get information to update quickly to modal view as loading begins
      var opener = e.relatedTarget; //this holds the element who called the modal
      //we get details from attributes
      var id = $(opener).attr('dokter-id');
      //set what we got to our form
      $.ajax({
        type: 'post',
        url: "<?= base_url('Dokter/get_dokter_by_id') ?>",
        dataType: 'json',
        data: {
          'id': id
        },
        success: function(data) {
          $('#editKodedokter').val(data.id);
          $('#editNamadokter').val(data.nama_dokter);
          $('#editJenis').val(data.jenis);
          $('#editKlinik').val(data.klinik_id);
          $('#aktif').val(data.is_active);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
          alert("some error");
          console.log(errorThrown);
        }
      });
    })

    $('#edit-btn').click(function() {
      event.preventDefault();
      var id = $('#editKodedokter').val();
      var nama_dokter = $('#editNamadokter').val();
      var jenis = $('#editJenis').val();
      var klinik_id = $('#editKlinik').val();
      var is_active = $('#aktif').val();
      $.ajax({
        type: 'post',
        url: "<?= base_url('Dokter/edit_dokter') ?>",
        dataType: 'json',
        data: {
          'id': id,
          'nama_dokter': nama_dokter,
          'jenis': jenis,
          'klinik_id': klinik_id,
          'is_active': is_active
        },
        success: function(data) {
          $('#editModal').modal('toggle');
          location.reload();
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
          alert(textStatus);
          console.log(errorThrown);
        }
      })
    })
  })
</script>