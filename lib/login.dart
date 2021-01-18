import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mad_project/adminpanel.dart';
import 'package:mad_project/checkuserModel.dart';
import 'package:mad_project/homepage.dart';

class loginscreen extends StatefulWidget {
  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  GlobalKey<ScaffoldState> _scaffolkey = GlobalKey<ScaffoldState>();
  bool adminflag = false;
  String asuserORadmin = "As admin?";
  int checker = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("images/Texture.png"), fit: BoxFit.fill)),
      child: Scaffold(
        key: _scaffolkey,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Let's Login ",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (checker % 2 == 1) {
                    setState(() {
                      asuserORadmin = "As user?";
                      adminflag = true;
                    });
                    _scaffolkey.currentState.showSnackBar(
                        SnackBar(content: Text("In admin login Panel")));
                  } else {
                    setState(() {
                      asuserORadmin = "As admin?";
                      adminflag = false;
                    });
                    _scaffolkey.currentState.showSnackBar(
                        SnackBar(content: Text("In User login Panel")));
                  }

                  checker++;
                },
                child: Text(
                  asuserORadmin,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 30,
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
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1))),
                ),
              ),
              Container(
                height: 60,
              ),
              GestureDetector(
                onTap: () {
                  if (adminflag == false) {
                    checkuser();
                  } else {
                    checkAdminCredentials();
                  }
                },
                child: Container(
                  height: 30,
                  width: 150,
                  color: Colors.indigo[600],
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Login",
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

  void checkuser() async {
    String url = "http://10.0.2.2/script/checkuser.php";
    final response = await http
        .post(url, body: {'email': email.text, 'password': password.text});
    print(response.body);

    checkuserModel user =
        new checkuserModel.fromJson(jsonDecode(response.body));
    if (user.message == true) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => homepage(name: user.name, email: user.email),
          ));
      _scaffolkey.currentState
          .showSnackBar(SnackBar(content: Text("login Failed")));
    } else {
      _scaffolkey.currentState
          .showSnackBar(SnackBar(content: Text("login Failed")));
    }
  }

  void checkAdminCredentials() {
    if (email.text == "admin" && password.text == "admin") {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => adminMainScreen(),
          ));
    }
  }
}
