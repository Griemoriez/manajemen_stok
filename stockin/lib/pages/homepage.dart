import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:stockin/component/card.dart';
import 'package:stockin/pages/absenpage.dart';
import 'package:stockin/pages/inputbahanpage.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
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
                                "List Proyek",
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
                                v_card(
                                    title: "Proyek A",
                                    description: "babi",
                                    path: "lib/assets/rumah1.jpg"),
                                v_card(
                                    title: "Proyek A",
                                    description: "babi",
                                    path: "lib/assets/rumah1.jpg"),
                                v_card(
                                    title: "Proyek A",
                                    description: "babi",
                                    path: "lib/assets/rumah1.jpg")
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
