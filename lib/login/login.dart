import 'package:flutter/material.dart';
import 'package:frontcatshop/login/register.dart';

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/users/service_users.dart';
import 'package:frontcatshop/database/users/users_db.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
    //ตัวแปรที่ใช้เก็บค่าของ Future ที่จะเรียกใช้งานในการดึงข้อมูล
  late Future<List<Users>> futureUsers;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
    //กำหนดสถานะเริ่มต้นของ State ใน StatefulWidget เตรียมข้อมูล API ที่จำเป็นในการใช้งานใน Widget
  void initState() {
    super.initState();
    futureUsers = getUser();
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform registration logic here
      String email = _emailController.text;
      String password = _passwordController.text;

      List<Users> users = await futureUsers; // รอการเรียกใช้งาน Future และรับค่าผลลัพธ์
      for (Users user in users) {
      // ดำเนินการกับข้อมูลของแต่ละ user ที่ได้จาก Future
      print('User ID: ${user.id}');
      print('Username: ${user.username}');
      print('Email: ${user.email}');
}
      // Process registration data...
      // print('Email: $email');
      // print('Password: $password');

      if(email == email){
        if(password == password){}
      }

      // Clear form fields
      _emailController.clear();
      _passwordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
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
                controller: _passwordController,
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
                onPressed: _submitForm,
                child: Text('Log in'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                child: Text('Regiter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
