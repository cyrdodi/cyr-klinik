<div class="row">
  <div class="col-lg-6 mb-4">
    <div class="card shadow">
      <div class="card-body">
        <h4>Input Biaya Obat & Alkes</h4>
        <hr>
        <?= $this->session->flashdata('msg') ?>
        <form action="" method="post">
          <div class="form-group">
            <label for="obat">Obat & Alkes</label>
            <select name="obat" id="obat" class="form-control" autofocus required>
            </select>
            <?= form_error('obat', '<small class="text-danger pl-3">', '</small>') ?>
          </div>
          <div class="form-group">
            <label for="jumlah">Jumlah</label>
            <input type="number" class="form-control" id="jumlah" name="jumlah" min="1" max="" required>
            <?= form_error('jumlah', '<small class="text-danger pl-3">', '</small>') ?>
          </div>
          <div id="warning"></div>
          <button type="submit" class="btn btn-primary float-right"><i class="fas fa-plus mr-2"></i>Tambah</button>
          <a href="<?= base_url('Klinik/proses_klinik/' . $this->uri->segment(3)) ?>" class="btn btn-secondary">Kembali</a>
        </form>
      </div>
    </div>
  </div>
  <div class="col-lg-6 mb-4">
    <div class="card border-left-success shadow">
      <div class="card-body">
        <h4>Daftar Obat & Alkes</h4>
        <?= $this->session->flashdata('msg_delete') ?>
        <table class="table table-sm table-striped">
          <thead>
            <tr>
              <th>No</th>
              <th>Nama Obat & Alkes</th>
              <th class="text-right">Harga</th>
              <th class="text-right">Jumlah</th>
              <th class="text-right">Total</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <?php $i = 1; ?>
            <?php $total = 0; ?>
            <?php foreach ($l_obat as $obat) : ?>
              <?php $totalrow = $obat['harga'] * $obat['jumlah'] ?>
              <tr>
                <td><?= $i ?></td>
                <td><?= $obat['nama_obat'] . ' / ' . $obat['satuan'] ?></td>
                <td class="text-right"><?= number_format($obat['harga'])  ?></td>
                <td class="text-right"><?= number_format($obat['jumlah']) ?></td>
                <td class="text-right"><?= number_format($totalrow) ?></td>
                <td class="text-center"><a href="<?= base_url('Klinik/delete_obat/' . encrypt_url($obat['id'])) ?>" class="btn btn-sm btn-danger btn-circle" onclick="return confirm('Yakin mau dihapus?')"><i class="fas fa-trash-alt"></i></a></td>
              </tr>
              <?php $total += $totalrow; ?>
              <?php $i++ ?>
            <?php endforeach; ?>
          </tbody>
          <tfoot>
            <tr>
              <th colspan="4">Total</th>
              <th class="text-right"><?= number_format($total) ?></th>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>
  </div>
</div>

<script>
  $(document).ready(function() {
    $('#obat').select2({
      placeholder: '-- pilih obat --',
      ajax: {
        url: '<?= base_url('Klinik/searchObat') ?>',
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

    $('#obat').change(function() {
      console.log(this.value);
      $.ajax({
        url: "<?= base_url('Klinik/getStok') ?>",
        type: 'post',
        dataType: 'json',
        data: {
          'id': this.value
        },
        success: function(data) {
          console.log(data.stok)
          $('#jumlah').attr("max", data.stok);
          $('#warning').html(`<div class="alert alert-info" role="alert">Stok : ` +
            data.stok + `</div>`)
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
          alert("some error");
          console.log(errorThrown);
        }
      });

    })



  })
</script>