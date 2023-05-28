//เชื่อต่อ http สำหรับลิ้ง API
import 'dart:developer';
import 'package:http/http.dart' as http;

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/test_db.dart';

//http ลิ้ง API
String baseUrl = "https://fakestoreapi.com/products/1";

Map<String, String> headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
};

Future<List<User>> getUser() async {
  var url = Uri.parse(baseUrl);
  var response = await http.get(url);

  log('${response.statusCode}');
  log('${response.body}');

  var jsonString = response.body;

  List<User> user = [userFromJson(jsonString)];

  return user;
}
