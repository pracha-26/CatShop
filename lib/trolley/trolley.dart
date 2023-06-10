import 'package:flutter/material.dart';
import 'package:frontcatshop/database/orders/orderItems_db.dart';
import 'package:frontcatshop/database/orders/orders_db.dart';
import 'package:frontcatshop/database/orders/service_order.dart';
import 'package:frontcatshop/shared/service.dart';


class List_Orders {
  final String name;
  final String description;
  final int price;
  final String imageUrl;
  final int quantity;

  List_Orders({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });
}

class Trolley extends StatefulWidget {
  @override
  _TrolleyState createState() => _TrolleyState();
}

class _TrolleyState extends State<Trolley> {
  late Future<List<Orders>?> futureAlbum;
  late Future<List<OrderItems>?> futureOrderItems;
  List<List_Orders> filteredProducts = [];
  late int orders_id;

  @override
  void initState() {
    super.initState();
    futureAlbum = ApiOrder().getOrders();
    futureOrderItems = ApiOrderItems().getOrderItems();

    setState(() {
      futureAlbum.then((products) async {
        filteredProducts = [];
        for (var product in products!) {
          for (var data in product.data) {
            if (data.attributes.usersPermissionsUser.data?.id == Local.id) {
              orders_id = data.id;
              List<OrderItems>? orderItems = await futureOrderItems; // รอให้ futureOrderItems เสร็จสิ้นก่อน
              bool isAdded = false;
              for (var product in orderItems!) {
                for (var data in product.data) {
                  if (data.attributes.order.data?.id == orders_id) {
                    List_Orders newProduct = List_Orders(
                      name: data.attributes.product?.data?.attributes?.pName ?? '',
                      description: data.attributes.product?.data?.attributes?.pDescription ?? '',
                      price: data.attributes.price ?? 0,
                      imageUrl: '',
                      quantity: data.attributes.quantity ?? 0,
                    );
                    if (!isAdded) {
                      filteredProducts.add(newProduct);
                      isAdded = true;
                    }
                  }
                }
              }
            }
          }
        }
      });
    });
  }



  // ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รถเข็น'),
      ),
      body: FutureBuilder<List<Orders>?>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }

          return ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                List_Orders product = filteredProducts[index];
                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading: Image.network(
                      'https://i.guim.co.uk/img/media/26392d05302e02f7bf4eb143bb84c8097d09144b/446_167_3683_2210/master/3683.jpg?width=1200&quality=85&auto=format&fit=max&s=a52bbe202f57ac0f5ff7f47166906403',
                      width: 100,
                      height: 100,
                    ),
                    title: Text(product.name),
                    subtitle: Text('ราคา : ${product.price.toStringAsFixed(2)} บาท'),
                    trailing: Text(
                      'จำนวน ${product.quantity} ตัว'),
                    onTap: () {
                      // TODO: Handle item tap
                    },
                  ),
                );
              },
            );
        },
      ),
    );
  }


}
