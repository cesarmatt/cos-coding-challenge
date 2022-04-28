import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../../../data/profile/profile_repository.dart';

part 'edit_password_store.g.dart';

class EditPasswordStore = _EditPasswordStoreBase with _$EditPasswordStore;

abstract class _EditPasswordStoreBase with Store {
  final ProfileRepository _repository = ProfileRepository();
  final currentPasswordTextEditingController = TextEditingController();
  final newPasswordTextEditingController = TextEditingController();
  final confirmNewPasswordTextEditingController = TextEditingController();

  @observable
  bool isLoading = false;

  @observable
  bool hasError = false;

  Future<void> editPassword(String updatedPassword) async {
    isLoading = true;
    final response = await _repository.editPassword(updatedPassword);
    if (response) {
      isLoading = false;
      Modular.to.pop();
    } else {
      hasError = true;
      isLoading = false;
    }
  }

  @action
  void onCancelClicked() {
    Modular.to.pop();
  }

  @action
  void onSaveClicked() {
    if (canSavePassword()) {
      editPassword(newPasswordTextEditingController.text);
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
