import 'package:flutter/material.dart';
import 'details.dart';

class ItemCard extends StatelessWidget {
  final String id, nama, umur;

  const ItemCard({Key key, this.id, this.nama, this.umur}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(
          id: id,
          nama: nama,
          umur: umur,
        )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          width: double.infinity,
          color: Colors.yellow,
          child: Column(
            children: [Text(nama), Text(umur),
            ],
          ),
        ),
      ),
    );
  }
}