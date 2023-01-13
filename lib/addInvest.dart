import 'dart:collection';

import 'package:finvest/interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddInvest extends StatefulWidget {
  const AddInvest({Key? key}) : super(key: key);

  @override
  State<AddInvest> createState() => _AddInvestState();
}

class _AddInvestState extends State<AddInvest> {
  var database = FirebaseDatabase.instance.ref().child("Invest");
  Future<void> addIns(String investName, int tahmin) async {
    var map = HashMap<String, dynamic>();
    map["name"] = investName;
    map["tahmin"] = tahmin;
    database.push().set(map);
  }

  TextEditingController name = TextEditingController();
  int val = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          TextField(
            controller: name,
            decoration: InputDecoration(hintText: "Cryptocurrency Name"),
          ),
          Text(
            "Tahmin",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          RadioListTile<int>(
            title: Text("Yukselme"),
            value: 0,
            groupValue: val,
            onChanged: ((int? value) {
              setState(() {
                val = value!;
              });
            }),
          ),
          RadioListTile<int>(
            title: Text("Değişim Yok"),
            value: 1,
            groupValue: val,
            onChanged: ((int? value) {
              setState(() {
                val = value!;
              });
            }),
          ),
          RadioListTile<int>(
            title: Text("Alçalma"),
            value: 2,
            groupValue: val,
            onChanged: ((int? value) {
              setState(() {
                val = value!;
              });
            }),
          ),
          ElevatedButton(
            onPressed: (() {
              addIns(name.text, val);
            }),
            child: Text(
              "Ekle",
              style: TextStyle(fontSize: 25),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.blue, fixedSize: Size(100, 50)),
          )
        ]),
      ),
    );
  }
}
