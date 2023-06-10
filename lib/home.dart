//แพ็กเกจหลักในการพัฒนาแอปพลิเคชัน Flutter
import 'package:flutter/material.dart';

// สำหรับ Naviagtor ไปยังหน้าต่างๆ
import 'package:frontcatshop/massage/chatList.dart';
import 'package:frontcatshop/profile/profile.dart';
import 'package:frontcatshop/search/searchData.dart';
import 'package:frontcatshop/show_body.dart';
import 'package:frontcatshop/trolley/trolley.dart';

/* StatefulWidget: มีสถานะที่สามารถเปลี่ยนแปลงได้ และสามารถกำหนดการสร้าง UI และการอัปเดต UI ขึ้นอยู่กับสถานะได้ 
  ส่วนสำคัญของ StatefulWidget คือเมื่อสถานะเปลี่ยนแปลงจะทำให้เรียกใช้งาน build() เพื่อสร้าง UI ใหม่*/
class Home extends StatefulWidget {
  static const namedRoute = "Home-screen";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
/*    MaterialApp: MaterialApp เป็นคลาสที่ใช้ในการกำหนดและกำหนดค่าทั่วไปของแอปพลิเคชัน Flutter เช่น ชื่อแอปพลิเคชัน (title), ธีม (theme), 
    หน้าจอหลัก (home), เส้นขอบหน้าจอ (debugShowCheckedModeBanner), และอื่น ๆ นอกจากนี้ MaterialApp ยังให้ความสามารถในการกำหนดเส้นทาง (routes), 
    การจัดการเส้นทางที่ไม่รู้จัก (onUnknownRoute), การสร้างเส้นทางเมื่อจำเป็น (onGenerateRoute), และฟังก์ชันอื่น ๆ ที่เกี่ยวข้องกับการจัดการเส้นทาง

    Scaffold: Scaffold เป็นคลาสที่ใช้ในการสร้างโครงสร้างหน้าจอแอปพลิเคชัน โดย Scaffold มีหน้าที่ให้โครงสร้างพื้นฐานสำหรับแอปพลิเคชัน 
    และมีส่วนประกอบหลายอย่างที่สามารถเพิ่มเข้าไปได้ เช่น AppBar, Drawer, BottomNavigationBar, FloatingActionButton, และอื่น ๆ*/

    return MaterialApp(   //MaterialApp ใช้ในการกำหนดและกำหนดค่าทั่วไปของแอปพลิเคชัน
      title: 'Regiter CatShop',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(     //Scaffold ใช้ในการสร้างโครงสร้างหน้าจอแอปพลิเคชัน
        appBar: AppBar(
          title: const Text('CatShop'),
          actions: [    //actions. ในส่วนนี้มีการกำหนด Icon และการประมวลผลเ
            Padding(
              padding: const EdgeInsets.only(right: 20.0),  //กำหนดระยะห่างขององค์ประกอบจากขอบขวาของ AppBar
              child: GestureDetector(   //GestureDetector ใช้ในการตรวจจับการแตะ (tap) ของผู้ใช้
                onTap: () => Navigator.pop(context),  //Navigator.pop(context) เมื่อผู้ใช้แตะ (tap) ที่ Icon นี้ จะทำการนำผู้ใช้กลับไปยังหน้าก่อนหน้านี้
                child: const Icon(Icons.logout),
              ),
            ),
          ],
        ),

        body: ShowBody(),

//Bar แสดงเมนูด้านล่าง
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),  //การกำหนดรูปร่างของส่วนเชื่อมต่อระหว่าง AppBar กับ BottomNavigationBar หรือ FloatingActionButton
          //child กำหนดองค์ประกอบย่อยที่จะแสดง
          child: Container(   //Container ใช้เพื่อสร้างพื้นที่หรือกล่องสำหรับจัดวางและจัดรูปแบบองค์ประกอบภายในใน Flutter
            height: 56.0,
            child: Row(   //Rowประกอบภายในในแนวนอน  (แนวตั้งจะใช้ Column)
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,   
              /*MainAxisAlignment จัดองค์ประกอบภายใน Row spaceEvenly กระจายอย่างทั่วถึงและมีระยะห่างเท่าๆ กัน
                start, end, center, spaceBetween, spaceAround*/

              children: [   //children ใช้สำหรับระบุองค์ประกอบย่อยที่จะถูกแสดงใน Row, Column, หรือ Wrap สามารถระบุวิดเจ็ตโดยใช้รูปแบบ List [ ]
                IconButton(
                  icon: Icon(Icons.search_sharp),
                  onPressed: () {   //onPressed รับพารามิเตอร์เป็นฟังก์ชัน (Function) ที่จะถูกเรียกเมื่อผู้ใช้กดหรือแตะวิดเจ็ต
                    Navigator.push(   //Navigator.push เพื่อเปลี่ยนหน้าจอในแอปพลิเคชัน
                      context,MaterialPageRoute(builder: (context) => ProductSearchPage()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context) => ChatList()),
                    );
                  },
                ),
                SizedBox(width: 56.0),  //SizedBox ใช้สร้างกล่องว่างที่มีขนาดคงที่ในแนวแกนแนวนอน
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context) => Trolley()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context) => ProfilePage())
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(   //เป็นองค์ประกอบใน Flutter ที่ใช้สร้างปุ่มที่แสดงอยู่บนหน้าจอเป็นรูปร่างวงกลมและลอยอยู่เหนือเนื้อหาหลัก
          onPressed: () {
            //Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,  //ที่ใช้กำหนดตำแหน่งที่ปุ่ม FloatingActionButton

      ),
    );
  }
}