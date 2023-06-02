import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //ตัวแปรที่ใช้เก็บค่าของ Future ที่จะเรียกใช้งานในการดึงข้อมูล
  late Future<List<Users>> futureUsers;

  @override
  //กำหนดสถานะเริ่มต้นของ State ใน StatefulWidget เตรียมข้อมูล API ที่จำเป็นในการใช้งานใน Widget
  void initState() {
    super.initState();
    // futureUsers = getUser();
  }

  void _registerForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform registration logic here
      // ignore: unused_local_variable
      String username = _usernameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;

      // Process registration data...
      print('username: $username');
      print('Email: $email');
      print('Password: $password');


      // setState(() {
      //   futureUsers = createUser(username,email,password);
        
      //   // Clear form fields
      //   _usernameController.clear();
      //   _emailController.clear();
      //   _passwordController.clear();
      // });
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
          title: const Text('Regiter CatShop'),
        ),


      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'user name',
                ),
                validator: MultiValidator([     //ตรวจสอบ Text fields ที่กรอกเข้ามา
                  RequiredValidator(errorText: "Please enter your name"),
                ]),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: "Please enter your Email"),
                  EmailValidator(errorText: "Please enter your new Email")
                ]),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Please enter your Email"),
                ]),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _registerForm,
                child: Text('Regiter'),
              ),
            ],
          ),
        ),
      ),

      ),
    );
  }
}