import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'cart.dart';

class customappbar extends StatefulWidget {
  Cart cart_product;

  customappbar(this.cart_product);
  @override
  _customappbarState createState() => _customappbarState();
}

class _customappbarState extends State<customappbar> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Material(
                elevation: 15,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10)),
                    height: 60,
                    width: 60,
                    child: Icon(Icons.menu)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 28.0, left: 28),
              child: Material(
                elevation: 15,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  height: 60,
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(children: [
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(hintText: "Search Now"),
                      )),
                      Icon(Icons.search)
                    ]),
                  ),
                ),
              ),
            ),
            Material(
              elevation: 15,
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => cart_Screen(widget.cart_product),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart),
                        Text(widget.cart_product.itemInCart.toString()),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
