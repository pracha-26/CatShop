//เชื่อต่อ http สำหรับลิ้ง API
import 'dart:convert';
import 'dart:developer';
import 'package:frontcatshop/database/orders/ordersId_db.dart';
import 'package:http/http.dart' as http;

//shared service
import 'package:frontcatshop/shared/service.dart';

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/orders/orders_db.dart';

import 'package:intl/intl.dart';

class ApiOrder {
  //--------------- ดึงข้อมูล getOrders ---------------//
  Future<Orders?> getOrders() async {
    try {
      var url = Uri.parse(Shared.baseUrl + "/api/orders/?populate=*");
      var response = await http.get(
        url,
        headers: {"Authorization": "Bearer ${Shared.accesToken}"},
      );

      log('${response.statusCode}');
      log('${response.body}');

      if (response.statusCode == 200) {
        Orders orders = Orders.fromJson(jsonDecode(response.body));
        log('total Amount ----> '+orders.data[0].attributes.totalAmount.toString());

        return orders; // แปลงให้เป็น List โดยใส่เครื่องหมาย [] รอบครอบ
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
Future<OrdersId?> addOrders(int product_id, int product_price) async {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(now.toUtc());

  try {
    var url = Uri.parse(Shared.baseUrl + "/api/orders/?populate=*");
    var response = await http.post(
      url,
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
      log('${response.statusCode}');
      log('${response.body}');

    if (response.statusCode == 200) {
      log("in if");
      OrdersId orders = OrdersId.fromJson(json.decode(response.body));

      // Get the order_id from the response or any other source
      int orderId = orders.data.id;
      log(orders.data.id.toString());

      // Add data to the order_items table
      await addOrderItems(orderId, product_id, product_price); // Call the function to add order_items

      return orders;
    } else {
      String error = jsonDecode(response.body)['error']['message'];
      throw Exception(error);
    }
  } catch (e) {
    log(e.toString());
    return null;
  }
}

Future<void> addOrderItems(int orderId, int product_id, int product_price) async {
  log("OrderItems --- ");
  log(orderId.toString());
  try {
    var url = Uri.parse(Shared.baseUrl + "/api/order-items");
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer ${Shared.accesToken}",
      },
      body: jsonEncode(<String, dynamic>{
        "data": {
          "order": orderId,
          "product": product_id, // Provide the product_id
          "quantity": 1, // Provide the quantity
          "price": product_price // Provide the price
        }
      }),
    );

    if (response.statusCode != 200) {
      String error = jsonDecode(response.body)['error']['message'];
      throw Exception(error);
    }
  } catch (e) {
    log(e.toString());
    return null;
  }
}




}