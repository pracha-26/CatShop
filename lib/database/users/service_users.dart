//เชื่อต่อ http สำหรับลิ้ง API
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/users/users_db.dart';

//http ลิ้ง API
import 'package:frontcatshop/shared/service.dart';

Map<String, String> headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Accept': 'application/json',
};

//--------------- ดึงข้อมูล getUser ---------------//
Future<List<User>> getUser() async {
  var url = Uri.parse(Shared.baseUrl+"/api/users");
  var response = await http.get(url);

  log('${response.statusCode}');
  log('${response.body}');

  if (response.statusCode == 200) {
    var jsonString = response.body;
    List<User> user = userFromJson(jsonString);
    return user;
  } else {
    throw Exception('Failed to update album.');
  }

}


Future<List<User>> updateUser(String username) async {
  var url = Uri.parse(Shared.baseUrl+"/api/users/1");
  var response = await http.put(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
    }),
  );

  log('${response.statusCode}');
  log('${response.body}');

  if (response.statusCode == 200) {
    var jsonString = response.body;
    List<User> user = userFromJson(jsonString);
    return user;
  } else {
    throw Exception('Failed to update album.');
  }

}

