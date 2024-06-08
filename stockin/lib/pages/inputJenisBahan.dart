import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class inputJenisBahan extends StatefulWidget {
  const inputJenisBahan({super.key});

  @override
  State<inputJenisBahan> createState() => _inputJenisBahanState();
}

class _inputJenisBahanState extends State<inputJenisBahan> {
  TextEditingController namaController = TextEditingController();
  String namaJenis = '';

  Future<void> insertJenisBarang() async {
    try {
      namaJenis = namaController.text;
      Map<String,dynamic> data = {
        'id' : 0,
        'nama' : namaJenis
      };

      final url = Uri.parse('http://berkatnusantara.com:5868/barang');
      var response = await http.post(
        url,
        body: jsonEncode(data)
      );

      if (response.statusCode == 200) {
        print('Data successfully sent to backend');
        print("Post success");
      } else {
        print('Failed to send data with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff2B314A),
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Input Jenis Bahan",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'LilitaOne'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: TextField(
                            controller: namaController,
                            decoration: InputDecoration(
                                hintText: 'cth Semen, Batu',
                                filled: true,
                                fillColor: Color(0xff8DECB4),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 12.0),
                                labelText: 'Masukkan Jenis Barang',
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    insertJenisBarang();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff2B314A),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                  ),
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
