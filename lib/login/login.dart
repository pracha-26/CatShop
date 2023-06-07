import 'package:flutter/material.dart';
// สำหรับ Naviagtor ไปยังหน้าต่างๆ
import 'package:frontcatshop/home.dart';
import 'package:frontcatshop/login/signup.dart';

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/users/service_users.dart';
import 'package:frontcatshop/database/users/users_db.dart';
import 'package:frontcatshop/shared/service.dart';

class Login extends StatefulWidget {
  static const namedRoute = "login-screen";
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ตัวแปรที่ใช้สำหรับรับค่า
  final _email = TextEditingController();
  final _password = TextEditingController();
  String _error = "";

  @override
  // functions เมื่อกด login 
  void _login() async {
    try {
      // ดึงค่าจาก database มาใช้ในการหา email
      List<Users> users = await ApiUsers().getUsers() ?? [];
      late Users? loggedInUser;
      if (users.isNotEmpty) {
        for (var i = 0; i < users.length; i++) {
          if (users[i].email == _email.text) {
            print(users[i].phone);
            String? imageUrl = users[i].userImage?.isNotEmpty == true ? users[i].userImage![0].url : null;
            String? phone = users[i].phone?.isNotEmpty == true ? users[i].phone : null;
            Local.setLocal(users[i].id, users[i].username, users[i].email, imageUrl!, phone!);
            loggedInUser = users[i];
            break;
          }
        }
      }
      if (loggedInUser == null) {
        setState(() {
          _error = "Your account does not exist.";
        });
      } else {
        // navigate to the dashboard screen.
        Navigator.pushNamed(context, Home.namedRoute);
      }
    } on Exception catch (e) {
      setState(() {
        _error = e.toString().substring(11);
      });
    }
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
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
          title: Text("สมัคร Cat Shop"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    // You can add more email validation logic here if needed
                    return null;
                  },
                ),
                TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    // You can add more password validation logic here if needed
                    return null;
                  },
                ),

                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Log in'),
                ),

              TextButton(
                onPressed: () {
                  // navigate to the signup screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Signup()),
                  );
                },
                child: const Text(
                  'New user? Create Account',
                  style: TextStyle(fontSize: 14),
                ),
              ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
