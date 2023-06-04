//เชื่อต่อ http สำหรับลิ้ง API
import 'dart:convert';
import 'dart:developer';

import 'package:frontcatshop/database/products/products_db.dart';
import 'package:http/http.dart' as http;

//ดึง database ตัวที่เราจะใช้ _db.dart

//http ลิ้ง API
import 'package:frontcatshop/shared/service.dart';

class ApiProducts {
//--------------- ดึงข้อมูล getProducts ---------------//
  Future<List<Products>?> getProducts() async {
    try {
      var url = Uri.parse(Shared.baseUrl+"/api/products");
      var response = await http.get(url,
        headers: {"Authorization": "Bearer ${Shared.accesToken}"});

      log('${response.statusCode}');
      log('${response.body}');

      if (response.statusCode == 200) {
        List<Products> _model = productsFromJson(response.body);
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