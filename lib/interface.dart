import 'package:finvest/%C4%B1nvest.dart';
import 'package:finvest/addInvest.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Interface extends StatefulWidget {
  bool admin;
  Interface(this.admin);

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  var database = FirebaseDatabase.instance.ref().child("Invest");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: StreamBuilder<DatabaseEvent>(
          stream: database.onValue,
          builder: (context, event) {
            var dataList = [];
            if (event.hasData) {
              var value = event.data?.snapshot.value as dynamic;
              value.forEach((key, value) {
                var data = Invest.fromJson(value);
                dataList.add(data);
              });
            }
            return ListView.builder(
                itemCount: dataList.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: Container(
                      width: 200,
                      height: 100,
                      child: Row(children: [
                        Text(
                          dataList[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        (() {
                          if (dataList[index].tahmin == 0) {
                            return Icon(Icons.arrow_drop_up);
                          } else if (dataList[index].tahmin == 2) {
                            return Icon(Icons.arrow_drop_down);
                          } else {
                            return Text("Yükseliş Yok",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold));
                          }
                        }())
                      ]),
                    ),
                  );
                }));
          }),
      floatingActionButton: Visibility(
        visible: widget.admin,
        child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => AddInvest())));
            })),
      ),
    );
  }
}
