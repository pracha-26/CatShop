//แพ็กเกจหลักในการพัฒนาแอปพลิเคชัน Flutter
import 'package:flutter/material.dart';

//สำหรับเชื่อม database
import 'package:frontcatshop/database/products/products_db.dart';
import 'package:frontcatshop/database/products/service_products.dart';

//ไฟล์สาธารณะ shared
import 'package:frontcatshop/shared/service.dart';

// สำหรับ Naviagtor ไปยังหน้าต่างๆ
import 'package:frontcatshop/show_product.dart';

class ShowBody extends StatefulWidget {
  static const namedRoute = "Show-Body";
  const ShowBody({Key? key}) : super(key: key);

  @override
  State<ShowBody> createState() => _ShowBodyState();
}

class _ShowBodyState extends State<ShowBody> {
  //ประกาศตัวแปร Future ที่จะใช้เก็บผลลัพธ์ที่ได้จากการเรียกใช้ API
  late Future<List<Products>?> futureProducts;

  @override
  /*void initState() ป็นเมธอดที่ถูกเรียกใช้เมื่อ Widget ถูกสร้างและต่อกับต้นฉบับ Widget ของ Flutter ในช่วงเริ่มต้น 
  ฟังก์ชันนี้ถูกใช้เพื่อกำหนดการเตรียมตัวและการเริ่มต้นของ Widget ตัวนั้น ๆ*/
  void initState() {    
    /*super.initState();: เรียกใช้เมธอด initState() ของ Superclass (ตัวแม่) ซึ่งในกรณีนี้คือ StatefulWidget 
    เพื่อให้ระบบการทำงานของ Widget ทำงานได้อย่างถูกต้อง*/
    super.initState();
    futureProducts = ApiProducts().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      /*FutureBuilder เป็น Widget ที่ใช้ในการสร้าง UI ขึ้นมาบนพื้นฐานของค่า Future ซึ่งเป็นการจัดการกับการโหลดข้อมูลแบบแอสิงค์โดยใช้ Future ใน Flutter
      โดย FutureBuilder รับค่า Future และมีการกำหนดค่า builder ซึ่งเป็นฟังก์ชันที่รับเป็น context และ snapshot และต้องคืนค่าเป็น Widget 
      ที่จะถูกแสดงบนหน้าจอ ซึ่ง snapshot จะมีสถานะในแต่ละขั้นตอนของ Future ได้แก่ ConnectionState.none, ConnectionState.waiting, 
      ConnectionState.active, ConnectionState.done และ snapshot ยังประกอบด้วยค่าข้อมูลที่ได้รับจาก Future*/
      body: FutureBuilder<List<Products>?>(
        future: futureProducts,
        
        /*BuildContext: เป็นบ่องรับของพื้นที่ที่ Widget กำลังถูกสร้างขึ้นมา ใช้ในการสร้าง Widget ภายใน builder หรือในการเข้าถึงฟังก์ชันของ Flutter API
          AsyncSnapshot: เป็นออบเจ็กต์ที่เก็บข้อมูลที่ได้รับจาก Future รวมถึงสถานะของการโหลดข้อมูล ซึ่งมีค่าเป็นสถานะของ Future ในแต่ละขั้นตอน 
          และค่าข้อมูลที่ได้รับ สามารถเข้าถึงได้ผ่าน snapshot.data*/
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),   //เพื่อแสดง Indicator ในระหว่างที่กำลังโหลดข้อมูลจาก Future
            );
          } else if (snapshot.hasData) {
            List<Products> products = snapshot.data!;
            
            /*ListView.builder เป็น Widget ที่ใช้สร้างรายการแสดงผลในรูปแบบของ ListView โดยสามารถสร้างรายการได้โดยอัตโนมัติ
            โดยใช้ข้อมูลจำนวนมากหรือไม่จำกัด (dynamic list) โดยไม่ต้องระบุรายการแต่ละรายการไว้ล่วงหน้า*/
            return ListView.builder(
              itemCount: products.length,   //itemCount คือจำนวนรายการทั้งหมดที่ต้องการแสดงใน ListView
              itemBuilder: (context, index) {   //itemBuilder คือฟังก์ชันที่ใช้สร้างและคืนค่า Widget สำหรับแสดงผลแต่ละรายการใน ListView โดยใช้ index เป็นตัวชี้วัดในการเข้าถึงข้อมูลสำหรับรายการที่ต้องการ
                Products product = products[index];
                return ListView.builder(
                  itemCount: product.data.length,

                  /*shrinkWrap เป็นค่าบูลีน (boolean) ที่ใช้กำหนดว่า ListView.builder ควรหดตัว (shrink) 
                  ให้พอดีกับข้อมูลที่แสดงหรือไม่ หากค่าเป็น true (ค่าเริ่มต้น)*/
                  shrinkWrap: true,

                  /*physics เป็นค่า ScrollPhysics ที่ใช้กำหนดการทำงานของการเลื่อนใน ListView.builder 
                  NeverScrollableScrollPhysics() จะปิดการเลื่อนใน ListView.builder ทำให้ไม่สามารถเลื่อนหน้าจอได้*/
                  physics: NeverScrollableScrollPhysics(),  
                  itemBuilder: (context, i) {
                    var attributes = product.data[i].attributes;
                    var id = product.data[i].id;
                    var price = product.data[i].attributes.pPrice;
                    return InkWell(   //InkWell เป็นวิดเจ็ตใน Flutter ที่ใช้สร้างพื้นที่ที่สามารถรับการแตะ (tap) จากผู้ใช้งานได้
                      onTap: () {   //onTap เป็นคุณสมบัติของ InkWell ที่ใช้ในการกำหนดการดำเนินการที่ต้องการเมื่อผู้ใช้แตะ (tap) ที่พื้นที่ที่ครอบ InkWell ไว้
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetail(product_id: id, product_price: price),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 2,   //elevation เป็นคุณสมบัติของ InkWell หรือวัตถุอื่น ๆ ใน Flutter ที่ใช้ในการกำหนดระดับความสูง (elevation) ของวัตถุ
                        /*ListTile เป็น Widget ที่ใช้ในการแสดงข้อมูลเป็นรายการในรูปแบบของแถวเดียว ซึ่งส่วนประกอบสำคัญของ ListTile ประกอบไปด้วย:
                          1.leading: Widget ที่แสดงด้านซ้ายของแถว เช่น Icon, Image, หรือ Widget อื่น ๆ
                          2.title: Widget ที่แสดงข้อความหลักของแถว
                          3.subtitle: Widget ที่แสดงข้อความรองของแถว (ไม่บังคับ)
                          4.trailing: Widget ที่แสดงด้านขวาของแถว เช่น Icon, Button, หรือ Widget อื่น ๆ*/
                        child: ListTile(
                          leading: Image.network(
                            Shared.baseUrl + '${attributes.pImage.data.attributes.url}',
                            width: 50,
                            height: 50,
                          ),
                          title: Text(attributes.pName),
                          subtitle: Text(attributes.pDescription),
                          trailing: Text(
                            '\$${attributes.pPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Text('No data available');
          }
        },
      ),
    );
  }
}
