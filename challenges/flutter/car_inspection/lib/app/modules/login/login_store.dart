import 'dart:core';
import 'dart:io';
import 'package:car_inspection/app/modules/login/model/login_form_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'model/login_form_state.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;
abstract class _LoginStoreBase with Store {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @observable
  String currentEmail = '';
  @observable
  String currentPassword = '';
  @observable
  LoginFormState formState = LoginFormState.idle();

  void signIn() async {
    if (isPasswordValid(currentPassword) && isEmailValid(currentEmail)) {
      doSignIn();
    } else {
      formState = LoginFormState.error();
    }
  }

  Future<void> doSignIn() async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: currentEmail, password: currentPassword
      );
      if (credential != null) {
        navigateToHome();
      }
    } on IOException catch (exception) {
      print("Error" + exception.toString());
    }
  }

  @action
  void onEmailChanged(String email) {
    currentEmail = email;
  }

  @action
  void onPasswordChanged(String password) {
    currentPassword = password;
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
