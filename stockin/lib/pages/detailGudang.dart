import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:stockin/component/cardDivisi.dart';
import 'package:stockin/pages/homepage.dart';

class detailGudang extends StatefulWidget {
  const detailGudang({super.key});

  @override
  State<detailGudang> createState() => _detailProyekState();
}

class _detailProyekState extends State<detailGudang> {
  List<Map<String, dynamic>> listStokProyek = [];
  List<DataRow> allRowTable = [];
  Future<void> getStokProyek() async {
    String urlGetStokProyek = "http://berkatnusantara.com:5868/stokGudang";
    try {
      var req = await http.get(Uri.parse(urlGetStokProyek));
      if (req.statusCode == 200) {
        final data = jsonDecode(req.body);
        List listGetStok = data['data'];
        setState(() {
          for (var index in listGetStok) {
            listStokProyek.add({
              'id': index['id'],
              'nama': index['barang'],
              'stok': int.parse(index['masuk']) - int.parse(index['keluar']) < 0
                  ? 0
                  : int.parse(index['masuk']) - int.parse(index['keluar']),
            });
            print(int.parse(index['masuk']) - int.parse(index['keluar']));
          }
          int tempIndex = 1;
          for (var i in listStokProyek) {
            allRowTable.add(DataRow(
                color: MaterialStateColor.resolveWith(
                    (states) => Color(0xff8DECB4)),
                cells: [
                  DataCell(Text(tempIndex.toString())),
                  DataCell(Text(i['nama'])),
                  DataCell(Text(i['stok'].toString())),
                ]));
            tempIndex++;
          }
        });
      }
    } catch (e) {
      print("Exception caught: $e ");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStokProyek();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              "Manajemen Stok",
              style: TextStyle(
                  color: Color(0xff41B06E), fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 10.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  {
                    Navigator.pop(context);
                  }
                },
              ),
            )
          ],
        ),
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
                    "Detail Proyek",
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
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gudang Induk",
                          style: TextStyle(
                              color: Color(0xff41B06E),
                              fontSize: 42,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "Alamat : Jl Terusan Borobudur no. 150",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          "Detail Stok Bahan Bangunan",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          child: DataTable(
                            columns: [
                              DataColumn(
                                  label: Text(
                                "No.",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataColumn(
                                  label: Text("Nama Bahan",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text("Stok",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)))
                            ],
                            rows: allRowTable,
                          ),
                        ))
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
