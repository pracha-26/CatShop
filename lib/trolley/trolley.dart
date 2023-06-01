import 'package:flutter/material.dart';

class Trolley extends StatefulWidget {
  @override
  _TrolleyState createState() => _TrolleyState();
}

class _TrolleyState extends State<Trolley> {
  List<String> cartItems = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];

  void increaseQuantity(int index) {
    setState(() {
      // เพิ่มจำนวนสินค้าในรถเข็น
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      // ลดจำนวนสินค้าในรถเข็น
    });
  }

  void removeItem(int index) {
    setState(() {
      // ลบสินค้าออกจากรถเข็น
    });
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
