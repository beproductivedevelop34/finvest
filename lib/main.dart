import 'dart:collection';
import 'dart:ui';

import 'package:finvest/UserProfile.dart';
import 'package:finvest/firebase_options.dart';
import 'package:finvest/interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinVest App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> register(String email, String password) async {
    var database = FirebaseDatabase.instance.ref().child("Users");
    var map = HashMap<String, dynamic>();
    try {
      var ref = FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        map["use_id"] = value.user?.uid;
        map["email"] = value.user?.email;
        map["admin"] = false;
        database.push().set(map);
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Interface(false)));
    } on FirebaseAuthException catch (e) {}
  }

  Future<void> signIn(String email, String password) async {
    var database = FirebaseDatabase.instance.ref().child("Users");
    try {
      var ref = FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        database.onValue.listen((event) {
          var data = event.snapshot.value as dynamic;
          data.forEach((key,value) {
            var json = UserProfile.fromJson(value);
             if (json.email == email) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Interface(json.admin)));
          }
          });
         
        });
      });
    } on FirebaseAuthException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    var te1 = TextEditingController();
    var te2 = TextEditingController();
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 500,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.white)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                      controller: te1,
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                        hintText: "Email",
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      )),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                      controller: te2,
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          signIn(te1.text, te2.text);
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.blue,
                            fixedSize: Size(100, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.white))),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          register(te1.text, te2.text);
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.blue,
                            fixedSize: Size(100, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.white))),
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    ));
  }
}
