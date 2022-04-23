// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditPasswordStore on _EditPasswordStoreBase, Store {
  late final _$editPasswordAsyncAction =
      AsyncAction('_EditPasswordStoreBase.editPassword', context: context);

  @override
  Future<void> editPassword(String updatedPassword) {
    return _$editPasswordAsyncAction
        .run(() => super.editPassword(updatedPassword));
  }

  late final _$_EditPasswordStoreBaseActionController =
      ActionController(name: '_EditPasswordStoreBase', context: context);

  @override
  void onPasswordChanged(String newPassword) {
    final _$actionInfo = _$_EditPasswordStoreBaseActionController.startAction(
        name: '_EditPasswordStoreBase.onPasswordChanged');
    try {
      return super.onPasswordChanged(newPassword);
    } finally {
      _$_EditPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onCancelClicked() {
    final _$actionInfo = _$_EditPasswordStoreBaseActionController.startAction(
        name: '_EditPasswordStoreBase.onCancelClicked');
    try {
      return super.onCancelClicked();
    } finally {
      _$_EditPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSaveClicked() {
    final _$actionInfo = _$_EditPasswordStoreBaseActionController.startAction(
        name: '_EditPasswordStoreBase.onSaveClicked');
    try {
      return super.onSaveClicked();
    } finally {
      _$_EditPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
