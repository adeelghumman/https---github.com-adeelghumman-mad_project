class Cart {
  int itemInCart = 0;
  List<List> products = [];
  int bill = 0;
  int bill_counter = 0;

  void addProductInCart(String name, String price) {
    List details = [];
    details.add(itemInCart);
    details.add(name);
    details.add(price);

    products.add(details);

    itemInCart++;
  }

  void removeFromCart(int id) {
    for (int i = 0; i <= products.length - 1; i++) {
      if (id == products[i][0]) {
        bill = bill - int.parse(products[i][2]);
        products.removeAt(i);
        itemInCart--;
        bill_counter--;
      }
    }
  }

  int totalBill() {
    for (int i = bill_counter; i <= products.length - 1; i++) {
      bill = bill + int.parse(products[i][2]);
      bill_counter++;
    }
    return bill;
  }
}
