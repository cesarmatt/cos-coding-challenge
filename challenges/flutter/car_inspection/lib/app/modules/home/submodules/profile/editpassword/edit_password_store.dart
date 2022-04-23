import 'package:car_inspection/app/data/remote/firebase/firebase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'edit_password_store.g.dart';

class EditPasswordStore = _EditPasswordStoreBase with _$EditPasswordStore;

abstract class _EditPasswordStoreBase with Store {
  final firebaseAuthService = FirebaseService().firebaseAuth;
  final currentPasswordTextEditingController = TextEditingController();
  final newPasswordTextEditingController = TextEditingController();
  final confirmNewPasswordTextEditingController = TextEditingController();

  @action
  Future<void> editPassword(String updatedPassword) async {
    await firebaseAuthService.currentUser?.updatePassword(updatedPassword);
    Modular.to.pop();
  }

  @action
  void onPasswordChanged(String newPassword) {
    newPasswordTextEditingController.text = newPassword;
  }

  @action
  void onCancelClicked() {
    Modular.to.pop();
  }

  @action
  void onSaveClicked() {
    if (canSavePassword()) {
      firebaseAuthService.currentUser
          ?.updatePassword(newPasswordTextEditingController.text);
    } else {
      print('ERROR!');
    }
  }

  bool canSavePassword() {
    return inputFieldsAreNotEmpty() && inputFieldsAreTheSame();
  }

  bool inputFieldsAreNotEmpty() {
    return newPasswordTextEditingController.text.isNotEmpty &&
        confirmNewPasswordTextEditingController.text.isNotEmpty;
  }

  bool inputFieldsAreTheSame() {
    return newPasswordTextEditingController.text ==
        confirmNewPasswordTextEditingController.text;
  }
}
