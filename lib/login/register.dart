import 'package:flutter/material.dart';

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/users/service_users.dart';
import 'package:frontcatshop/database/users/users_db.dart';

// สำหรับ Naviagtor ไปยังหน้าต่างๆ
import 'package:frontcatshop/login/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  //TextEditใช้ในการควบคุมเนื้อหาในช่องข้อมูล
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //ตัวแปรที่ใช้เก็บค่าของ Future ที่จะเรียกใช้งานในการดึงข้อมูล
  late Future<List<Users>> futureUsers;

  @override
  //กำหนดสถานะเริ่มต้นของ State ใน StatefulWidget เตรียมข้อมูล API ที่จำเป็นในการใช้งานใน Widget
  void initState() {
    super.initState();
    futureUsers = getUser();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Regiter CatShop',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
          title: const Text('Regiter CatShop'),
        ),


        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<Users>>(
            future: futureUsers,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Text(snapshot.data![0].username),
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter user name',
                        ),
                      ),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Enter email',
                        ),
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          hintText: 'Enter password',
                        ),
                      ),

                      
                      ElevatedButton(
                        onPressed: () {
                          print("$_usernameController + $_emailController + $_passwordController");
                          setState(() {
                            futureUsers = createUser(_usernameController.text,_emailController.text,_passwordController.text);
                          });
                        },
                        child: const Text('Submit'),
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