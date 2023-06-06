//เชื่อต่อ http สำหรับลิ้ง API
import 'dart:convert';
import 'dart:developer';

import 'package:frontcatshop/database/products/products_db.dart';
import 'package:http/http.dart' as http;

//ดึง database ตัวที่เราจะใช้ _db.dart

//http ลิ้ง API
import 'package:frontcatshop/shared/service.dart';

class ApiProducts {
  Future<List<Products>?> getProducts() async {
    try {
      var url = Uri.parse(Shared.baseUrl + "/api/products/?populate=*");
      var response = await http.get(
        url,
        headers: {"Authorization": "Bearer ${Shared.accesToken}"},
      );

      // log('${response.statusCode}');
      // log('${response.body}');

      if (response.statusCode == 200) {
        Products products = productsFromJson(response.body);
        log('pName ----> '+products.data[0].attributes.pName);
        log('pDescription ----> '+products.data[0].attributes.pDescription);
        log('pDescription ----> '+products.data[0].attributes.pPrice.toString());

        return [products]; // แปลงให้เป็น List โดยใส่เครื่องหมาย [] รอบครอบ
      } else {
        String error = jsonDecode(response.body)['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      log(e.toString());
      return null; // เพิ่มการส่งค่า null เมื่อเกิดข้อผิดพลาด
    }
  }
}