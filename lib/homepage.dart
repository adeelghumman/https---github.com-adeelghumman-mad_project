import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'cart_screen.dart';
import 'product.dart';
import 'product_api.dart';
import 'cart.dart';
import 'customappbar.dart';

class homepage extends StatefulWidget {
  String name, email;
  homepage({this.name, this.email});

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Cart cart_product = Cart();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: layout(),
      ),
    );
  }

  layout() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            customappbar(cart_product),
            SizedBox(
              height: 250,
              child: FutureBuilder(
                future: fetchproducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        Products product = snapshot.data[index];
                        File file = File(product.imageUrl);
                        return sliderproducts(product, file);
                      },
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("BEST PICKS",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return bestpicks();
                  },
                  itemCount: 4),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("DOUBLE DEALS",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return bestpicks();
                  },
                  itemCount: 4),
            )
          ],
        ),
      ),
    );
  }

  sliderproducts(Products products, File file) {
    return GestureDetector(
      onTap: () {
        // print(products.name);

        setState(() {
          cart_product.addProductInCart(products.name, products.price);
          print(cart_product.products);
        });
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 10),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: <Widget>[
                    Image.file(
                      file,
                      width: 150,
                      height: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        products.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            ("Pkr. "),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            products.price,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bestpicks() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "images/w1.jpeg",
                width: 350,
                height: 170,
              ),
              Text(
                "Resturent Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum"),
              Row(
                children: [
                  Text(
                    "Rs. 99.00 minimum",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Rs 20.00 delivery fee",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
