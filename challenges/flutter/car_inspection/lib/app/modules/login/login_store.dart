import 'dart:core';
import 'dart:io';
import 'package:car_inspection/app/modules/login/model/login_form_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'model/login_form_state.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  @observable
  LoginFormState formState = LoginFormState.idle();

  void signIn() async {
    if (isPasswordValid(passwordTextEditingController.text) &&
        isEmailValid(emailTextEditingController.text)) {
      doSignIn();
    } else {
      formState = LoginFormState.error();
    }
  }

  Future<void> doSignIn() async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text);
      if (credential != null) {
        navigateToHome();
      }
    } on IOException catch (exception) {
      print("Error" + exception.toString());
    }
  }

  bool isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool isEmailValid(String email) {
    return email.isNotEmpty;
  }

  void navigateToHome() {
    Modular.to.popAndPushNamed('/home/');
  }
}
