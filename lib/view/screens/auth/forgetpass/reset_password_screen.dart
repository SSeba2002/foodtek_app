import 'package:flutter/material.dart';
import 'package:foodtek_project/constant/responsive.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/view/screens/auth/login_screen.dart';
import 'package:foodtek_project/view/widgets/auth/forgetpass/congrate_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool obscureText = true;
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmNewPasswordTextEditingController =
      TextEditingController();
  bool showErrorPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/base_backgrund.jpg"),
            fit: BoxFit.cover,
          ),
        ),
<<<<<<< HEAD

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: responsiveWidth(context, 343),
              height: responsiveHeight(context, 417.3),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(AppLocalizations.of(context)!.resetPassword
                    ,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Row(
||||||| 1441b04

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: responsiveWidth(context, 343),
              height: responsiveHeight(context, 417.3),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Row(
=======
        child: Center(
          child: Container(
            width: responsiveWidth(context, 343),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
>>>>>>> ad770d7ce093846396c3132785ee6a7bca73cbcc
                    children: [
<<<<<<< HEAD
                      Text(AppLocalizations.of(context)!.
                        tryCurrentPassword,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child:  Text(AppLocalizations.of(context)!.login,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
||||||| 1441b04
                      Text(
                        "Want to try with my current password?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          " login",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
=======
                      Icon(Icons.arrow_back),
                      const SizedBox(width: 5),
>>>>>>> ad770d7ce093846396c3132785ee6a7bca73cbcc
                    ],
                  ),
<<<<<<< HEAD
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.password,
                      alignLabelWithHint: true,
||||||| 1441b04
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      alignLabelWithHint: true,
=======
                ),
                const SizedBox(height: 20),
                Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Want to try with my current password?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 11),
>>>>>>> ad770d7ce093846396c3132785ee6a7bca73cbcc
                    ),
<<<<<<< HEAD
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText:AppLocalizations.of(context)!.confirmNewPassword,
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: responsiveWidth(context, 295),
                    height: responsiveHeight(context, 48),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => CongrateWidget(),
||||||| 1441b04
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Confirm New Password",
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: responsiveWidth(context, 295),
                    height: responsiveHeight(context, 48),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => CongrateWidget(),
=======
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
>>>>>>> ad770d7ce093846396c3132785ee6a7bca73cbcc
                        );
                      },
                      child: const Text(
                        " login",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
<<<<<<< HEAD
                      child: Text(
                      AppLocalizations.of(context)!.updatePassword,
                        style: TextStyle(fontSize: 14, color: Colors.white),
||||||| 1441b04
                      child: Text(
                        "Update Password",
                        style: TextStyle(fontSize: 14, color: Colors.white),
=======
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    alignLabelWithHint: true,
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirm New Password",
                    alignLabelWithHint: true,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: responsiveWidth(context, 295),
                  height: responsiveHeight(context, 48),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => CongrateWidget(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(37, 174, 75, 1),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
>>>>>>> ad770d7ce093846396c3132785ee6a7bca73cbcc
                      ),
                    ),
                    child: Text(
                      "Update Password",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
