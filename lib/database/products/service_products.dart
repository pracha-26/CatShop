//เชื่อต่อ http สำหรับลิ้ง API
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

//shared service
import 'package:frontcatshop/shared/service.dart';

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/products/products_db.dart';
import 'package:frontcatshop/database/products/productsId_db.dart';


class ApiProducts {
  //--------------- ดึงข้อมูล getProducts ---------------//
  Future<List<Products>?> getProducts() async {
    try {
      var url = Uri.parse(Shared.baseUrl + "/api/products/?populate=*");
      var response = await http.get(
        url,
        headers: {"Authorization": "Bearer ${Shared.accesToken}"},
      );

      log('${response.statusCode}');
      log('${response.body}');

      if (response.statusCode == 200) {
        Products products = productsFromJson(response.body);
        log('pName ----> '+products.data[0].attributes.pName);
        // log('pDescription ----> '+products.data[0].attributes.pDescription);
        // log('pDescription ----> '+products.data[0].attributes.pPrice.toString());

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

    //--------------- ดึงข้อมูล getProductsID ---------------//
  Future<ProductsId?> getProductsID(int id) async {
    try {
      var url = Uri.parse(Shared.baseUrl + "/api/products/${id}?populate=*");
      var response = await http.get(
        url,
        headers: {"Authorization": "Bearer ${Shared.accesToken}"},
      );

      log('${response.statusCode}');
      log('${response.body}');

      if (response.statusCode == 200) {
ProductsId products = ProductsId.fromJson(jsonDecode(response.body));
log('pName ----> ' + products.data.attributes.pName);  // แก้ไขให้เป็น p_name
return products;

      //   ProductsId products = productsIdFromJson(response.body);
      // return [products];
      } else {
        String error = jsonDecode(response.body)['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      log(e.toString());
      // return null; // เพิ่มการส่งค่า null เมื่อเกิดข้อผิดพลาด
    }
  }

}