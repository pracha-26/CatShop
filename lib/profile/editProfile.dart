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
late Future<List<Users>?> futureUser;

final _username = TextEditingController();
final _phone = TextEditingController();
final _urlImage = TextEditingController();
String _error = "";

@override
void initState() {
  super.initState();
  futureUser = ApiUsers().getUsersId();
  futureUser.then((user) {
    if (user != null) {
      _username.text = user[0].username;
      _phone.text = user[0].phone ?? '';
      // ปรับปรุงตัวแปร _urlImage ในไฟล์นี้ให้ตรงกับโครงสร้างข้อมูลใน users_db.dart
      _urlImage.text = user[0].userImage![0].url;
    }
  }).catchError((error) {
    setState(() {
      _error = error.toString();
    });
  });
}

  @override
  void _saveProfileChanges() async {
    // print('username: $_username');
    // print('phone: $_phone');
    try {
      // add ข้อมูลลง database
      Users? createduser =
        await ApiUsers().editUsers(_username.text, _phone.text);
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
              backgroundImage: NetworkImage(Shared.baseUrl + '${_urlImage.text}'),
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
              controller: _phone,
              decoration: InputDecoration(
                labelText: 'phone',
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
