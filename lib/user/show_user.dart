import 'package:flutter/material.dart';

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/users/service_users.dart';
import 'package:frontcatshop/database/users/users_db.dart';
import 'package:frontcatshop/user/edit_user.dart';

class showUser extends StatefulWidget {
  const showUser({super.key});

  @override
  State<showUser> createState() => _showUserState();
}

class _showUserState extends State<showUser> {
  late Future<List<User>> futureUsers;

  @override
  //กำหนดสถานะเริ่มต้นของ State ใน StatefulWidget เตรียมข้อมูล API ที่จำเป็นในการใช้งานใน Widget
  void initState() {
    super.initState();
    futureUsers = getUser();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context) => editUser()),
                  );
                },
            ),
          ],
        ),

        body: Center(
          child: FutureBuilder<List<User>>(
            future: futureUsers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage('URL_OF_THE_IMAGE'),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      snapshot.data![0].username,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Email:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 8),
                        Text(
                          snapshot.data![0].email,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Provider:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 8),
                        Text(
                          snapshot.data![0].provider,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    // Add more details as needed
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),


//---------------------- 
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
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ProductSearchPage()),
                    // );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ChatListPage()),
                    // );
                  },
                ),
                SizedBox(width: 56.0),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Trolley()),
                    // );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );

  }
}

