<?php
defined('BASEPATH') or exit('no direct access script allowed');
class Dokter_model extends CI_Model
{
  public function getDokter()
  {
    $this->db->select('m_klinik.nama_klinik, dokter.id, dokter.nama_dokter, dokter.jenis, dokter.klinik_id, dokter.is_active');
    $this->db->join('m_klinik', 'm_klinik.klinik_id = dokter.klinik_id');
    return $this->db->get('dokter')->result_array();
  }

  public function insertDokter()
  {
    $data = [
      'id' => $this->input->post('kodedokter', TRUE),
      'nama_dokter' => $this->input->post('namadokter', TRUE),
      'jenis' => $this->input->post('jenis', TRUE),
      'klinik_id' => $this->input->post('klinik', TRUE),
      'is_active' => '1'
    ];

    $this->db->insert('dokter', $data);
  }

  public function updateDokter()
  {
    $data = [
      'nama_dokter' => $this->input->post('nama_dokter', TRUE),
      'jenis' => $this->input->post('jenis', TRUE),
      'klinik_id' => $this->input->post('klinik_id', TRUE),
      'is_active' => $this->input->post('is_active', TRUE),
    ];

    $this->db->update('dokter', $data, ['id' => $this->input->post('id')]);
  }
}
