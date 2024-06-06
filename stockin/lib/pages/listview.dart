import 'package:flutter/material.dart';
import 'package:stockin/component/card.dart';
import 'package:stockin/pages/detailpage.dart';

class listview extends StatelessWidget {
  final double height;
  final String type;
  final List<Map<String, dynamic>> myList;
  const listview(
      {Key? key,
      required this.height,
      required this.type,
      required this.myList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) {
          var key = myList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => detailProyek(
                    id: key['id'],
                    nama: key['nama'].toString(),
                    alamat: key['alamat'].toString(),
                  ),
                ),
              );
            },
            child: v_card(
                path: key['path'].toString(),
                title: key['nama'].toString(),
                description: key['alamat'].toString()),
          );
        },
      ),
    );
  }
}
