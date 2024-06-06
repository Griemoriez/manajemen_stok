import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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
  Map<String, dynamic> _selectedBahan = {};
  List<String> _dropdownItemAsalFiltered = ['Gudang', 'Toko'];
  String _selectedAsal = 'Gudang';
  List<String> _dropdownItemTujuan = ['Gudang'];
  List<Map<String, dynamic>> _dropdownItemBahan = [];
  String keteranganBahan = "";
  int jumlahBahan = 0;
  String convert = "";
  TextEditingController keteranganController = TextEditingController();
  TextEditingController jumlahBahanController = TextEditingController();
  late Future<void> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = getAllData();
  }

  Future<void> getAllData() async {
    print('Fetching data started');
    await getProyek();
    await getBarang();
  }

  // Future<void> insertBarangGudang() async {
  

  //   keteranganBahan = keteranganController.text;
    // convert = jumlahBahanController.text;
    // jumlahBahan = int.parse(convert);
  //   String nama_barang = _selectedBahan['nama'].toString(); 
  //   print(nama_barang);
  //   print(_selectedBahan['id']);
  //   print(keteranganBahan);
  //   print(jumlahBahan);
    
  //   int id_barang = int.parse(_selectedBahan["id"].toString());
  //   int idBarang1 = id_barang;
  //   print(idBarang1);
  //   String getCurrentDateTime() {
  //     DateTime now = DateTime.now();
  //     DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  //     return formatter.format(now);
  //   }

  //   print(getCurrentDateTime());

  //   final url = Uri.parse('http://berkatnusantara.com:5868/stokGudang');
  //   var response = await http.post(
  //       url,
  //       body: {
  //         'barang' : nama_barang,
  //         'id' : 1,
  //         'id_barang' : idBarang1,
  //         'keluar' : 0,
  //         'keterangan' : keteranganBahan,
  //         'masuk' : jumlahBahan,
  //         'timestamp' : getCurrentDateTime()
  //       }
  //     );

  //   try {
  //     if (response.statusCode == 200) {
  //       print('Face data successfully sent to backend using form data');
  //       print("post succes");
  //     }
  //   } catch (e) {
  //     print('Error sending face data to backend using form data: $e');
  //   }
  // }
  // 
  Future<void> insertBarangGudang() async {
  try {
    keteranganBahan = keteranganController.text;
    convert = jumlahBahanController.text;
    jumlahBahan = int.parse(convert);
    String nama_barang = _selectedBahan['nama']?.toString() ?? ''; 
    int id_barang = int.tryParse(_selectedBahan["id"]?.toString() ?? '') ?? 0;
    int idBarang1 = id_barang;

    String getCurrentDateTime() {
      DateTime now = DateTime.now();
      DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      return formatter.format(now);
    }

    final url = Uri.parse('http://berkatnusantara.com:5868/stokGudang');
    var response = await http.post(
      url,
      body: {
        'barang': nama_barang,
        'id': '1',  // Send as string
        'id_barang': idBarang1.toString(), // Convert integer to string
        'keluar': '0',  // Send as string
        'keterangan': keteranganBahan,
        'masuk': jumlahBahan.toString(),  // Convert integer to string
        'timestamp': getCurrentDateTime()
      },
    );

    if (response.statusCode == 200) {
      print('Data successfully sent to backend');
      print("Post success");
    } else if (response.statusCode == 500) {
    // Handle server error
    print('Internal Server Error: ${response.body}');
    }else {
      print('Failed to send data with status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}

  // Future<void> insertBarangProyek() async {
  //   final url = Uri.parse('http://berkatnusantara.com:5868/tukang');

  //   var response =
  //       await http.post(url, body: {'id': 0, 'id_jenis:': 1, 'nama': name});
  // }

  Future<void> getProyek() async {
    String getProyek = "http://berkatnusantara.com:5868/proyek";

    try {
      var req1 = await http.get(Uri.parse(getProyek));
      if (req1.statusCode == 200) {
        final data1 = jsonDecode(req1.body);
        List listGet1 = data1['data'];

        if (mounted) {
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
      } else {
        print('Failed to load proyek data');
      }
    } catch (e) {
      print("Exception caught while fetching proyek: $e");
    }
  }

  Future<void> getBarang() async {
    String getBarang = "http://berkatnusantara.com:5868/barang";

    try {
      var req2 = await http.get(Uri.parse(getBarang));
      if (req2.statusCode == 200) {
        final data2 = jsonDecode(req2.body);
        List listGet2 = data2['data'];

        if (mounted) {
          setState(() {
            _dropdownItemBahan.clear();
            for (var index in listGet2) {
              _dropdownItemBahan
                  .add({'id': index['id'], 'nama': index['nama'].toString()});
            }
            bool containsSelectedBahan = _dropdownItemBahan.any((item) =>
                item['id'] == _selectedBahan['id'] &&
                item['nama'] == _selectedBahan['nama']);

            if (!containsSelectedBahan) {
              _selectedBahan = (_dropdownItemBahan.isNotEmpty
                  ? _dropdownItemBahan[0]
                  : null)!;
            }
          });
        }
      } else {
        print('Failed to load barang data');
      }
    } catch (e) {
      print("Exception caught while fetching barang: $e");
    }
  }

  @override
  void dispose() {
    // Pastikan untuk membatalkan semua kontroler atau stream jika ada.
    keteranganController.dispose();
    jumlahBahanController.dispose();
    super.dispose();
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

  void _printSelectedBahan() {
    print("Selected Bahan: $_selectedBahan");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff2B314A),
        body: FutureBuilder<void>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Padding(
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
                            topRight: Radius.circular(15.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15, top: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Masukkan data bahan",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
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
                            child:
                                DropdownButtonFormField<Map<String, dynamic>>(
                              value: _selectedBahan.isNotEmpty
                                  ? _selectedBahan
                                  : null,
                              items: _dropdownItemBahan.map((item) {
                                return DropdownMenuItem<Map<String, dynamic>>(
                                  value: item,
                                  child: Text(item['nama']),
                                );
                              }).toList(),
                              onChanged: (value) {
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
                              controller: jumlahBahanController,
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
                            child: TextField(
                              controller: keteranganController,
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
                                  labelText: 'Masukkan Keterangan',
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
                                    onPressed: (){
                                      insertBarangGudang();
                                    
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff2B314A),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                items: _dropdownItemAsalFiltered
                                    .map((String item) {
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                              child:
                                  DropdownButtonFormField<Map<String, dynamic>>(
                                value: _selectedBahan.isNotEmpty
                                    ? _selectedBahan
                                    : null,
                                items: _dropdownItemBahan.map((item) {
                                  return DropdownMenuItem<Map<String, dynamic>>(
                                    value: item,
                                    child: Text(item['nama']),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedBahan = value!;
                                  });
                                },
                                icon: Icon(Icons.arrow_drop_down_rounded),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xff8DECB4),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                controller: jumlahBahanController,
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
                              child: TextField(
                                controller: keteranganController,
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
                                    labelText: 'Masukkan Keterangan',
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
                                        _printSelectedBahan();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff2B314A),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16.0),
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
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
