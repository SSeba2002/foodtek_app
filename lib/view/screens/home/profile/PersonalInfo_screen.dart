import 'package:flutter/material.dart';
import 'package:foodtek_project/constant/responsive.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final Map<String, String> _userData = {
    'username': 'Ahmad Daboor',
    'email': 'Loisbecket@gmail.com',
    'phone': '0797653948',
    'address': '123 Al-Madina Street, Abdali,...'
  };

  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: _userData['name']);
    emailController = TextEditingController(text: _userData['email']);
    phoneController = TextEditingController(text: _userData['phone']);
    passwordController = TextEditingController(text: '**************');
    addressController = TextEditingController(text: _userData['address']);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(AppLocalizations.of(context)!.profile),
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
              AppLocalizations.of(context)!.userName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              AppLocalizations.of(context)!.userEmail,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            buildInputField(AppLocalizations.of(context)!.username, usernameController),
            buildInputField(AppLocalizations.of(context)!.email, emailController),
            buildInputField(AppLocalizations.of(context)!.phoneNumber, phoneController),
            buildInputField(AppLocalizations.of(context)!.password, passwordController, obscureText: true),
            buildInputField(AppLocalizations.of(context)!.address, addressController),
            SizedBox(height: 20),
            SizedBox(
              width: responsiveWidth(context, 295),
              height: responsiveHeight(context, 48),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.update,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputField(
      String label,
      TextEditingController controller, {
        bool obscureText = false,
      }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}