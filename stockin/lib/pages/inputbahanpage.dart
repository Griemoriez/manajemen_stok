import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class inputBarangPage extends StatefulWidget {
  inputBarangPage({super.key});

  @override
  State<inputBarangPage> createState() => _inputBarangPageState();
}

class _inputBarangPageState extends State<inputBarangPage> {
  List<String> _dropdownItemAsal = ['Gudang', 'Toko'];

  String _selectedAsal = 'Gudang';
  List<String> _dropdownItemTujuan = ['Proyek A', 'Proyek B', 'Proyek C'];

  String _selectedTujuan = 'Proyek A';

  List<String> _dropdownItemBahan = ['Semen', 'Kayu', 'Bata', 'Pasir', 'Beton'];

  String _selectedBahan = 'Kayu';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff2B314A),
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
                icon: Icon(Icons.arrow_back_outlined),
                color: Colors.white,
                onPressed: () {},
              ),
            )
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          items: const [
            Icon(
              Icons.home_rounded,
              color: Colors.white,
            ),
            Icon(
              Icons.add_box,
              color: Colors.white,
            ),
            Icon(
              Icons.monetization_on_rounded,
              color: Colors.white,
            ),
          ],
          color: Color(0xff41B06E),
          backgroundColor: Colors.white,
        ),
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
                              value: _selectedAsal,
                              items: _dropdownItemAsal.map((String item) {
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
                              value: _selectedTujuan,
                              items: _dropdownItemTujuan.map((String item) {
                                return DropdownMenuItem(
                                    value: item, child: Text(item));
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedTujuan = value!;
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
