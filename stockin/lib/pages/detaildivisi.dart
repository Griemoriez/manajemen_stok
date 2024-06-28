import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:stockin/component/cardDivisi.dart';
import 'package:stockin/pages/absenpage.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'dart:convert';

class detailDivisi extends StatefulWidget {
  const detailDivisi({super.key});

  
  @override
  State<detailDivisi> createState() => _detailDivisiState();
}

class _detailDivisiState extends State<detailDivisi> {

  List<Map<String, dynamic>> listDivisi = [];
  

Future<void> detailDivisi() async{
    String urlGetProyek = "http://berkatnusantara.com:5868/gaji/perdivisi";
    try {
      var req = await http.get(Uri.parse(urlGetProyek));
      if (req.statusCode == 200) {
        final data = jsonDecode(req.body);
        List listGet = data['data'];
        setState(() {
          for (var index in listGet) {
            listDivisi.add({
              'id_jenis': index['id_jenis'],
              'jenis': index['jenis'].toString(),
              'jumlah_tukang': index['jumlah_tukang'].toString(),
              'total_gaji' : index['total_gaji'].toString(),
            });
          }
        });
      }
    } catch (e) {
      print("Exception caught: $e");
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
                    "Absen & Gaji mingguan / divisi",
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "List Divisi",
                            style: TextStyle(
                                color: Color(0xff41B06E),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GestureDetector(
                      onTap: (){
                        {
                          Navigator.pushReplacement( 
                            context,
                            MaterialPageRoute(builder: (context) => const absenPage())
                          );
                        }
                      },
                      child : div_card(
                          title: "Divisi Tukang Batu",
                          jumlahTukang: "3",
                          jumlahGaji: "Rp 1.350.000",
                          path: "lib/assets/rumah1.jpg"),
                      ),
                    ],
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
