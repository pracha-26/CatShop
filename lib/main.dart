import 'package:flutter/material.dart';
import 'package:frontcatshop/user/show_user.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MyHomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cat Shop"),
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              // Navigator.push(
              //   context,MaterialPageRoute(builder: (context) => Login()),
              // );
            },
          ),
        ],
      ),

      body: Column(
        children: [
          // แถบไอคอนเมนู
          Container(
            height: 56.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

              ],
            ),
          ),

        ],
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
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context) => showUser())
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
