import 'package:flutter/material.dart';
import 'package:foodtek_project/constant/responsive.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/view/screens/auth/forgetpass/forgot_password_screen.dart';
import 'package:foodtek_project/view/screens/auth/login_screen.dart';
import 'package:foodtek_project/view/widgets/auth/custom_foodtek_logo.dart';
import 'package:foodtek_project/view/widgets/auth/forgetpass/congrate_widget.dart';
import 'package:foodtek_project/view/widgets/auth/reuesble_scaffold_widget.dart';

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
    final l10n = AppLocalizations.of(context)!;
    return ReusableScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomFoodtekLogoWidget(),
            SizedBox(height: 50),
            Center(
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
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen(),
                                ),
                              );
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      l10n.resetPassword,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          l10n.wanttotrywithmycurrentpassword,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 11),
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
                          child: Text(
                            l10n.login,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: l10n.password,
                        alignLabelWithHint: true,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: l10n.confirmNewPassword,
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
                          ),
                        ),
                        child: Text(
                          l10n.updatePassword,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
