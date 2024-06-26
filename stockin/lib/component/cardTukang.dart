import 'package:flutter/material.dart';

class div_cardTukang extends StatelessWidget {
  final String title;
  final String jumlahAbsen;
  final String jumlahGaji;
  final String path;
  const div_cardTukang(
      {Key? key,
      required this.title,
      required this.jumlahAbsen,
      required this.jumlahGaji,
      required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        elevation: 4.0,
        color: Color(0xff8DECB4),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
              child: Image.asset(
                path,
                height: 100,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  Container(
                    width: 250,
                    child: Text(
                      "Jumlah Absen : $jumlahAbsen",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    width: 250,
                    child: Text(
                      "Jumlah Gaji : $jumlahGaji",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
