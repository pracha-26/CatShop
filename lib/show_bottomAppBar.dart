import 'package:flutter/material.dart';
import 'package:frontcatshop/massage/chatList.dart';
import 'package:frontcatshop/profile/profile.dart';
import 'package:frontcatshop/search/searchData.dart';
import 'package:frontcatshop/trolley/trolley.dart';

class ShowBottomAppBar extends StatefulWidget {
  static const namedRoute = "Show-BottomAppBar";
 const ShowBottomAppBar({Key? key}) : super(key: key);

  @override
  State<ShowBottomAppBar> createState() => _ShowBottomAppBarState();
}

class _ShowBottomAppBarState extends State<ShowBottomAppBar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context) => ProductSearchPage()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.message),
                onPressed: () {
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context) => ChatList()),
                  );
                },
              ),
              SizedBox(width: 56.0),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context) => Trolley()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context) => ProfilePage())
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.popUntil(context, (route) => route.isFirst);
        },
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

