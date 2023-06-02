import 'dart:convert';
import 'dart:developer';
import 'package:frontcatshop/strapi/strapi_db.dart';
import 'package:frontcatshop/strapi/strpi.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  // Getting users
  Future<List<User>?> getUsers() async {
    try {
      var url = Uri.parse("https://7ab7-2405-9800-ba20-5abd-34a2-4a64-37b1-bc0a.ngrok-free.app/api/users");
      var response = await http.get(url,
          headers: {"Authorization": "Bearer ${Dotenv.accesToken}"});
      if (response.statusCode == 200) {
        List<User> _model = userFromJson(response.body);
        return _model;
      } else {
        String error = jsonDecode(response.body)['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Adding user
  Future<User?> addUser(String email, String username, String password) async {
    try {
      var url = Uri.parse("https://7ab7-2405-9800-ba20-5abd-34a2-4a64-37b1-bc0a.ngrok-free.app/api/auth/local/register");
      var response = await http.post(url,
          headers: {"Authorization": "Bearer ${Dotenv.accesToken}"},
          body: {"email": email, "username": username, "password": password});

      // if (response.statusCode == 201) {
      //   User _model = userFromJson(response.body);
      //   return _model;
      // } else {
      //   String error = jsonDecode(response.body)['error']['message'];
      //   throw Exception(error);
      // }
    } catch (e) {
      throw Exception(e);
    }
  }
}