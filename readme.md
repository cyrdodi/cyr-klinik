# CYR-SIMKLINIK

## to do
- [x] login page
- [x] user registration page
- [ ] proses klinik
- [ ] inventory system
- [ ] cetak kwitansi

## log
### 2020-11-05
- Membuat user login & registration page
- mengubah nama tabel users menjadi user, kolom role menjadi role_id dengan referensi char
### 2020-11-07
- membuat controler klinik
- menambahkan user_id & is_login ke session->userdata
- membuat form validasi untuk pendaftaran
- membuat klinik model
- membuat function untuk menambahkan data ke klinik_transaction
- menambahkan tanggal berobat
- ada error di insert pendaftraan kemungkinan value medrek tak sesuai refrence di db, coba cek form input medrek

### 2020-11-08
- prevent mr dengan antrean aktif di klinik_transaction untuk dapat diproses pendaftaran
- generate reg dirubah dengan logika mengambil row terakhir dan ditambah 1
- menambahkan kolom is_active di klinik_transaction untuk identifikasi status antrean
test