import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'tombol.dart';
import 'update.dart';

class Details extends StatefulWidget {
  final String id, nama, umur;

  const Details({Key key, this.id, this.nama, this.umur}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  hapusData() async {
    FirebaseFirestore.instance.collection("users").doc(widget.id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 1), content: Text("Data Terhapus")));
    print("Data Terhapus");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Column(
        children: [
          Text(
            "${widget.nama}",
            style: TextStyle(fontSize: 25),
          ),
          Text("${widget.umur}"),
        ],
      ),
      bottomSheet: BottomAppBar(
          child: Tombol(
            hapus: () => hapusData(),
            edit: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Update(
              id: widget.id,
              nama: widget.nama,
              umur: widget.umur,
            ))),
          )),
    );
  }
}