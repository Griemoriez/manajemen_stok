import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stockin/component/card.dart';
import 'package:stockin/pages/absenpage.dart';
import 'package:stockin/pages/detailGudang.dart';
import 'package:stockin/pages/detaildivisi.dart';
import 'package:stockin/pages/inputbahanpage.dart';
import 'package:stockin/pages/listview.dart';
import 'package:stockin/pages/settingpage.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _HomepageState();
}

class _HomepageState extends State<homepage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  List<Map<String, dynamic>> listProyek = [];

  Future<void> getProyek() async {
    String urlGetProyek = "http://berkatnusantara.com:5868/proyek";
    try {
      var req = await http.get(Uri.parse(urlGetProyek));
      if (req.statusCode == 200) {
        final data = jsonDecode(req.body);
        List listGet = data['data'];
        setState(() {
          for (var index in listGet) {
            listProyek.add({
              'id': index['id'],
              'nama': index['nama'].toString(),
              'alamat': index['alamat'].toString(),
              'path': "lib/assets/rumah1.jpg"
            });
          }
        });
      }
    } catch (e) {
      print("Exception caught: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getProyek();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

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
                icon: Icon(Icons.settings),
                color: Colors.white,
                onPressed: () {
                  {
                    Navigator.pushReplacement( 
                      context,
                      MaterialPageRoute(builder: (context) => const settingPage())
                    );
                  }
                },
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
          onTap: _onItemTapped,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            // Your first page (Home Page)
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hi Nathan!",
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
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Gudang",
                                style: TextStyle(
                                    color: Color(0xff41B06E),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              {
                                Navigator.pushReplacement( 
                                  context,
                                  MaterialPageRoute(builder: (context) => const detailGudang())
                                );
                              }
                            },
                            child: v_card(
                              title: "Gudang Induk",
                              description: "jl. Terusan Borobudur",
                              path: "lib/assets/rumah1.jpg"),
                          ),
                    
                              
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "List Proyek",
                                style: TextStyle(
                                    color: Color(0xff41B06E),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          listview(height: 500, type: "p", myList: listProyek),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Your second page
            inputBarangPage(),
            // Your third page
            detailDivisi(),
          ],
        ),
      ),
    );
  }
}
