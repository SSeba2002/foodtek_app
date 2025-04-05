import 'package:flutter/material.dart';
import 'package:foodtek_project/view/screens/PersonalInfo_screen.dart';
import 'package:foodtek_project/view/widgets/buildSection_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            SizedBox(height: 10),
            Text(
              "Ahmad Daboor",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "ahmad1709@gmail.com",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            buildSection("My Account", [
              buildListTile(Icons.person, "Personal Information", onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalInfoScreen()),
                );
              }),
              buildListTile(Icons.language, "Language",
                  trailing: Text("عربية"), onTap: () {}),
              buildListTile(Icons.privacy_tip, "Privacy Policy", onTap: () {}),
              buildListTile(Icons.settings, "Setting", onTap: () {}),
            ]),
            buildSection("Notifications", [
              buildSwitchTile("Push Notifications", true),
              buildSwitchTile("Promotional Notifications", false),
            ]),
            buildSection("More", [
              buildListTile(Icons.help, "Help Center", onTap: () {}),
              buildListTile(Icons.logout, "Log Out",
                  iconColor: Colors.red, onTap: () {}),
            ]),
          ],
        ),
      ),
    );
  }
}
