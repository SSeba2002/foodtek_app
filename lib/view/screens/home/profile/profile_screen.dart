import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/cubit/theme_cubit.dart';
import 'package:foodtek_project/view/screens/home/profile/PersonalInfo_screen.dart';
import 'package:foodtek_project/view/widgets/buildSection_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _selectedLanguage;
  late String selectedTheme;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _selectedLanguage = AppLocalizations.of(context)!.english;
          selectedTheme = AppLocalizations.of(context)!.light;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profile),
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
            buildSection(context, AppLocalizations.of(context)!.myAccount, [
              buildListTile(
                Icons.person,
                AppLocalizations.of(context)!.personalInfo,
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
                AppLocalizations.of(context)!.language,
                trailing: Text(_selectedLanguage),
                onTap: () {
                  _showLanguageDialog(context);
                },
              ),
              buildListTile(
                Icons.brightness_4_outlined,
                AppLocalizations.of(context)!.theme,
                trailing: Text(selectedTheme),
                onTap: () {
                  showThemeDialog(context);
                },
              ),
              buildListTile(
                Icons.privacy_tip,
                AppLocalizations.of(context)!.privacyPolicy,
                onTap: () {},
              ),
              buildListTile(
                Icons.settings,
                AppLocalizations.of(context)!.setting,
                onTap: () {},
              ),
            ]),
            buildSection(context, AppLocalizations.of(context)!.notifications, [
              buildSwitchTile(AppLocalizations.of(context)!.pushNotifications, true),
              buildSwitchTile(AppLocalizations.of(context)!.promoNotifications, false),
            ]),
            buildSection(context, AppLocalizations.of(context)!.more, [
              buildListTile(
                Icons.help,
                AppLocalizations.of(context)!.helpCenter,
                onTap: () {},
              ),
              buildListTile(
                Icons.logout,
                AppLocalizations.of(context)!.logout,
                iconColor: Colors.red,
                onTap: () {},
              ),
            ]),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.chooseLanguage),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.language),
                title: Text(AppLocalizations.of(context)!.english),
                onTap: () {
                  setState(() {
                    _selectedLanguage = AppLocalizations.of(context)!.english;
                  });
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.language),
                title: Text(AppLocalizations.of(context)!.arabic),
                onTap: () {
                  setState(() {
                    _selectedLanguage = AppLocalizations.of(context)!.arabic;
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
          title: Text(AppLocalizations.of(context)!.chooseTheme),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.light_mode_outlined),
                title: Text(AppLocalizations.of(context)!.light),
                onTap: () {
                  context.read<AppCubit>().changeTheme(false);
                  setState(() {
                    selectedTheme = AppLocalizations.of(context)!.light;
                  });
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.dark_mode_outlined),
                title: Text(AppLocalizations.of(context)!.dark),
                onTap: () {
                  context.read<AppCubit>().changeTheme(true);
                  setState(() {
                    selectedTheme = AppLocalizations.of(context)!.dark;
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