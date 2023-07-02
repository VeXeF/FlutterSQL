// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'dart:io';
import 'package:DisApp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';


class SuratMasuk3 extends StatefulWidget {
  const SuratMasuk3({super.key});

  @override
  State<SuratMasuk3> createState() => _SuratMasuk3State();
}

class _SuratMasuk3State extends State<SuratMasuk3> {

  File? _image;
  ImagePicker picker = ImagePicker();
  TextEditingController controllerTitle = TextEditingController();
  Future openCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future openGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future upload(File imageFile) async {
    var Stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var url = Uri.parse("https://disp-surat.000webhostapp.com/upload.php");

    var request = http.MultipartRequest("POST", url);

    var MultipartFile = http.MultipartFile("image", Stream, length,
        filename: basename(imageFile.path));

    request.fields['title'] = controllerTitle.text;
    request.files.add(MultipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      print("Image Berhasil Terupload");
    } else {
      print("Upload Image Gagal");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Surat Masuk',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget> [
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Instansi Pengirim',
                    labelText: 'Instansi Pengirim',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Perihal',
                    labelText: 'Perihal',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Tanggal Surat (Contoh : 1 Januari 2023)',
                    labelText: 'Tanggal Surat',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Tanggal Surat Diterima (Contoh : 1 Januari 2023)',
                    labelText: 'Tanggal Surat Diterima',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Klasifikasi',
                    labelText: 'Klasifikasi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Status',
                    labelText: 'Status',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Lampiran',
                    labelText: 'Lampiran',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Sifat',
                    labelText: 'Sifat',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                Center(
                  child: _image == null
                    ? const Text("No Image Selected")
                    :Image.file(
                      _image!,
                    ),
                ),
                TextButton(
                  onPressed: () {
                    upload(_image!);
                  },  
                  child: 
                    Text(
                      'Foto Surat',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: 
                      ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0)
                ),
                TextButton(
                  onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(userAccesstoken: null,))),
                  child: 
                    Text(
                      'Kirim',
                      style: TextStyle(fontSize: 20),
                    ),
                  style:
                    ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ), 
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}