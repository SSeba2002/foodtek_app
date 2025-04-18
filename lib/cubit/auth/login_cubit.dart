import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/state/auth/login_state.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitLoginState());

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showErrorEmail = false;
  bool showErrorPassword = false;
  bool obscureText = true;
  bool isRememberMeChecked = false;

  changeObscureText() {
    obscureText = !obscureText;
    emit(ChangeObscureState());
  }

  changeCheckedRememberme() {
    isRememberMeChecked = !isRememberMeChecked;
    emit(ChangeObscureState());
  }

  validationLogin() {
    if (!isEmail(email: emailTextEditingController.text) ||
        emailTextEditingController.text.isEmpty) {
      showErrorEmail = true;
      emit(ErorrLoginState());
    } else {
      showErrorEmail = false;
      emit(SuccessLoginState());
    }

    if (passwordTextEditingController.text.isEmpty) {
      showErrorPassword = true;
      emit(ErorrLoginState());
    } else {
      showErrorPassword = false;
      emit(SuccessLoginState());
    }
  }

  bool isEmail({required String email}) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(email);
  }
}
