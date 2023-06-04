import 'package:flutter/material.dart';
import 'package:frontcatshop/database/users/service_users.dart';
import 'package:frontcatshop/database/users/users_db.dart';
import 'package:frontcatshop/profile/profile.dart';

import 'package:frontcatshop/shared/service.dart';

class EditProfile extends StatefulWidget {
  static const String namedRoute = 'edit_profile';

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _username = TextEditingController();
  final _email = TextEditingController();
  String _error = "";

    @override
  void initState() {
    super.initState();
    // กำหนดค่าเริ่มต้นให้กับ TextEditingController จากข้อมูลที่มีอยู่
    _username.text = Local.username ?? '';
    _email.text = Local.email ?? '';
  }

  @override
  void _saveProfileChanges() async {
    print('username: $_username');
    print('Email: $_email');
    try {
      // add ข้อมูลลง database
      Users? createduser =
        await ApiUsers().editUsers(_username.text, _email.text);
      if (createduser != null) {
      // navigate to the dashboard.
      Navigator.pushNamed(context, ProfilePage.namedRoute);
      }
    }on Exception catch (e) {
      setState(() {
      _error = e.toString().substring(11);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              // แสดงรูปผู้ใช้ที่นี่
              // backgroundImage: AssetImage('path/to/profile_image.jpg'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _username,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _email,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // บันทึกการแก้ไขข้อมูลโปรไฟล์
                _saveProfileChanges();
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

}
