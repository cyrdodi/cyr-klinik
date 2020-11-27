<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title><?= $title ?></title>

  <!-- Custom fonts for this template-->
  <link rel="stylesheet" href="<?= base_url('assets/') ?>fontawesome/css/all.css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <!-- <link href="<?= base_url('assets/') ?>css/sb-admin-2.min.css" rel="stylesheet"> -->
  <link href="<?= base_url('assets/') ?>css/main.css" rel="stylesheet">

  <!-- css -->
  <link rel="stylesheet" href="<?= base_url('assets/') ?>jquery-ui-1.12.1/jquery-ui.css">
  <link rel="stylesheet" href="<?= base_url('assets/css/select2.min.css') ?>">
  <link rel="stylesheet" href="<?= base_url('assets/vendor/datatables2/datatables.min.css') ?>">

  <!-- Bootstrap core JavaScript-->
  <script src="<?= base_url('assets/') ?>js/jquery-3.4.1.min.js"></script>
  <script src="<?= base_url('assets/') ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<?= base_url('assets/') ?>vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="<?= base_url('assets/') ?>js/sb-admin-2.min.js"></script>

  <!-- js -->
  <script src="<?= base_url('assets/') ?>jquery-ui-1.12.1/jquery-ui.min.js"></script>
  <script src="<?= base_url('assets/') ?>vendor/datatables2/datatables.min.js"></script>
  <script src="<?= base_url('assets/js/select2.min.js') ?>"></script>
  <script src="<?= base_url('assets/js/autocomplete.js') ?>"></script>
  <script type="text/javascript" src="<?= base_url(); ?>assets/js/autoNumeric.min.js"></script>

  <link rel="icon" type="image/png" href="<?= base_url('assets/img/logo-by.png') ?>" />
  <!-- <link rel="icon" type="image/png" href="https://example.com/favicon.png" /> -->
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
        <div class="sidebar-brand-icon">
          <!-- <i class="fas fa-mug-hot"></i> -->
        </div>
        <div class="sidebar-brand-text mx-3">cyr-simklinik</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Modul
      </div>
      <?php if ($this->session->userdata('role_id') == '1' || $this->session->userdata('role_id') == '2' || $this->session->userdata('petugas') == 'perawat') : ?>
        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-users"></i>
            <span>Registrasi</span>
          </a>
          <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="<?= base_url('Registrasi') ?>">Pendaftaran</a>
              <a class="collapse-item" href="<?= base_url('Registrasi/Pasien_baru') ?>">Pasien Baru</a>
              <div class="dropdown-divider"></div>
              <a class="collapse-item" href="cards.html"><i class="fas fa-search"></i> Cari Pasien</a>
            </div>
          </div>
        </li>

        <!-- Nav Item - Klinik Collapse Menu -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseKlinik" aria-expanded="true" aria-controls="collapseKlinik">
            <i class="fas fa-clinic-medical"></i>
            <span>Klinik</span>
          </a>
          <div id="collapseKlinik" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="<?= base_url('Klinik') ?>">Antrean Klinik</a>
            </div>
          </div>
        </li>

        <!-- Nav Item - Billing Collapse Menu -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBilling" aria-expanded="true" aria-controls="collapseBilling">
            <i class="fas fa-file-invoice-dollar"></i>
            <span>Billing</span>
          </a>
          <div id="collapseBilling" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="<?= base_url('Billing') ?>">Antrean</a>
              <a class="collapse-item" href="<?= base_url('Billing/pencarian') ?>">Pencarian</a>
            </div>
          </div>
        </li>
      <?php endif; ?>
      <?php if ($this->session->userdata('role_id') == '1' || $this->session->userdata('role_id') == '2' || $this->session->userdata('petugas') == 'farmasi') : ?>
        <!-- Nav Item - Inventory Collapse Menu -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseInventory" aria-expanded="true" aria-controls="collapseInventory">
            <i class="fas fa-dolly-flatbed"></i>
            <span>Inventory</span>
          </a>
          <div id="collapseInventory" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="<?= base_url('Inventory') ?>">Daftar Obat & Alkes</a>
              <h6 class="collapse-header">Transaksi</h6>
              <a class="collapse-item" href="<?= base_url('Inventory/stock_in') ?>">Stock In</a>
              <a class="collapse-item" href="<?= base_url('Inventory/stock_out') ?>">Stock Out</a>
            </div>
          </div>
        </li>
      <?php endif; ?>
      <?php if ($this->session->userdata('role_id') == '1' || $this->session->userdata('role_id') == '2') : ?>
        <!-- Heading -->
        <div class="sidebar-heading">
          Admin Area
        </div>

        <!-- Nav Item - Tindakan Collapse Menu -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTindakan" aria-expanded="true" aria-controls="collapseTindakan">
            <i class="fas fa-cogs"></i>
            <span>Pengaturan</span>
          </a>
          <div id="collapseTindakan" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="<?= base_url('Tindakan') ?>">Tindakan</a>
              <a class="collapse-item" href="<?= base_url('Dokter') ?>">Dokter</a>
              <a class="collapse-item" href="<?= base_url('User') ?>">User</a>
              <a class="collapse-item" href="<?= base_url('Backup') ?>">Backup Database</a>
            </div>
          </div>
        </li>
      <?php endif; ?>
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <div><img src="<?= base_url('assets/img/logo-by.png') ?>" alt="" width="35px">
            <span class="font-weight-bold text-uppercase ml-2">Klinik Bhakti Yuana</span>
          </div>


          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">


            <li>
            </li>
            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><?= cetak($this->session->userdata('nama_akun')) ?></span>
                <i class="fas fa-user-circle"></i>
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="<?= base_url('Auth/logout') ?>" onclick="return confirm('Anda yakin mau logout?')">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">