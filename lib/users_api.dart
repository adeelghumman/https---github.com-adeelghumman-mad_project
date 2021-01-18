import 'users.dart';
import 'package:http/http.dart' as http;

Future<List<Users>> fetchusers() async {
  String url = "http://10.0.2.2/script/allusers.php";
  final response = await http.get(url);

  return usersFromJson(response.body);
}
