import 'package:flutter/material.dart';
import 'package:mad_project/login.dart';
import 'package:mad_project/register.dart';

class registration extends StatefulWidget {
  @override
  _registrationState createState() => _registrationState();
}

class _registrationState extends State<registration> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("images/Texture.png"), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "The Right Address For Shopping ",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 30,
              ),
              Text(
                "It is now very easy to reach the best quality among all the products on the internet!",
                style: TextStyle(fontSize: 15),
              ),
              Container(
                height: 60,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => registerscreen()));
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
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginscreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: 30,
                    width: 150,
                    color: Colors.grey[350],
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Log in",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
