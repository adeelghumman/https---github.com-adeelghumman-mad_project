import 'product.dart';
import 'package:http/http.dart' as http;

Future<List<Products>> fetchproducts() async {
  String url = "http://10.0.2.2/script/allProducts.php";
  final response = await http.get(url);

  return productsFromJson(response.body);
}
