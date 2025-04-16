import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/cubit/theme_cubit.dart';
import 'package:foodtek_project/view/screens/home/profile/PersonalInfo_screen.dart';
import 'package:foodtek_project/view/widgets/buildSection_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"), elevation: 0),
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
            buildSection(context, "My Account", [
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
              buildListTile(
                Icons.brightness_4_outlined,
                "Theme",
                trailing: Text(selectedTheme),
                onTap: () {
                  showThemeDialog(context);
                },
              ),
              buildListTile(Icons.privacy_tip, "Privacy Policy", onTap: () {}),
              buildListTile(Icons.settings, "Setting", onTap: () {}),
            ]),
            buildSection(context, "Notifications", [
              buildSwitchTile("Push Notifications", true),
              buildSwitchTile("Promotional Notifications", false),
            ]),
            buildSection(context, "More", [
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

  String _selectedLanguage = 'English';
  String selectedTheme = 'Light';
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

  void showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose Theme"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.light_mode_outlined),
                title: Text("Light"),
                onTap: () {
                  context.read<AppCubit>().changeTheme(false);
                  setState(() {
                    selectedTheme = 'Light';
                  });
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.dark_mode_outlined),
                title: Text("Dark"),
                onTap: () {
                  context.read<AppCubit>().changeTheme(true);
                  setState(() {
                    selectedTheme = 'Dark';
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
}
