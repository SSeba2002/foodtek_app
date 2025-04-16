import 'package:flutter/material.dart';
import 'package:foodtek_project/constant/responsive.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/view/screens/auth/forgetpass/forgot_password_screen.dart';
import 'package:foodtek_project/view/screens/auth/signup_screen.dart';
import 'package:foodtek_project/view/screens/main_screen.dart';
import 'package:foodtek_project/view/widgets/auth/social_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showErrorEmail = false;
  bool showErrorPassword = false;
  bool obscureText = true;
  bool isRememberMeChecked = false;

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/base_backgrund.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 100,
                    ), // space between background and container
                    Container(
                      width: responsiveWidth(context, 343),
                      height: responsiveHeight(context, 661),
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                AppLocalizations.of(context)!.login,
                                style: TextStyle(
                                  fontSize: 32,

                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.dontHaveAccount,
                                  style: TextStyle(fontSize: 12),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => const SignUpScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!.signUp,
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
                            const Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailTextEditingController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                //  label: const Text("Email"),
                                hintText: "Enter Your Email",
                                errorText:
                                    showErrorEmail ? "Enter Valid Email" : null,
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "Password",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            TextField(
                              controller: passwordTextEditingController,
                              obscureText: obscureText,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color.fromRGBO(
                                      237,
                                      241,
                                      234,
                                      1,
                                    ),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                //  label: const Text("Password"),
                                hintText: "Enter Your Password",
                                errorText:
                                    showErrorPassword
                                        ? "Enter Strong Password"
                                        : null,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  icon: Icon(
                                    obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // Distribute space between items
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value:
                                          isRememberMeChecked, // Boolean value for checkbox
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          isRememberMeChecked =
                                              newValue ?? false;
                                        });
                                      },
                                    ),
                                    const Text(
                                      "Remember Me",
                                      style: TextStyle(fontSize: 11),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => ForgotPasswordScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: responsiveWidth(context, 295),
                              height: responsiveWidth(context, 48),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    showErrorEmail =
                                        !isEmail(
                                          email:
                                              emailTextEditingController.text
                                                  .trim(),
                                        );
                                    showErrorPassword =
                                        !isStrongPassword(
                                          password:
                                              passwordTextEditingController.text
                                                  .trim(),
                                        );
                                  });
                                  if (!showErrorEmail && !showErrorPassword) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainScreen(),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(
                                    37,
                                    174,
                                    75,
                                    1,
                                  ),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Expanded(child: Divider()),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        "Or",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    const Expanded(child: Divider()),
                                  ],
                                ),
                                SizedBox(height: 20),
                                // Google Button
                                SocialButton(
                                  imagePath: "assets/icons/google.png",
                                  text: "Continue with Google",
                                  onPressed: () {
                                    // Handle Google Sign-in
                                  },
                                ),
                                const SizedBox(height: 10),

                                // Facebook Button
                                SocialButton(
                                  imagePath: "assets/icons/facebook.png",
                                  text: "Continue with Facebook",
                                  onPressed: () {
                                    // Handle Facebook Sign-in
                                  },
                                ),
                                const SizedBox(height: 10),

                                // Apple Button
                                SocialButton(
                                  imagePath: "assets/icons/apple.png",
                                  text: "Continue with Apple",
                                  onPressed: () {
                                    // Handle Apple Sign-in
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool isStrongPassword({required String password}) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(password);
}

bool isEmail({required String email}) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(p);
  return regExp.hasMatch(email);
}
