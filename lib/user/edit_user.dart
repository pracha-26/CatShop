import 'package:flutter/material.dart';

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/users/service_users.dart';
import 'package:frontcatshop/database/users/users_db.dart';
import 'package:frontcatshop/user/show_user.dart';

class editUser extends StatefulWidget {
  @override
  _editUserState createState() => _editUserState();
}

class _editUserState extends State<editUser> {
  final TextEditingController _controller = TextEditingController();
  late Future<List<User>> futureUsers;

  @override
  //กำหนดสถานะเริ่มต้นของ State ใน StatefulWidget เตรียมข้อมูล API ที่จำเป็นในการใช้งานใน Widget
  void initState() {
    super.initState();
    futureUsers = getUser();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Update Data Example',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => showUser()),
              );
            },
          ),
          title: const Text('Update Data Example'),
        ),


        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<User>>(
            future: futureUsers,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(snapshot.data![0].username),
                      TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Enter Title',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            futureUsers = updateUser(_controller.text);
                          });
                        },
                        child: const Text('Update Data'),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}