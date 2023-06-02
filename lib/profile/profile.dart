import 'package:flutter/material.dart';
import 'package:frontcatshop/home.dart';
import 'package:frontcatshop/massage/chatList.dart';
import 'package:frontcatshop/profile/editProfile.dart';
import 'package:frontcatshop/search/searchData.dart';
import 'package:frontcatshop/shared/service.dart';
import 'package:frontcatshop/trolley/trolley.dart';

class ProfilePage extends StatelessWidget {
  static const String namedRoute = 'profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('../../image/cat2.jpg'),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Full Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  Local.username ?? '',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Email',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  Local.email ?? '',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Phone',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '+1 123-456-7890',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
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
                    Navigator.pushReplacement(
                      context,MaterialPageRoute(builder: (context) => ProductSearchPage()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,MaterialPageRoute(builder: (context) => ChatList()),
                    );
                  },
                ),
                SizedBox(width: 56.0),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,MaterialPageRoute(builder: (context) => Trolley()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.pushReplacement(
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
            Navigator.pushReplacement(
              context,MaterialPageRoute(builder: (context) => Home()),
            );
          },
          child: Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
