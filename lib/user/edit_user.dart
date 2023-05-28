import 'package:flutter/material.dart';

class editUser extends StatefulWidget {
  @override
  _editUserState createState() => _editUserState();
}

class _editUserState extends State<editUser> {
  String _username = ''; // เก็บค่าชื่อผู้ใช้
  String _email = ''; // เก็บค่าอีเมลผู้ใช้

  // ฟังก์ชันสำหรับบันทึกการเปลี่ยนแปลง
  void _saveChanges() {
    // ทำการบันทึกการเปลี่ยนแปลงที่ต้องการได้ตามต้องการ
    // เช่น ส่งค่า _username และ _email ไปยัง API เพื่ออัปเดตข้อมูลในฐานข้อมูล

    // สร้าง AlertDialog เพื่อแสดงข้อความว่าการแก้ไขเสร็จสมบูรณ์
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success'),
        content: Text('Profile updated successfully.'),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context); // ปิด AlertDialog
              Navigator.pop(context); // ย้อนกลับไปยังหน้าแสดงโปรไฟล์
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('URL_OF_THE_IMAGE'),
            ),
            SizedBox(height: 16),
            TextFormField(
              initialValue: _username, // กำหนดค่าเริ่มต้นให้กับช่องกรอกชื่อผู้ใช้
              decoration: InputDecoration(
                labelText: 'Username',
              ),
              onChanged: (value) {
                setState(() {
                  _username = value; // เมื่อมีการเปลี่ยนแปลงค่าในช่องกรอก อัปเดตค่า _username
                });
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              initialValue: _email, // กำหนดค่าเริ่มต้นให้กับช่องกรอกอีเมล
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (value) {
                setState(() {
                  _email = value; // เมื่อมีการเปลี่ยนแปลงค่าในช่องกรอก อัปเดตค่า _email
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveChanges, // เรียกใช้ฟังก์ชัน _saveChanges เมื่อกดปุ่ม
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
