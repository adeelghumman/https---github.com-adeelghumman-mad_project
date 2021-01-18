import 'package:flutter/material.dart';
import 'package:mad_project/customappbar.dart';

import 'cart.dart';

class cart_Screen extends StatefulWidget {
  Cart cart_product;
  cart_Screen(this.cart_product);
  @override
  _cart_ScreenState createState() => _cart_ScreenState();
}

class _cart_ScreenState extends State<cart_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customappbar(widget.cart_product),
            Container(
              height: MediaQuery.of(context).size.height - 250,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return productsInCart(
                        widget.cart_product.products[index][1],
                        widget.cart_product.products[index][2],
                        widget.cart_product.products[index][0]);
                  },
                  itemCount: widget.cart_product.products.length),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(90)),
              height: 110,
              width: 170,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        widget.cart_product.totalBill();
                      },
                      child: Text("Total Bill",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                    ),
                    Text(widget.cart_product.totalBill().toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  productsInCart(String name, String price, var id) {
    return GestureDetector(
        onDoubleTap: () {
          setState(() {
            widget.cart_product.removeFromCart(id);
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 90,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red[200]),
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 150,
                  ),
                  Text(
                    price,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
