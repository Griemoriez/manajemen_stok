import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:stockin/component/card.dart';
import 'package:stockin/component/cardDivisi.dart';
import 'package:stockin/component/cardTukang.dart';
import 'package:stockin/pages/absenpage.dart';
import 'package:stockin/pages/detaildivisi.dart';
import 'package:stockin/pages/homepage.dart';
import 'package:stockin/pages/inputbahanpage.dart';
import 'package:http/http.dart' as http;


class absenPage extends StatefulWidget {

  const absenPage({super.key});

  @override
  State<absenPage> createState() => _absenPageState();
}

class _absenPageState extends State<absenPage> {


List<Map<String, dynamic>> listTukang = [];
  Future<void> detailAbsen() async{
    String urlGetGajiTukang = "http://berkatnusantara.com:5868/gaji/pertukang/" + parameter;
    try {
      var req = await http.get(Uri.parse(urlGetGajiTukang));
      if (req.statusCode == 200) {
        final data = jsonDecode(req.body);
        List listGet = data['data'];
        setState(() {
          for (var index in listGet) {
            listTukang.add({
              'id': index['id'],
              'jumlah_hadir': index['jumlah_hadir'].toString(),
              'nama': index['nama'].toString(),
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
                onPressed: () {{
                                Navigator.pushReplacement( 
                                  context,
                                  MaterialPageRoute(builder: (context) => const homepage())
                                );
                              }},
              ),
            )
          ],
        ),
        
        body: Padding(
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
                              topRight: Radius.circular(15.0))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "List Tukang",
                                style: TextStyle(
                                    color: Color(0xff41B06E),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 600,
                            width: double.infinity,
                            child: ListView(
                              children: [
                                div_cardTukang(
                                    title: "Moh Supri",
                                    jumlahGaji: "Gaji : Rp 300.000",
                                    jumlahAbsen: "2 hari",
                                    path: "lib/assets/rumah1.jpg"),
                                div_cardTukang(
                                    title: "Usdik",
                                    jumlahGaji: "Gaji : Rp 450.000",
                                    jumlahAbsen: "3 hari",
                                    path: "lib/assets/rumah1.jpg"),
                                div_cardTukang(
                                    title: "Saiful",
                                    jumlahGaji: "Gaji : Rp 600.000",
                                    jumlahAbsen: "4 hari",
                                    path: "lib/assets/rumah1.jpg"),
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