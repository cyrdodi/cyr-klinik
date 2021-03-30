<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase">Edit Data Pasien</div>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item"><a href="<?= base_url('Registrasi') ?>">Pencarian</a></li>
        <li class="breadcrumb-item active" aria-current="page">Edit Data Pasien</li>
      </ol>
    </nav>
  </div>
</div>

<div class="row">
  <div class="col">
    <div class="card shadow-sm">
      <div class="card-body">
        <?= $this->session->flashdata('data_pasien_msg') ?>
        <div class="row">
          <div class="col-lg-8 border-right">
            <form autocomplete="off" action="" method="post">
              <div class="form-group">
                <label for="medrek">Nama Pasien</label>
                <input type="text" name="nama_lengkap" class="form-control mb-2" placeholder="Nama Lengkap" value="<?= $pasien['nama_lengkap'] ?>">
                <?= form_error('nama_lengkap', '<small class="text-danger ">', '</small>') ?>
              </div>
              <hr>
              <div class="form-group">
                <div class="row">
                  <div class="col">
                    <input type="text" class="form-control" name="nik" placeholder="NIK" value="<?= $pasien['nik'] ?>">
                  </div>
                  <div class="col">
                    <input type="text" class="form-control" name="no_bpjs" placeholder="No. BPJS" value="<?= $pasien['no_bpjs'] ?>">
                  </div>
                </div>
              </div>
              <hr>
              <div class="form-group">
                <label for="jk">Jenis Kelamin <i class="fas fa-venus-mars"></i></label>
                <select name="jk" id="jk" class="form-control">
                  <option value="l" <?= $pasien['jk'] == 'l' ? 'selected' : '' ?>>Laki-laki</option>
                  <option value="p" <?= $pasien['jk'] == 'p' ? 'selected' : '' ?>>Perempuan</option>
                </select>
                <?= form_error('jk', '<small class="text-danger ">', '</small>') ?>
              </div>
              <hr>

              <div class="form-group">
                <label for="tgl_lhr">Tempat & Tanggal Lahir</label>
                <div class="row">
                  <div class="col">
                    <input type="text" class="form-control" name="tempat_lahir" value="<?= $pasien['tempat_lahir'] ?>" placeholder="tempat lahir">
                    <?= form_error('tempat_lahir', '<small class="text-danger ">', '</small>') ?>
                  </div>
                  <div class="col">
                    <input type="number" name="tgl_lhr" class="form-control" id="tgl_lhr" placeholder="tanggal" min="1" max="31" value="<?= substr($pasien['tgl_lahir'], 8, 2) ?>">
                    <?= form_error('tgl_lhr', '<small class="text-danger ">', '</small>') ?>
                  </div>
                  <div class="col">
                    <select name="bulan_lhr" id="bulan_lhr" class="form-control">
                      <option value="">-- pilih bulan --</option>
                      <option value="01" <?= substr($pasien['tgl_lahir'], 5, 2) == '01' ? 'selected' : ''  ?>>Januari</option>
                      <option value="02" <?= substr($pasien['tgl_lahir'], 5, 2) == '02' ? 'selected' : ''  ?>>Februari</option>
                      <option value="03" <?= substr($pasien['tgl_lahir'], 5, 2) == '03' ? 'selected' : ''  ?>>Maret</option>
                      <option value="04" <?= substr($pasien['tgl_lahir'], 5, 2) == '04' ? 'selected' : ''  ?>>April</option>
                      <option value="05" <?= substr($pasien['tgl_lahir'], 5, 2) == '05' ? 'selected' : ''  ?>>Mei</option>
                      <option value="06" <?= substr($pasien['tgl_lahir'], 5, 2) == '06' ? 'selected' : ''  ?>>Juni</option>
                      <option value="07" <?= substr($pasien['tgl_lahir'], 5, 2) == '07' ? 'selected' : ''  ?>>Juli</option>
                      <option value="08" <?= substr($pasien['tgl_lahir'], 5, 2) == '08' ? 'selected' : ''  ?>>Agustus</option>
                      <option value="09" <?= substr($pasien['tgl_lahir'], 5, 2) == '09' ? 'selected' : ''  ?>>September</option>
                      <option value="10" <?= substr($pasien['tgl_lahir'], 5, 2) == '10' ? 'selected' : ''  ?>>Oktober</option>
                      <option value="11" <?= substr($pasien['tgl_lahir'], 5, 2) == '11' ? 'selected' : ''  ?>>November</option>
                      <option value="12" <?= substr($pasien['tgl_lahir'], 5, 2) == '12' ? 'selected' : ''  ?>>Desember</option>
                    </select>
                    <?= form_error('bulan_lhr', '<small class="text-danger ">', '</small>') ?>
                  </div>
                  <div class="col">
                    <input type="number" name="tahun_lhr" class="form-control" id="tahun_lhr" placeholder="tahun" min="1910" max="<?= date('Y') ?>" value="<?= substr($pasien['tgl_lahir'], 0, 4) ?>">
                    <?= form_error('tahun_lhr', '<small class="text-danger">', '</small>') ?>
                  </div>
                </div>
              </div>
              <hr>
              <label for="alamat">Alamat</label>
              <div class="form-group">
                <textarea name="alamat" id="alamat" rows="2" class="form-control" placeholder="Jalan/Komplek/Kampung"><?= $pasien['alamat'] ?></textarea>
                <?= form_error('alamat', '<small class="text-danger ">', '</small>') ?>
              </div>
              <div class="row">
                <div class="col">
                  <div class="form-group">
                    <select name="provinsi" class="form-control" id="provinsi">
                      <option value="">-- pilih provinsi --</option>
                      <?php foreach ($provinsi as $prov) : ?>
                        <option dataId="<?= $prov['id'] ?>" value="<?= $prov['name'] ?>"><?= $prov['name'] ?></option>
                      <?php endforeach; ?>
                    </select>
                    <?= form_error('provinsi', '<small class="text-danger ">', '</small>') ?>
                  </div>
                </div>
                <div class="col">
                  <div class="form-group">
                    <div id="loader-kabupaten" class="text-center" disabled style="display:none;">
                      <span class="spinner-border spinner-border-sm" role="status"></span>
                      Mohon tunggu...
                    </div>
                    <select name="kabupaten" class="form-control" id="kabupaten">
                      <option value="">-- pilih kabupaten --</option>
                    </select>
                    <?= form_error('kabupaten', '<small class="text-danger ">', '</small>') ?>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <div class="form-group">
                    <select name="kecamatan" class="form-control" id="kecamatan">
                      <option value="">-- pilih kecamatan --</option>
                    </select>
                    <?= form_error('kecamatan', '<small class="text-danger ">', '</small>') ?>
                  </div>
                </div>
                <div class="col">
                  <div class="form-group">
                    <select name="kelurahan" class="form-control" id="kelurahan">
                      <option value="">-- pilih kelurahan --</option>
                    </select>
                    <?= form_error('kelurahan', '<small class="text-danger ">', '</small>') ?>
                  </div>
                </div>
              </div>
          </div>
          <hr>
          <div class="col-lg-4 border-left">
            <div class="form-group">
              <label for="no_hp">No. HP</label>
              <input type="text" class="form-control" name="no_hp" value="<?= $pasien['no_hp'] ?>">
              <?= form_error('no_hp', '<small class="text-danger ">', '</small>') ?>
            </div>
            <div class="form-group">
              <label for="agama">Agama</label>
              <select name="agama" id="agama" class="form-control">
                <option value="">-- pilih agama --</option>
                <option value="katolik" <?= set_select('agama', 'katolik') ?>>Katolik</option>
                <option value="kristen" <?= set_select('agama', 'kristen') ?>>Kristen</option>
                <option value="islam" <?= set_select('agama', 'islam') ?>>Islam</option>
                <option value="budha" <?= set_select('agama', 'budha') ?>>Budha</option>
                <option value="hindu" <?= set_select('agama', 'hindu') ?>>Hindu</option>
                <option value="lainnya" <?= set_select('agama', 'lainnya') ?>>Lainnya</option>
              </select>
              <?= form_error('agama', '<small class="text-danger ">', '</small>') ?>
            </div>
            <div class="form-group">
              <label for="pekerjaan">Pekerjaan</label>
              <input type="text" class="form-control" name="pekerjaan" id="pekerjaan" value="<?= $pasien['pekerjaan'] ?>">
              <?= form_error('pekerjaan', '<small class="text-danger ">', '</small>') ?>
            </div>
            <div class="form-group">
              <label for="status">Status Perkawinan</label>
              <select name="status" id="status" class="form-control">
                <option value="">-- pilih status --</option>
                <option value="menikah" <?= set_select('status', 'menikah') ?>>Menikah</option>
                <option value="belum menikah" <?= set_select('status', 'belum menikah') ?>>Belum Menikah</option>
                <option value="tidak menikah" <?= set_select('status', 'tidak menikah') ?>>Tidak Menikah</option>
                <option value="tidak menikah" <?= set_select('status', 'tidak menikah') ?>>Janda</option>
                <option value="tidak menikah" <?= set_select('status', 'tidak menikah') ?>>Duda</option>
                <option value="dibawah umur" <?= set_select('status', 'dibawah umur') ?>>Dibawah Umur</option>
              </select>
              <?= form_error('status', '<small class="text-danger ">', '</small>') ?>
            </div>
            <hr>
            <div class="form-group">
              <label for="penjamin">Nama Penjamin</label>
              <input type="text" class="form-control" name="penjamin" value="<?= $pasien['nama_penjamin'] ?>">
            </div>
            <div class="form-group">
              <label for="no_hp_penjamin">No. HP Penjamin</label>
              <input type="text" class="form-control" name="no_hp_penjamin" value="<?= $pasien['no_hp_penjamin'] ?>">
            </div>
            <div class="form-group">
              <label for="hubungan">Hubungan</label>
              <input type="text" class="form-control" name="hubungan" id="hubungan" value="<?= $pasien['hubungan'] ?>">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <hr>
            <button type="submit" class="btn btn-primary float-right"><i class="fas fa-check-circle"></i> Update</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  let pasien = <?= json_encode($pasien) ?>;
  $(document).ready(function() {
    var daftarPekerjaan = [
      "Pegawai Negeri Sipil/PNS/ASN",
      "Pegawai/Karyawan Swasta",
      "Wiraswasta/Pengusaha",
      "Pedagang",
      "Pensiunan",
      "TNI",
      "Polisi/Polri",
      "Nelayan",
      "Petani",
      "Pekerja Lepas/Buruh Harian",
      "Ibu Rumah Tangga/IRT",
      "Pelajar",
      "Mahasiswa",
      "Dibawah Umur",
      "Tidak Bekerja",
      "Tidak Tahu",
    ];
    var daftarHubungan = [
      "Ayah",
      "Ibu",
      "Anak",
      "Saudara Kandung",
      "Kakak",
      "Adik",
      "Keluarga Dekat",
      "Kerabat/Teman",
      "Suami",
      "Istri",
      "Lainnya",
    ];

    // autocumplete
    $('#hubungan').autocomplete({
      source: daftarHubungan
    }).focus(function() {
      $(this).autocomplete('search', $(this).val())
    });
    $('#pekerjaan').autocomplete({
      source: daftarPekerjaan
    }).focus(function() {
      $(this).autocomplete('search', $(this).val())
    });

    // dependent address
    // provinsi
    $('#provinsi').change(function() {
      $('#loader-kabupaten').show();
      $('#kabupaten').hide();
      var id = $('option:selected', this).attr('dataId');
      $('#kecamatan').html('<option value="">--pilih kecamatan--</option>');
      $('#kelurahan').html('<option value="">--pilih kelurahan--</option>');
      $.ajax({
        type: 'POST',
        url: "<?= base_url('Registrasi/get_kabupaten_') ?>",
        dataType: 'JSON',
        data: {
          province: id
        },
        success: function(data) {
          var html = '<option value="">--pilih kabupaten--</option>';
          $.each(data, function(i, v) {
            html += `<option value="` + v.name + `" dataId="` + v.id + `" >` + v.name + `</option>`
          });
          $('#kabupaten').html(html);
          $('#loader-kabupaten').hide();
          $('#kabupaten').show();
          $('#kabupaten').val(pasien.kabupaten.toUpperCase()); // Set value 
          $('#kabupaten').trigger('change'); // triger next option
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.log(jqXHR);
        }
      })
    })

    // kabupaten
    $('#kabupaten').change(function() {
      $('#kecamatan').hide();
      $('#loader-kecamatan').show();
      var id = $('option:selected', this).attr('dataId');
      $('#kelurahan').html('<option value="">--pilih kelurahan--</option>');
      $.ajax({
        type: 'POST',
        url: "<?= base_url('Registrasi/get_kecamatan_') ?>",
        dataType: 'JSON',
        data: {
          regency: id
        },
        success: function(data) {
          var html = '<option value="">--pilih kecamatan--</option>';
          $.each(data, function(i, v) {
            html += `<option value="` + v.name + `" dataId="` + v.id + `">` + v.name + `</option>`
          });
          $('#kecamatan').html(html);
          $('#loader-kecamatan').hide();
          $('#kecamatan').show();
          $('#kecamatan').val(pasien.kecamatan.toUpperCase()); // Set value 
          $('#kecamatan').trigger('change'); // triger next option
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.log(errorThrown);
        }
      })
    })

    // kecamatan
    $('#kecamatan').change(function() {
      $('#loader-kelurahan').show();
      $('#kelurahan').hide();
      var id = $('option:selected', this).attr('dataId');
      $.ajax({
        type: 'POST',
        url: "<?= base_url('Registrasi/get_kelurahan_') ?>",
        dataType: 'JSON',
        data: {
          district: id
        },
        success: function(data) {
          var html = '<option value="">--pilih kelurahan--</option>';
          $.each(data, function(i, v) {
            html += `<option value="` + v.name + `" dataId="` + v.id + `">` + v.name + `</option>`
          });
          $('#kelurahan').html(html);
          $('#loader-kelurahan').hide();
          $('#kelurahan').show();
          $('#kelurahan').val(pasien.kelurahan.toUpperCase()); // Set value 
          $('#kelurahan').trigger('change'); // triger next option
          console.log(data)
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.log(errorThrown);
        }
      })
    })

    $('#agama').val(pasien.agama)
    $('#status').val(pasien.status_perkawinan)
    $('#provinsi').val(pasien.provinsi.toUpperCase());
    $('#provinsi').trigger('change'); // trigger change agar fungsi ajax dijalankan
    console.log($('#provinsi').val())
  })
</script>