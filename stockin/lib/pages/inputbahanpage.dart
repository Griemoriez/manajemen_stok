import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class inputBarangPage extends StatefulWidget {
  inputBarangPage({super.key});

  @override
  State<inputBarangPage> createState() => _inputBarangPageState();
}

class _inputBarangPageState extends State<inputBarangPage> {
  List<String> _dropdownItemAsal = ['Gudang', 'Toko'];
  String _selectedTujuan = 'Proyek A';
  String _selectedBahan = 'Kayu';
  List<String> _dropdownItemAsalFiltered = ['Gudang', 'Toko'];
  String _selectedAsal = 'Gudang';
  List<String> _dropdownItemTujuan = ['Gudang'];
  List<String> _dropdownItemBahan = [];

  Future<void> getAllData() async {
    await getProyek();
    await getBarang();
  }

  Future<void> getProyek() async {
    String getProyek = "http://berkatnusantara.com:5868/proyek";

    try {
      var req1 = await http.get(Uri.parse(getProyek));
      if (req1.statusCode == 200) {
        final data1 = jsonDecode(req1.body);
        List listGet1 = data1['data'];

        setState(() {
          _dropdownItemTujuan.clear();
          for (var index in listGet1) {
            _dropdownItemTujuan.add(index['nama'].toString());
          }
          if (!_dropdownItemTujuan.contains(_selectedTujuan)) {
            _selectedTujuan =
                _dropdownItemTujuan.isNotEmpty ? _dropdownItemTujuan[0] : '';
          }
        });
      }
    } catch (e) {
      print("Exception caught : $e");
    }
  }

  Future<void> getBarang() async {
    String getBarang = "http://berkatnusantara.com:5868/barang";

    try {
      var req2 = await http.get(Uri.parse(getBarang));
      if (req2.statusCode == 200) {
        final data2 = jsonDecode(req2.body);
        List listGet2 = data2['data'];

        setState(() {
          _dropdownItemBahan.clear();
          for (var index in listGet2) {
            _dropdownItemBahan.add(index['nama'].toString());
          }
          if (!_dropdownItemBahan.contains(_selectedBahan)) {
            _selectedBahan =
                _dropdownItemBahan.isNotEmpty ? _dropdownItemBahan[0] : '';
          }
        });
      }
    } catch (e) {
      print("Exception caught : $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllData();
  }

  void _updateAsalDropdown() {
    if (_selectedTujuan == 'Gudang') {
      _dropdownItemAsalFiltered = ['Toko'];
      _selectedAsal = 'Toko';
    } else {
      _dropdownItemAsalFiltered = ['Gudang', 'Toko'];
      _selectedAsal = 'Gudang';
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
              const Padding(
                padding: EdgeInsets.only(left: 15, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Input Stok Bahan Bangunan",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0))),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Masukkan data bahan",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            child: DropdownButtonFormField(
                              value: _selectedTujuan,
                              items: _dropdownItemTujuan.map((String item) {
                                return DropdownMenuItem(
                                    value: item, child: Text(item));
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedTujuan = value!;
                                  _updateAsalDropdown();
                                });
                              },
                              icon: Icon(Icons.arrow_drop_down_rounded),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xff8DECB4),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  labelText: 'Pilih Tujuan',
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            child: DropdownButtonFormField(
                              value: _selectedAsal,
                              items:
                                  _dropdownItemAsalFiltered.map((String item) {
                                return DropdownMenuItem(
                                    value: item, child: Text(item));
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedAsal = value!;
                                });
                              },
                              icon: Icon(Icons.arrow_drop_down_rounded),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xff8DECB4),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  labelText: 'Pilih Asal',
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            child: DropdownButtonFormField(
                              value: _selectedBahan,
                              items: _dropdownItemBahan.map((String item) {
                                return DropdownMenuItem(
                                    value: item, child: Text(item));
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedBahan = value!;
                                });
                              },
                              icon: Icon(Icons.arrow_drop_down_rounded),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xff8DECB4),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  labelText: 'Pilih Bahan',
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'cth 1, 2, 3',
                                  filled: true,
                                  fillColor: Color(0xff8DECB4),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 12.0),
                                  labelText: 'Masukkan Jumlah',
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
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff2B314A),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
