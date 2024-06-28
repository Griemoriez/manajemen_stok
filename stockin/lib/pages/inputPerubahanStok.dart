import 'package:flutter/material.dart';
class inputPerubahan extends StatefulWidget {
  const inputPerubahan({super.key});

  @override
  State<inputPerubahan> createState() => _inputPerubahanState();
}

class _inputPerubahanState extends State<inputPerubahan> {
  List<String> _dropdownItemAsal = ['Gudang', 'Toko'];
  String _selectedTujuan = 'Proyek A';
  Map<String, dynamic> _selectedBahan = {};
  List<String> _dropdownItemAsalFiltered = ['Gudang', 'Toko'];
  String _selectedAsal = 'Gudang';
  List<String> _dropdownItemTujuan = ['Gudang'];
  List<Map<String, dynamic>> _dropdownItemBahan = [];
  TextEditingController jumlahBahanController = TextEditingController();
  late Future<void> _futureData;
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
                          "Input Perubahan Stok Bahan Bangunan",
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
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        
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