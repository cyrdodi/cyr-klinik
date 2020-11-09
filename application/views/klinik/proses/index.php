<div class="row">
  <div class="col">
    <div class="card ">
      <div class="card-body">
        <h3>Proses Klinik</h3>
      </div>
    </div>
  </div>
</div>
<div class="row mt-1">
  <div class="col-lg-5">
    <div class="card">
      <div class="card-body">
        <h4>Biodata Pasien</h4>
        <table class="table">
          <tr>
            <td>Medrek</td>
            <td><?= $pasien['medrek'] ?></td>
          </tr>
          <tr>
            <td>Nama</td>
            <td><?= $pasien['nama_lengkap'] ?></td>
          </tr>
          <tr>
            <td>JK</td>
            <td><?= $pasien['jk'] == 'l' ? 'Laki-laki' : 'Perempuan' ?></td>
          </tr>
          <tr>
            <td>TTL</td>
            <td><?= $pasien['tempat_lahir'] == 'l' ? 'Laki-laki' : 'Perempuan' ?></td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</div>