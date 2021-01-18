import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mad_project/login.dart';
import 'package:http/http.dart' as http;

class registerscreen extends StatefulWidget {
  @override
  _registerscreenState createState() => _registerscreenState();
}

class _registerscreenState extends State<registerscreen> {
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("images/Texture.png"), fit: BoxFit.fill)),
      child: Scaffold(
        key: _scaffoldkey,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Let's Register ",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 30,
              ),
              Text(
                "Do you have an Account?",
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => loginscreen(),
                      ));
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: name,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                      hintText: "First Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: phone,
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1))),
                ),
              ),
              GestureDetector(
                onTap: () {
                  registeruser;
                },
                child: Container(
                  height: 30,
                  width: 150,
                  color: Colors.indigo[600],
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Register",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List> get registeruser async {
    String url = "http://10.0.2.2/script/conn.php";
    final response = await http.post(url, body: {
      "name": name.text,
      "password": password.text,
      "email": email.text,
      "phone": phone.text
    });

    //var resbody = json.decode(response.body);
    //print(resbody);
    _scaffoldkey.currentState
        .showSnackBar(SnackBar(content: Text("User Register")));
  }
}
