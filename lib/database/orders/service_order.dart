//เชื่อต่อ http สำหรับลิ้ง API
import 'dart:convert';
import 'dart:developer';
import 'package:frontcatshop/database/orders/orderItems_db.dart';
import 'package:frontcatshop/database/orders/ordersId_db.dart';
import 'package:http/http.dart' as http;

//shared service
import 'package:frontcatshop/shared/service.dart';

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/orders/orders_db.dart';

import 'package:intl/intl.dart';

class ApiOrder {
  //--------------- ดึงข้อมูล getOrders ---------------//
  Future<List<Orders>?> getOrders() async {
    // log("get Orders");
    try {
      var url = Uri.parse(Shared.baseUrl + "/api/orders/?populate=*");
      var response = await http.get(
        url,
        headers: {"Authorization": "Bearer ${Shared.accesToken}"},
      );
      // log("get Orders");
      // log('${response.statusCode}');
      // log('${response.body}');

      if (response.statusCode == 200) {
        Orders orders = Orders.fromJson(jsonDecode(response.body));
        // log('total Amount ----> '+orders.data[0].attributes.usersPermissionsUser.data.id.toString());
        log('usersPermissionsUser id ----> ${orders.data?[0].attributes?.usersPermissionsUser?.data?.id ?? ''}');


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
  Future<OrdersId?> addOrders(int product_id, int product_price, String product_url) async {
    log("add Orders");
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
            "total_amount": product_price,
            "order_date": formattedDate,
            "users_permissions_user": Local.id
          }
        }),
      );
        // log('${response.statusCode}');
        // log('${response.body}');
      if (response.statusCode == 200) {
        OrdersId orders = OrdersId.fromJson(json.decode(response.body));
        int orderId = orders.data.id;
        // log(orders.data.id.toString());
        await ApiOrderItems().addOrderItems(orderId, product_id, product_price, product_url);
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
}


class ApiOrderItems {
    //--------------- ดึงข้อมูล getOrders ---------------//
  Future<List<OrderItems>?> getOrderItems() async {
    // log("get OrderItems");
    try {
      var url = Uri.parse(Shared.baseUrl + "/api/order-items/?populate=*");
      var response = await http.get(
        url,
        headers: {"Authorization": "Bearer ${Shared.accesToken}"},
      );
      // log("get OrderItems");
      // log('${response.statusCode}');
      // log('${response.body}');

      if (response.statusCode == 200) {
        OrderItems orderItems = OrderItems.fromJson(jsonDecode(response.body));
        log('Orders id ----> ${orderItems.data[0].attributes.order.data?.id ?? ''}');


        return [orderItems]; // แปลงให้เป็น List โดยใส่เครื่องหมาย [] รอบครอบ
      } else {
        String error = jsonDecode(response.body)['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      log(e.toString());
      return null; // เพิ่มการส่งค่า null เมื่อเกิดข้อผิดพลาด
    }
  }


//--------------- สร้างข้อมูล createOrderItems ---------------//
  Future<void> addOrderItems(int orderId, int product_id, int product_price, String product_url) async {
log("add OrderItems");
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
            "product": product_id,
            "quantity": 1,
            "price": product_price,
            "url_image": product_url
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