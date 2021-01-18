import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class adminAddProduct extends StatefulWidget {
  @override
  _adminAddProductState createState() => _adminAddProductState();
}

class _adminAddProductState extends State<adminAddProduct> {
  TextEditingController pname = TextEditingController();
  TextEditingController pdescription = TextEditingController();
  TextEditingController pprice = TextEditingController();

  File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: addproducts(),
    );
  }

  addproducts() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add Product",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pname,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                    hintText: "Product Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pprice,
                decoration: InputDecoration(
                    hintText: "Price",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pdescription,
                decoration: InputDecoration(
                    hintText: "Description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1))),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    pickimage();
                  },
                  child: Text("Choose Photo"),
                )),
            Container(
              child: file == null ? Text("Product Image") : Image.file(file),
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                addProducttoDB();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  height: 30,
                  width: 150,
                  color: Colors.indigo[600],
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Add Product",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pickimage() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    file = File(pickedFile.path);
    // print(pickedFile.path);
    setState(() {});
  }

  void addProducttoDB() async {
    String url = "http://10.0.2.2/script/addproduct.php";
    final response = await http.post(url, body: {
      'name': pname.text,
      'description': pdescription.text,
      'price': pprice.text,
      'imageUrl': file.path
    });
    print(response.body);
  }
}
