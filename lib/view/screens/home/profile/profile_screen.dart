import 'package:flutter/material.dart';
import 'package:foodtek_project/view/screens/home/profile/PersonalInfo_screen.dart';
import 'package:foodtek_project/view/widgets/buildSection_widget.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _selectedLanguage = 'English';


  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose Language"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.language),
                title: Text("English"),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'English';
                  });
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.language),
                title: Text("العربية"),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'العربية';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

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
            Text("ahmad1709@gmail.com", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            buildSection("My Account", [
              buildListTile(
                Icons.person,
                "Personal Information",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalInfoScreen(),
                    ),
                  );
                },
              ),
              buildListTile(
                Icons.language,
                "Language",
                trailing: Text(_selectedLanguage),
                onTap: () {
                  _showLanguageDialog(context);
                },
              ),
              buildListTile(Icons.privacy_tip, "Privacy Policy", onTap: () {}),
              buildListTile(Icons.settings, "Setting", onTap: () {}),
            ]),
            buildSection("Notifications", [
              buildSwitchTile("Push Notifications", true),
              buildSwitchTile("Promotional Notifications", false),
            ]),
            buildSection("More", [
              buildListTile(Icons.help, "Help Center", onTap: () {}),
              buildListTile(
                Icons.logout,
                "Log Out",
                iconColor: Colors.red,
                onTap: () {},
              ),
            ]),
          ],
        ),
      ),
    );
  }
}