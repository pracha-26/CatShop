import 'package:flutter/material.dart';

// สำหรับ Naviagtor ไปยังหน้าต่างๆ
import 'package:frontcatshop/massage/chatList.dart';
import 'package:frontcatshop/profile/profile.dart';
import 'package:frontcatshop/search/searchData.dart';
import 'package:frontcatshop/shared/service.dart';
import 'package:frontcatshop/trolley/trolley.dart';

class Home extends StatefulWidget {
  static const namedRoute = "Home-screen";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Regiter CatShop',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.logout),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ID: ${Local.id}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Username: ${Local.username}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Email: ${Local.email}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),



//Bar แสดงเมนูด้านล่าง
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

      ),
    );
  }
}