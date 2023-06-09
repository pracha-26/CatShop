import 'package:flutter/material.dart';
import 'package:frontcatshop/database/orders/orders_db.dart';
import 'package:frontcatshop/database/orders/service_order.dart';

class Trolley extends StatefulWidget {
  @override
  _TrolleyState createState() => _TrolleyState();
}

class _TrolleyState extends State<Trolley> {
  late Future<Orders?> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = ApiOrder().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รถเข็น'),
      ),
      


      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.search_sharp),
                onPressed: () {
                  // Navigator.push(
                  //   context,MaterialPageRoute(builder: (context) => ProductSearchPage()),
                  // );
                },
              ),
              IconButton(
                icon: Icon(Icons.message),
                onPressed: () {
                  // Navigator.push(
                  //   context,MaterialPageRoute(builder: (context) => ChatListPage()),
                  // );
                  // Handle search button press
                },
              ),
              SizedBox(width: 56.0),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Navigator.push(
                  //   context,MaterialPageRoute(builder: (context) => Trolley()),
                  // );
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Navigator.push(
                  //   context,MaterialPageRoute(builder: (context) => UserProfilePage())
                  // );
                  // Handle settings button press
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
          // Handle FloatingActionButton press
        },
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      
    );
  }
}
