//เชื่อต่อ http สำหรับลิ้ง API
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

//shared service
import 'package:frontcatshop/shared/service.dart';

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/users/users_db.dart';

class ApiUsers {
//--------------- ดึงข้อมูล getUser ---------------//
  Future<List<Users>?> getUsers() async {
    try {
      var url = Uri.parse(Shared.baseUrl+"/api/users");
      var response = await http.get(url,
        headers: {"Authorization": "Bearer ${Shared.accesToken}"});

      // log('${response.statusCode}');
      // log('${response.body}');

      if (response.statusCode == 200) {
        List<Users> _model = usersFromJson(response.body);
        return _model;
      } else {
        String error = jsonDecode(response.body)['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      log(e.toString());
    }
  }


//--------------- สร้างข้อมูล createUses ---------------//
  Future<Users?> addUsers(String username, String email, String password) async {
    try {
      var url = Uri.parse(Shared.baseUrl+"/api/auth/local/register");
      var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "Bearer ${Shared.accesToken}",
        },
        body: jsonEncode(<String, String>{
          "username": username,
          "email": email,
          "password": password
        }),
      );
      // log('$username + $email + $password');
      if (response.statusCode == 200) {
        Users _model = Users.fromJson(jsonDecode(response.body));
        return _model;
      } else {
        String error = jsonDecode(response.body)['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      log(e.toString());
    }
  }


  //--------------- แก้ไขข้อมูล editUsers ---------------//
Future<Users?> editUsers(String username, String email) async {
  try {
    var url = Uri.parse(Shared.baseUrl + "/api/users/${Local.id}");
    var response = await http.put(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "Bearer ${Shared.accesToken}",
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'email': email,
        }),
    );
    if (response.statusCode == 200) {
      Users _model = Users.fromJson(jsonDecode(response.body));
      return _model;
    } else {
      String error = jsonDecode(response.body)['error']['message'];
      throw Exception(error);
    }
  } catch (e) {
    log(e.toString());
  }
}



  //--------------- ลบข้อมูล deleteUser ---------------//
  Future<List<Users>?> deleteUsers(String id) async {
    try {
      var url = Uri.parse(Shared.baseUrl+"/api/users/id");
      var response = await http.delete(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "Bearer ${Shared.accesToken}",
        },
        body: jsonEncode(<String, String>{
          'username': id,
        }),
      );
      if (response.statusCode == 200) {
        List<Users> _model = usersFromJson(response.body);
        return _model;
      } else {
        String error = jsonDecode(response.body)['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      log(e.toString());
    }
  }

}