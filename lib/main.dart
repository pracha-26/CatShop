//แพ็กเกจหลักในการพัฒนาแอปพลิเคชัน Flutter
import 'package:flutter/material.dart';

// สำหรับ Naviagtor ไปยังหน้าต่างๆ
import 'package:frontcatshop/home.dart';
import 'package:frontcatshop/login/login.dart';
import 'package:frontcatshop/login/signup.dart';


void main() {
  runApp(const App());
}

/* StatefulWidget: มีสถานะที่สามารถเปลี่ยนแปลงได้ และสามารถกำหนดการสร้าง UI และการอัปเดต UI ขึ้นอยู่กับสถานะได้ 
  ส่วนสำคัญของ StatefulWidget คือเมื่อสถานะเปลี่ยนแปลงจะทำให้เรียกใช้งาน build() เพื่อสร้าง UI ใหม่*/
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(   //MaterialApp ใช้ในการกำหนดและกำหนดค่าทั่วไปของแอปพลิเคชัน
      title: "Strapi App",
      theme: ThemeData(primarySwatch: Colors.red),
      home: const Login(),  //หน้าแรกของแอปพลิเคชันที่จะแสดงเมื่อเปิดแอปพลิเคชัน
      routes: {   //เส้นทาง (routes) ที่กำหนดไว้
        Home.namedRoute: (ctx) => const Home(),
        Login.namedRoute: (ctx) => const Login(),
        Signup.namedRoute: (ctx) => const Signup()
      },
      onGenerateRoute: (settings) {   //การกำหนดเมื่อเกิดการเรียกเส้นทางที่ไม่ได้ระบุไว้ใน routes ให้แสดงหน้า Home()
        return MaterialPageRoute(builder: (context) => const Home());
      },
      onUnknownRoute: (settings) {    //การกำหนดเมื่อเกิดการเรียกเส้นทางที่ไม่รู้จักให้แสดงหน้า Home()
        return MaterialPageRoute(builder: (context) => const Home());
      },
    );
  }
}