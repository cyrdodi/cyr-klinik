<div class="row">
  <div class="col">
    <div class="card shadow-sm">
      <div class="card-body">
        <h3> Registrasi Pasien Baru</h3>
        <hr>
        <?= $this->session->flashdata('data_pasien_msg') ?>
        <div class="row">
          <div class="col-lg-8 border-right">
            <form autocomplete="off" action="" method="post">
              <div class="form-group">
                <label for="medrek">Nama Pasien</label>
                <input type="text" name="nama_lengkap" class="form-control mb-2" placeholder="Nama Lengkap" value="<?= set_value('nama_lengkap') ?>">
                <?= form_error('nama_lengkap', '<small class="text-danger ">', '</small>') ?>
              </div>
              <hr>
              <div class="form-group">
                <div class="row">
                  <div class="col">
                    <input type="text" class="form-control" name="nik" placeholder="NIK" value="<?= set_value('nik') ?>">
                  </div>
                  <div class="col">
                    <input type="text" class="form-control" name="no_bpjs" placeholder="No. BPJS" value="<?= set_value('no_bpjs') ?>">
                  </div>
                </div>
              </div>
              <hr>
              <div class="form-group">
                <label for="jk">Jenis Kelamin <i class="fas fa-venus-mars"></i></label>
                <select name="jk" id="jk" class="form-control">
                  <option value="l" <?= set_select('jk', 'l') ?>>Laki-laki</option>
                  <option value="p" <?= set_select('jk', 'p') ?>>Perempuan</option>
                </select>
                <?= form_error('jk', '<small class="text-danger ">', '</small>') ?>
              </div>
              <hr>

              <div class="form-group">
                <label for="tgl_lhr">Tempat & Tanggal Lahir</label>
                <div class="row">
                  <div class="col">
                    <input type="text" class="form-control" name="tempat_lahir" value="<?= set_value('tempat_lahir') ?>" placeholder="tempat lahir">
                    <?= form_error('tempat_lahir', '<small class="text-danger ">', '</small>') ?>
                  </div>
                  <div class="col">
                    <input type="number" name="tgl_lhr" class="form-control" id="tgl_lhr" placeholder="tanggal" min="1" max="31" value="<?= set_value('tgl_lhr') ?>">
                    <?= form_error('tgl_lhr', '<small class="text-danger ">', '</small>') ?>
                  </div>
                  <div class="col">
                    <select name="bulan_lhr" id="bulan_lhr" class="form-control">
                      <option value="">-- pilih bulan --</option>
                      <option value="01" <?= set_select('bulan_lhr', '01') ?>>Januari</option>
                      <option value="02" <?= set_select('bulan_lhr', '02') ?>>Februari</option>
                      <option value="03" <?= set_select('bulan_lhr', '03') ?>>Maret</option>
                      <option value="04" <?= set_select('bulan_lhr', '04') ?>>April</option>
                      <option value="05" <?= set_select('bulan_lhr', '05') ?>>Mei</option>
                      <option value="06" <?= set_select('bulan_lhr', '06') ?>>Juni</option>
                      <option value="07" <?= set_select('bulan_lhr', '07') ?>>Juli</option>
                      <option value="08" <?= set_select('bulan_lhr', '08') ?>>Agustus</option>
                      <option value="09" <?= set_select('bulan_lhr', '09') ?>>September</option>
                      <option value="10" <?= set_select('bulan_lhr', '10') ?>>Oktober</option>
                      <option value="11" <?= set_select('bulan_lhr', '11') ?>>November</option>
                      <option value="12" <?= set_select('bulan_lhr', '12') ?>>Desember</option>
                    </select>
                    <?= form_error('bulan_lhr', '<small class="text-danger ">', '</small>') ?>
                  </div>
                  <div class="col">
                    <input type="number" name="tahun_lhr" class="form-control" id="tahun_lhr" placeholder="tahun" min="1910" max="<?= date('Y') ?>" value="<?= set_value('tahun_lhr') ?>">
                    <?= form_error('tahun_lhr', '<small class="text-danger">', '</small>') ?>
                  </div>
                </div>
              </div>
              <hr>
              <label for="alamat">Alamat</label>
              <div class="form-group">
                <textarea name="alamat" id="alamat" rows="2" class="form-control" placeholder="Jalan/Komplek/Kampung"><?= set_value('alamat') ?></textarea>
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
              <input type="text" class="form-control" name="no_hp" value="<?= set_value('no_hp') ?>">
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
              <input type="text" class="form-control" name="pekerjaan" id="pekerjaan" value="<?= set_value('pekerjaan') ?>">
              <?= form_error('pekerjaan', '<small class="text-danger ">', '</small>') ?>
            </div>
            <div class="form-group">
              <label for="status">Status Perkawinan</label>
              <select name="status" id="status" class="form-control">
                <option value="">-- pilih status --</option>
                <option value="menikah" <?= set_select('status', 'menikah') ?>>Menikah</option>
                <option value="belum menikah" <?= set_select('status', 'belum menikah') ?>>Belum Menikah</option>
                <option value="tidak menikah" <?= set_select('status', 'tidak menikah') ?>>Tidak Menikah</option>
                <option value="dibawah umur" <?= set_select('status', 'dibawah umur') ?>>Dibawah Umur</option>
              </select>
              <?= form_error('status', '<small class="text-danger ">', '</small>') ?>
            </div>
            <hr>
            <div class="form-group">
              <label for="penjamin">Nama Penjamin</label>
              <input type="text" class="form-control" name="penjamin" value="<?= set_value('penjamin') ?>">
            </div>
            <div class="form-group">
              <label for="no_hp_penjamin">No. HP Penjamin</label>
              <input type="text" class="form-control" name="no_hp_penjamin" value="<?= set_value('no_hp_penjamin') ?>">
            </div>
            <div class="form-group">
              <label for="hubungan">Hubungan</label>
              <input type="text" class="form-control" name="hubungan" id="hubungan" value="<?= set_value('hubungan') ?>">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <hr>
            <button type="submit" class="btn btn-primary float-right"><i class="fas fa-check-circle"></i> Simpan</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
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
          $('#kabupaten').val(<?= json_encode(set_value('kabupaten')); ?>); // Set value 
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
          $('#kecamatan').val(<?= json_encode(set_value('kecamatan')); ?>); // Set value 
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
          $('#kelurahan').val(<?= json_encode(set_value('kelurahan')); ?>); // Set value 
          $('#kelurahan').trigger('change'); // triger next option
          console.log(data)
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.log(errorThrown);
        }
      })
    })

  })
</script>