<?php
function role($id)
{
  if ($id == '1') {
    return 'Admin';
  } else if ($id == '2') {
    return 'Super User';
  } else if ($id == '3') {
    return 'User';
  }
}
?>
<div class="row">
  <div class="col align-self-center">
    <div class="font-weight-bold mb-4 text-uppercase">User Setup</div>
  </div>
  <div class="col-auto">
    <nav aria-label="breadcrumb ">
      <ol class="breadcrumb bg-light">
        <!-- <li class="breadcrumb-item"><a href="<?= base_url('Inventory') ?>">Inventory</a></li>
        <li class="breadcrumb-item"><a href="<?= base_url('Inventory') ?>">Stock In</a></li>
        <li class="breadcrumb-item active" aria-current="page">Add Stock In</li> -->
      </ol>
    </nav>
  </div>
</div>
<?= $this->session->flashdata('msg') ?>
<div class="row">
  <div class="col">
    <div class="card shadow mb-4">
      <div class="card-body">
        <div class="row">
          <div class="col">
            <a href="<?= base_url('Auth/registration') ?>" class="btn btn-primary mb-4"> <i class="fas fa-plus-circle"></i> User</a>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <table class="table table-sm">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Username</th>
                  <th>Nama Akun</th>
                  <th>Role</th>
                  <th>Petugas</th>
                  <th class="text-center">Action</th>
                </tr>
              </thead>
              <tbody>
                <?php $i = 1; ?>
                <?php foreach ($users as $user) : ?>
                  <tr style="<?= redRow($user['is_active']) ?>">
                    <td><?= $i ?></td>
                    <td><?= $user['username'] ?></td>
                    <td><?= $user['nama'] ?></td>
                    <td><?= role($user['role_id']) ?></td>
                    <td><?= $user['petugas'] ?></td>
                    <td class=" text-center">
                      <button class="btn btn-primary btn-sm" user-id="<?= $user['id'] ?>" type=" button" data-toggle="modal" data-target="#editModal">
                        <i class="fas fa-pen"></i>
                      </button>
                      <a href="<?= base_url('User/reset_password/' . encrypt_url($user['id'])) ?>" class="btn btn-warning btn-sm"><i class="fas fa-key"></i></a>
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
        <h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="" method="post">
          <input type="text" class="form-control" id="id" name="id" hidden>
          <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" name="username" readonly>
          </div>
          <div class="form-group">
            <label for="namauser">Nama User</label>
            <input type="text" class="form-control" id="namauser" name="namauser">
          </div>
          <div class="form-group">
            <label for="petugas">Petugas</label>
            <select name="petugas" id="petugas" class="form-control">
              <option value="perawat">Perawat</option>
              <option value="farmasi">Farmasi</option>
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
  $('#editModal').on('show.bs.modal', function(e) {
    // get information to update quickly to modal view as loading begins
    var opener = e.relatedTarget; //this holds the element who called the modal
    //we get details from attributes
    var id = $(opener).attr('user-id');
    //set what we got to our form
    $.ajax({
      type: 'post',
      url: "<?= base_url('User/get_user_by_id') ?>",
      dataType: 'json',
      data: {
        'id': id
      },
      success: function(data) {
        $('#id').val(data.id);
        $('#username').val(data.username);
        $('#namauser').val(data.nama);
        $('#petugas').val(data.petugas);
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
    var id = $('#id').val();
    var username = $('#username').val();
    var namauser = $('#namauser').val();
    var petugas = $('#petugas').val();
    var aktif = $('#aktif').val();
    $.ajax({
      type: 'post',
      url: "<?= base_url('User/edit_user') ?>",
      dataType: 'json',
      data: {
        'id': id,
        'username': username,
        'namauser': namauser,
        'petugas': petugas,
        'aktif': aktif
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
</script>