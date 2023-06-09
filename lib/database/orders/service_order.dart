//เชื่อต่อ http สำหรับลิ้ง API
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

//shared service
import 'package:frontcatshop/shared/service.dart';

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/orders/orders_db.dart';

import 'package:intl/intl.dart';

class ApiOrder {
  //--------------- ดึงข้อมูล getOrders ---------------//
  Future<List<Orders>?> getOrders() async {
    try {
      var url = Uri.parse(Shared.baseUrl + "/api/orders/?populate=*");
      var response = await http.get(
        url,
        headers: {"Authorization": "Bearer ${Shared.accesToken}"},
      );

      log('${response.statusCode}');
      log('${response.body}');

      if (response.statusCode == 200) {
        Orders orders = ordersFromJson(response.body);
        log('total Amount ----> '+orders.data[0].attributes.totalAmount.toString());

        return [orders]; // แปลงให้เป็น List โดยใส่เครื่องหมาย [] รอบครอบ
      } else {
        String error = jsonDecode(response.body)['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      log(e.toString());
      return null; // เพิ่มการส่งค่า null เมื่อเกิดข้อผิดพลาด
    }
  }

//--------------- สร้างข้อมูล createOrders ---------------//
  Future<List<Orders>?> addOrders() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(now.toUtc());
    log(formattedDate);

    try {
      var url = Uri.parse(Shared.baseUrl+"/api/orders");
      var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "Bearer ${Shared.accesToken}",
        },
        body: jsonEncode(<String, dynamic>{
          "data": {
            "total_amount": 0,
            "order_date": formattedDate,
            "users_permissions_user": Local.id
          }
        }),
      );
      // log('$username + $email + $password');
      if (response.statusCode == 200) {
        Orders orders = ordersFromJson(response.body);
        log('total Amount ----> '+orders.data[0].attributes.totalAmount.toString());

        return [orders]; // แปลงให้เป็น List โดยใส่เครื่องหมาย [] รอบครอบ
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