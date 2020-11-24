<?php
defined('BASEPATH') or exit('No direct access script allowed');
class Tindakan_model extends CI_Model
{
  public function searchTindakan($keyword)
  {
    $this->db->like('nama_tindakan', $keyword);
    return $this->db->get('b_tindakan')->result_array();
  }

  public function addTindakan()
  {
    $data = [
      'nama_tindakan' => $this->input->post('tindakan', TRUE),
      'tarif' => $this->input->post('tarif', TRUE),
      'is_active' => '1',
    ];

    $this->db->insert('b_tindakan', $data);
  }

  public function updateTindakan()
  {
    $data = [
      'nama_tindakan' => $this->input->post('namaTindakan', TRUE),
      'tarif' => $this->input->post('tarif', TRUE),
      'is_active' => $this->input->post('aktif'),
    ];

    $this->db->update('b_tindakan', $data, ['id' => $this->input->post('id')]);
  }

  public function getTagByTindakan($tindakan_id)
  {
    return $this->db->query(
      "SELECT m_klinik.klinik_id,
      m_klinik.nama_klinik
      FROM tindakan_has_klinik
      JOIN m_klinik ON m_klinik.klinik_id = tindakan_has_klinik.klinik_id
      WHERE tindakan_id = '" . $tindakan_id . "'"
    )->result_array();
  }

  public function getKlinik($tindakan_id)
  {
    $tags = $this->db->get_where('tindakan_has_klinik', ['tindakan_id' => $tindakan_id])->result_array();
    $tag = '';
    $i = 0;
    foreach ($tags as $row) {
      if ($i  == 0) {
        $tag .= $row['klinik_id'];
      } else {
        $tag .= ', ' . $row['klinik_id'];
      }
      $i++;
    }
    return $this->db->query("SELECT * FROM m_klinik WHERE klinik_id NOT IN (.$tag)")->result_array();
  }
}
