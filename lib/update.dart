import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  final String id, nama, umur;

  const Update({Key key, this.id, this.nama, this.umur}) : super(key: key);

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final txtNama = TextEditingController();
  final txtUmur = TextEditingController();

  setup() {
    txtNama.text = widget.nama;
    txtUmur.text = widget.umur;
  }

  void simpanUpdate() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");

    await users
        .doc(widget.id)
        .update({"nama": txtNama.text, "umur": txtUmur.text}).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 1), content: Text("Data Selesai di Edit")));
    });
    print("Data Terupdate");
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Data"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: txtNama,
              decoration: InputDecoration(hintText: "Nama"),
            ),
            TextFormField(
              controller: txtUmur,
              decoration: InputDecoration(hintText: "Umur"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  simpanUpdate();
                },
                child: Text("Simpan Update"))
          ],
        ),
      ),
    );
  }
}