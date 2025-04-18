// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/constant/functions/theme_dialog.dart';
import 'package:foodtek_project/constant/responsive.dart';
import 'package:foodtek_project/cubit/auth/login_cubit.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/state/auth/login_state.dart';
import 'package:foodtek_project/view/screens/auth/forgetpass/forgot_password_screen.dart';
import 'package:foodtek_project/view/screens/auth/signup_screen.dart';
import 'package:foodtek_project/view/screens/main_screen.dart';
import 'package:foodtek_project/view/widgets/auth/custom_foodtek_logo.dart';
import 'package:foodtek_project/view/widgets/auth/reuesble_scaffold_widget.dart';
import 'package:foodtek_project/view/widgets/auth/social_button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableScaffold(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: IconButton(
                      onPressed: () {
                        showThemeDialog(context);
                      },
                      icon: Icon(Icons.brightness_4_outlined, size: 30),
                    ),
                  ),
                ],
              ),
              CustomFoodtekLogoWidget(),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: responsiveWidth(context, 343),
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
                      child: BlocProvider(
                        create: (context) => LoginCubit(),
                        child: BlocConsumer<LoginCubit, LoginStates>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return Column(
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
                                      AppLocalizations.of(
                                        context,
                                      )!.dontHaveAccount,

                                      style: TextStyle(fontSize: 12),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    const SignUpScreen(),
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
                                // Email Field
                                Text(
                                  AppLocalizations.of(context)!.email,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller:
                                      context
                                          .read<LoginCubit>()
                                          .emailTextEditingController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.r),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),

                                    hintText:
                                        AppLocalizations.of(
                                          context,
                                        )!.enterYourEmail,
                                    errorText:
                                        context
                                                .read<LoginCubit>()
                                                .showErrorEmail
                                            ? AppLocalizations.of(
                                              context,
                                            )!.enterValidEmail
                                            : null,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                // Password Field
                                Text(
                                  AppLocalizations.of(context)!.password,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextField(
                                  controller:
                                      context
                                          .read<LoginCubit>()
                                          .passwordTextEditingController,
                                  obscureText:
                                      context.read<LoginCubit>().obscureText,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.r),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),

                                    hintText:
                                        AppLocalizations.of(
                                          context,
                                        )!.enterYourPassword,
                                    errorText:
                                        context
                                                .read<LoginCubit>()
                                                .showErrorPassword
                                            ? AppLocalizations.of(
                                              context,
                                            )!.enterStrongPassword
                                            : null,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        context
                                            .read<LoginCubit>()
                                            .changeObscureText();
                                      },
                                      icon: Icon(
                                        context.read<LoginCubit>().obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),

                                //CheckBox And ForgotPassword
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value:
                                              context
                                                  .read<LoginCubit>()
                                                  .isRememberMeChecked, // Boolean value for checkbox
                                          onChanged: (bool? newValue) {
                                            context
                                                .read<LoginCubit>()
                                                .changeCheckedRememberme();
                                          },
                                        ),
                                        Text(
                                          AppLocalizations.of(
                                            context,
                                          )!.rememberMe,
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
                                                (context) =>
                                                    ForgotPasswordScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        AppLocalizations.of(
                                          context,
                                        )!.forgotPassword,
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
                                //Login Button
                                SizedBox(
                                  width: responsiveWidth(context, 295),
                                  height: responsiveWidth(context, 48),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<LoginCubit>()
                                          .validationLogin();

                                      if (!context
                                              .read<LoginCubit>()
                                              .showErrorPassword &&
                                          !context
                                              .read<LoginCubit>()
                                              .showErrorEmail) {
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
                                    child: Text(
                                      AppLocalizations.of(context)!.login,
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
                                    //Or Divider
                                    Row(
                                      children: [
                                        const Expanded(child: Divider()),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          child: Text(
                                            AppLocalizations.of(context)!.or,
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        const Expanded(child: Divider()),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    // Google Button
                                    SocialButton(
                                      imagePath: "assets/icons/google.png",
                                      text:
                                          AppLocalizations.of(
                                            context,
                                          )!.continueWithGoogle,
                                      onPressed: () {},
                                    ),
                                    const SizedBox(height: 10),

                                    // Facebook Button
                                    SocialButton(
                                      imagePath: "assets/icons/facebook.png",
                                      text:
                                          AppLocalizations.of(
                                            context,
                                          )!.continueWithFacebook,
                                      onPressed: () {},
                                    ),
                                    const SizedBox(height: 10),

                                    // Apple Button
                                    SocialButton(
                                      imagePath: "assets/icons/apple.png",
                                      text:
                                          AppLocalizations.of(
                                            context,
                                          )!.continueWithApple,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
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
