import 'package:flutter/material.dart';
import 'package:frontcatshop/database/users/service_users.dart';
import 'package:frontcatshop/database/users/users_db.dart';
import 'package:frontcatshop/home.dart';
import 'package:frontcatshop/massage/chatList.dart';
import 'package:frontcatshop/profile/editProfile.dart';
import 'package:frontcatshop/search/searchData.dart';
import 'package:frontcatshop/shared/service.dart';
import 'package:frontcatshop/trolley/trolley.dart';


class ProfilePage extends StatefulWidget {
  static const namedRoute = "Profile-Page";
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<List<Users>?> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = ApiUsers().getUsersId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
            },
          ),
        ],
      ),

body: FutureBuilder<List<Users>?>(
  future: futureAlbum,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (snapshot.hasData) {
      List<Users> users = snapshot.data!;
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(Shared.baseUrl + '${users[0].userImage![0].url}' ?? ''),
            ),
          ),
          SizedBox(height: 16),
          Text(
            users[0].username,
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
                users[0].email,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Phone:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 8),
              Text(
                users[0].phone ?? '',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          // Add more details as needed
        ],
      );
    } else {
      return Text('No data available');
    }
  },
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProductSearchPage()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.message),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ChatList()),
                  );
                },
              ),
              SizedBox(width: 56.0),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Trolley()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
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
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
