<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase">Laporan Pendapatan</div>
  </div>
</div>
<div class="row">
  <div class="col mb-4">
    <form>
      <div class="form-row align-items-center">
        <div class="col-auto">
          <label class="sr-only" for="inlineFormInputGroup">Bulan</label>
          <div class="input-group mb-2">
            <div class="input-group-prepend">
              <div class="input-group-text">Bulan</div>
            </div>
            <select name="bln" class="form-control">
              <option value="01" <?= $this->input->get('bln') === '01' ? 'selected' : '' ?>>Januari</option>
              <option value="02" <?= $this->input->get('bln') === '02' ? 'selected' : '' ?>>Februari</option>
              <option value="03" <?= $this->input->get('bln') === '03' ? 'selected' : '' ?>>Maret</option>
              <option value="04" <?= $this->input->get('bln') === '04' ? 'selected' : '' ?>>April</option>
              <option value="05" <?= $this->input->get('bln') === '05' ? 'selected' : '' ?>>Mei</option>
              <option value="06" <?= $this->input->get('bln') === '06' ? 'selected' : '' ?>>Juni</option>
              <option value="07" <?= $this->input->get('bln') === '07' ? 'selected' : '' ?>>Juli</option>
              <option value="08" <?= $this->input->get('bln') === '08' ? 'selected' : '' ?>>Agustus</option>
              <option value="09" <?= $this->input->get('bln') === '09' ? 'selected' : '' ?>>September</option>
              <option value="10" <?= $this->input->get('bln') === '10' ? 'selected' : '' ?>>Oktober</option>
              <option value="11" <?= $this->input->get('bln') === '11' ? 'selected' : '' ?>>November</option>
              <option value="12" <?= $this->input->get('bln') === '12' ? 'selected' : '' ?>>Desember</option>
            </select>
          </div>
        </div>
        <div class="col-auto">
          <label class="sr-only" for="inlineFormInputGroup">Tahun</label>
          <div class="input-group mb-2">
            <div class="input-group-prepend">
              <div class="input-group-text">Tahun</div>
            </div>
            <input type="text" name="thn" class="form-control" value="<?= $this->input->get('thn') ?>">
          </div>
        </div>
        <div class="col-auto">
          <button type="submit" class="btn btn-primary mb-2" data-toggle="tooltip" title="Filter by Date"><i class="far fa-calendar-alt"></i></button>
        </div>
      </div>
    </form>
  </div>
</div>
<div class="row">
  <div class="col">
    <div class="card">

      <div class="card-body p-0">
        <table class="table table-sm">
          <thead>
            <tr>
              <th>#</th>
              <th style="width: 100px">Nomor</th>
              <th>Nama</th>
              <th>Alamat</th>
              <th>Pemeriksaan</th>
              <th>Tindakan</th>
              <th>Nominal</th>
            </tr>
          </thead>
          <tbody>
            <?php $i = 1; ?>
            <?php foreach ($general as $row) : ?>
              <?php
              $l_tindakan = $this->db->get_where('t_tindakan', ['klinik_transaction_id' => $row['id']])->result_array();
              $l_obat = $this->db->get_where('t_obat', ['klinik_transaction_id' => $row['id']])->result_array();
              ?>
              <tr>
                <td><?= $i ?></td>
                <td>
                  <table class="table-borderless">
                    <tr>
                      <td class="col text-muted text-sm"><small>Billing</small></td>
                      <td class="col"><small><?= $row['no_billing'] ?></small></td>
                    </tr>
                    <tr>
                      <td class="col text-muted text-sm"><small>Registrasi</small></td>
                      <td class="col"><small><?= $row['id'] ?></small></td>
                    </tr>
                    <tr>
                      <td class="col text-muted text-sm"><small>MR</small></td>
                      <td class="col"><small><?= $row['medrek'] ?></small></td>
                    </tr>
                  </table>
                </td>
                <td><?= $row['nama_lengkap'] ?></td>
                <td><?= $row['kecamatan'] . ' - ' . $row['kabupaten'] ?></td>
                <td><?= $row['pemeriksaan'] ?></td>
                <td>
                  <ul>
                    <?php foreach ($l_tindakan as $tindakan) : ?>
                      <li><?= $tindakan['nama_tindakan'] ?></li>
                    <?php endforeach; ?>
                  </ul>
                </td>
                <td><?= number_format($row['total_bayar']) ?></td>
              </tr>
              <?php $i++ ?>
            <?php endforeach; ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>