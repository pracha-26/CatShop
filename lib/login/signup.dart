import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

//ดึง database ตัวที่เราจะใช้ _db.dart
import 'package:frontcatshop/database/users/service_users.dart';
import 'package:frontcatshop/database/users/users_db.dart';

// สำหรับ Naviagtor ไปยังหน้าต่างๆ
import 'package:frontcatshop/login/login.dart';
import 'package:frontcatshop/strapi/strapi_dashboard.dart';

class Signup extends StatefulWidget {
  static const namedRoute = "signup-screen";
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  //TextEditใช้ในการควบคุมเนื้อหาในช่องข้อมูล
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String _error = "";

  @override
  void _SignupForm() async {
          try {
    if (_formKey.currentState!.validate()) {
      print('username: $_username.text');
      print('Email: $_email.text');
      print('Password: $_password.text');


        Users? createduser =
          await ApiUsers().addUsers(_username.text, _email.text, _password.text);
        if (createduser != null) {
        // navigate to the dashboard.
        Navigator.pushNamed(context, Dashboard.namedRoute);
        }
      } 

    }on Exception catch (e) {
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
                controller: _username,
                decoration: InputDecoration(
                  labelText: 'user name',
                ),
                validator: MultiValidator([     //ตรวจสอบ Text fields ที่กรอกเข้ามา
                  RequiredValidator(errorText: "Please enter your name"),
                ]),
              ),

              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: "Please enter your Email"),
                  EmailValidator(errorText: "Please enter your new Email")
                ]),
              ),
              TextFormField(
                controller: _password,
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
                onPressed: _SignupForm,
                child: Text('Create Account'),
              ),

              TextButton(
                onPressed: () {
                // navigate to the signup screen
                Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Login()));
                },
                child: const Text(
                'Already have an account? Login',
                style: TextStyle(fontSize: 16),
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