class Perwalian {
  final int no;
  final int npm;
  final String nama_mahasiswa;
  final String alamat;
  final int total_sks;
  final String status_perwalian;

  Perwalian({this.no, this.npm, this.nama_mahasiswa, this.alamat, this.total_sks, this.status_perwalian});

  Map<String, dynamic> toMap() {
    return {
      'NO' : no,
      'NPM' : npm,
      'NAMA_MAHASISWA' : nama_mahasiswa,
      'ALAMAT' : alamat,
      'TOTAL_SKS' : total_sks,
      'STATUS_PERWALIAN' : status_perwalian,
    };
  }

  @override
  String toString() {
    return 'Perwalian{NO: $no, NPM: $npm, NAMA_MAHASISWA: $nama_mahasiswa, ALAMAT: $alamat, TOTAL_SKS: $total_sks, STATUS_PERWALIAN: $status_perwalian}';
  }

}