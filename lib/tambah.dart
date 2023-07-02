// ignore_for_file: unused_field, prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Tambah extends StatefulWidget {
  
  const Tambah({Key? key}) : super(key: key);

  @override
  State<Tambah> createState() => _TambahState();
}

class _TambahState extends State<Tambah> {
  final _formKey = GlobalKey<FormState>();

  //inisialize field
  var instansi = TextEditingController();
  var perihal = TextEditingController();
  var tglsrt = TextEditingController();
  var tglsrtdtrm = TextEditingController();
  var noagenda = TextEditingController();
  var klasifikasi = TextEditingController();
  var status = TextEditingController();
  var sifat = TextEditingController();
  var fotosurat = TextEditingController();
  var lampiran = TextEditingController();
  var nosurat = TextEditingController();

  Future _onSubmit() async {
    try {
      return await http.post(
        Uri.parse("http://192.168.1.14/sou/tambah.php"),
        body: {
          "instansi": instansi.text,
          "perihal": perihal.text,
          "tglsrt": tglsrt.text,
          "tglsrtdtrm": tglsrtdtrm.text,
          "noagenda": noagenda.text,
          "klasifikasi": klasifikasi.text,
          "status": status.text,
          "sifat": sifat.text,
          "fotosurat": fotosurat.text,
          "lampiran" : lampiran.text,
          "nosurat" : nosurat.text,
        },
      ).then((value) {
        //print message after insert to database
        //you can improve this message with alert dialog
        var data = jsonDecode(value.body);
        print(data["message"]);

        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1A4244),
        title: Text('Surat Masuk'),
      ),
      body: ListView(
        key: _formKey,
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No Surat',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: nosurat,
                  decoration: InputDecoration(
                      hintText: "Tambah No Surat",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kolom Harus Diisi!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Text(
                  'Instansi Pengirim',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: instansi,
                  decoration: InputDecoration(
                      hintText: "Tambah Instansi Pengirim",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kolom Harus Diisi!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Text(
                  'Perihal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: perihal,
                  decoration: InputDecoration(
                      hintText: "Tambah Perihal",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kolom Harus Diisi!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Text(
                  'Tanggal Surat',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: tglsrt,
                  decoration: InputDecoration(
                      hintText: "Tambah Tanggal Surat",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kolom Harus Diisi!';
                    }
                    return null;
                  },
                ),
                Text(
                  'Tanggal Surat Diterima',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: tglsrtdtrm,
                  decoration: InputDecoration(
                      hintText: "Tambah Tanggal Surat Diterima",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kolom Harus Diisi!';
                    }
                    return null;
                  },
                ),
                Text(
                  'No Agenda',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: noagenda,
                  decoration: InputDecoration(
                      hintText: "Tambah No Agenda",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kolom Harus Diisi!';
                    }
                    return null;
                  },
                ),
                Text(
                  'Sifat',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: sifat,
                  decoration: InputDecoration(
                      hintText: "Tambah Sifat",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kolom Harus Diisi!';
                    }
                    return null;
                  },
                ),
                Text(
                  'Klasdifikasi',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: status,
                  decoration: InputDecoration(
                      hintText: "Tambah Status",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kolom Harus Diisi!';
                    }
                    return null;
                  },
                ),
                Text(
                  'Lampiran',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: lampiran,
                  decoration: InputDecoration(
                      hintText: "Tambah Lampiran",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kolom Harus Diisi!';
                    }
                    return null;
                  },
                ),
                Text(
                  'Foto Surat',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: fotosurat,
                  decoration: InputDecoration(
                      hintText: "Tambah Foto Surat",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kolom Harus Diisi!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0E3F43),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    //validate
                    if (_formKey.currentState!.validate()) {
                      //send data to database with this method
                      _onSubmit();
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
