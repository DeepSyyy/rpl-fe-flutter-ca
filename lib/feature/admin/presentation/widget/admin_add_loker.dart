import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/params/loker_params.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/provider/admin_loker_provider.dart';
import 'package:provider/provider.dart';

List<String> kategori = [
  "UI/UX Designer",
  "Frontend Developer",
  "Backend Developer",
  "Mobile Developer",
  "Data Scientist",
  "Data Analyst",
  "Product Manager",
  "Project Manager",
  "Business Analyst",
  "Digital Marketing",
  "Content Creator",
];

List<String> tipe = [
  "Full Time",
  "Part Time",
  "Internship",
];

class AddLokerWidget extends StatefulWidget {
  const AddLokerWidget({super.key});

  @override
  State<AddLokerWidget> createState() => _AddLokerWidgetState();
}

class _AddLokerWidgetState extends State<AddLokerWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _perusahaanController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _lokasiController = TextEditingController();
  List<KontakParams> kontak = [];
  List<String> persyaratan = [];
  String kategoriValue = kategori[0];
  String tipeValue = tipe[0];

  void _showDialogKontak() {
    TextEditingController _alamatKontakController = TextEditingController();
    TextEditingController _emailKontakController = TextEditingController();
    TextEditingController _nomorKontakController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Kontak'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _alamatKontakController,
                decoration: const InputDecoration(hintText: "Alamat"),
              ),
              TextField(
                controller: _emailKontakController,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              TextField(
                controller: _nomorKontakController,
                decoration: const InputDecoration(hintText: "Nomor"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                KontakParams params = KontakParams(
                  alamat: _alamatKontakController.text,
                  email: _emailKontakController.text,
                  nomor: _nomorKontakController.text,
                );
                kontak.add(params);

                setState(() {
                  _alamatKontakController.clear();
                  _emailKontakController.clear();
                  _nomorKontakController.clear();
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add Kontak'),
            ),
          ],
        );
      },
    );
  }

  void _showDialogPersyaratan() {
    TextEditingController _persyaratanController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Persyaratan'),
          content: TextField(
            controller: _persyaratanController,
            decoration: const InputDecoration(hintText: "Persyaratan"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                persyaratan.add(_persyaratanController.text);

                setState(() {});
                Navigator.of(context).pop();
              },
              child: const Text('Add Persyaratan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Loker'),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            _showDialogKontak();
          },
          child: const SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.add),
                Text('Add Kontak'),
              ],
            ),
          )),
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: "Title"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _perusahaanController,
                decoration: const InputDecoration(hintText: "Perusahaan"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _deskripsiController,
                decoration: const InputDecoration(hintText: "Deskripsi"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _lokasiController,
                decoration: const InputDecoration(hintText: "Lokasi"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  _showDialogPersyaratan();
                },
                child: const SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text('Add Persyaratan'),
                    ],
                  ),
                ),
              ),
            ),
            const Text('Pilih Kategori'),
            const SizedBox(height: 10),
            Container(
              child: DropdownButton<String>(
                value: kategoriValue,
                onChanged: (String? newValue) {
                  setState(() {
                    kategoriValue = newValue!;
                  });
                },
                items: kategori.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(growable: false),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Pilih Tipe'),
            const SizedBox(height: 10),
            Container(
              child: DropdownButton<String>(
                value: tipeValue,
                onChanged: (String? newValue) {
                  setState(() {
                    tipeValue = newValue!;
                  });
                },
                items: tipe.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(growable: false),
              ),
            ),
            Consumer<AdminLokerProvider>(builder: (context, state, _) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    try {
                      state.addLoker(
                        title: _titleController.text,
                        kategori: kategoriValue,
                        perusahaan: _perusahaanController.text,
                        lokasi: _lokasiController.text,
                        tipe: tipeValue,
                        description: _deskripsiController.text,
                        persyaratan: persyaratan,
                        kontak: kontak,
                      );
                      _titleController.clear();
                      _perusahaanController.clear();
                      _lokasiController.clear();
                      _deskripsiController.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Berhasil menambahkan loker'),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Gagal menambahkan loker'),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
