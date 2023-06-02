import 'package:flutter/material.dart';

// สำหรับ Naviagtor ไปยังหน้าต่างๆ
import 'package:frontcatshop/home.dart';
import 'package:frontcatshop/login/login.dart';
import 'package:frontcatshop/login/signup.dart';


void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Strapi App",
      theme: ThemeData(primarySwatch: Colors.red),
      home: const Login(),
      routes: {
        Home.namedRoute: (ctx) => const Home(),
        Login.namedRoute: (ctx) => const Login(),
        Signup.namedRoute: (ctx) => const Signup()
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const Home());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const Home());
      },
    );
  }
}