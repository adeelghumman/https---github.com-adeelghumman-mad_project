import 'dart:io';

import 'package:flutter/material.dart';
import 'product.dart';
import 'product_api.dart';

class adminAllProductScreen extends StatefulWidget {
  @override
  _adminAllProductScreenState createState() => _adminAllProductScreenState();
}

class _adminAllProductScreenState extends State<adminAllProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.amber,
        title: Text("All Products Details"),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchproducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  Products product = snapshot.data[index];
                  File file = File(product.imageUrl);
                  return allProducts(product, file);
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  allProducts(Products products, File file) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            // alignment: Alignment(.5, .51),
            height: 250,
            width: 250,

            color: Colors.grey[200],
            child: Column(
              children: <Widget>[
                Image.file(
                  file,
                  width: 170,
                  height: 150,
                ),
                Text(
                  products.name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(products.description, style: TextStyle(fontSize: 17)),
                Text(products.price,
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Future<List<productsModelclass>> fetchproducts() async {
  //   String url = "http://10.0.2.2/script/allproducts.php";
  //   final response = await http.get(url);
  //   productsModelclass products = productsModelclass.fromjson(response.body);
  //   productsobjects.add(products);
  // }
}
