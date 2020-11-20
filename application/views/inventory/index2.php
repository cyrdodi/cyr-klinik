<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 uppercase">Inventory</div>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item"><a href="<?= base_url('Billing') ?>">Billing</a></li>
        <li class="breadcrumb-item"><a href="<?= base_url('Billing/pencarian/') ?>">Pencarian</a></li>
        <li class="breadcrumb-item active" aria-current="page">Detail</li>
      </ol>
    </nav>
  </div>
</div>
<div class="row">
  <div class="col">
    <div class="card shadow mb-4">
      <div class="card-body">
        <table id="table2" class="display" cellspacing="0" width="100%">
          <thead>
            <tr>
              <th>#</th>
              <th>Action</th>
              <th>Nama Obat & Alkes</th>
              <th>Satuan</th>
              <th>Jenis Obat</th>
              <th>Stok</th>
              <th>Harga</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  var table;
  $(document).ready(function() {

    //datatables
    table = $('#table2').DataTable({

      "processing": true,
      "serverSide": true,
      "order": [],

      "ajax": {
        "url": "<?php echo site_url('Inventory2/get_data_user') ?>",
        "type": "POST"
      },


      "columnDefs": [{
        "targets": [0],
        "orderable": false,
        "render": createManageBtn,
        "data": null,
        "targets": [0]
      }, ],

    });

  });

  function createManageBtn() {
    return '<button id="manageBtn" type="button" onclick="myFunc()" class="btn btn-success btn-xs">Manage</button>';
  }

  function myFunc() {
    console.log("Button was clicked!!!");
  }
</script>