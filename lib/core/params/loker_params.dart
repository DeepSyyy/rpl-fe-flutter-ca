class LokerParams {
  String? id;
  final String title;
  final String kategori;
  final String perusahaan;
  final String lokasi;
  final String tipe;
  final String description;
  final List<String> persyaratan;
  final List<KontakParams>? kontak;

  LokerParams({
    this.id,
    required this.title,
    required this.kategori,
    required this.perusahaan,
    required this.lokasi,
    required this.tipe,
    required this.description,
    required this.persyaratan,
    this.kontak,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'kategori': kategori,
      'perusahaan': perusahaan,
      'lokasi': lokasi,
      'tipe': tipe,
      'description': description,
      'persyaratan': persyaratan,
      'kontak': kontak?.map((e) => e.toJson()).toList(),
    };
  }
}

class KontakParams {
  final String alamat;
  final String nomor;
  final String email;

  KontakParams({
    required this.alamat,
    required this.nomor,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'alamat': alamat,
      'nomor': nomor,
      'email': email,
    };
  }
}
