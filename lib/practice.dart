import 'package:flutter/material.dart';

class practice extends StatefulWidget {
  @override
  _practiceState createState() => _practiceState();
}

class _practiceState extends State<practice> {
  List<String> products = ['product 1'];
  TextEditingController productname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: productname,
              ),
              RaisedButton(
                onPressed: () {
                  products.add(productname.text);
                },
                child: Text("Add product"),
              ),
              Column(
                children: products
                    .map((element) => Container(
                          child: Column(
                            children: <Widget>[
                              Image.asset("images/w1.jpeg"),
                              Text(element)
                            ],
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  layout(element) {}
}
