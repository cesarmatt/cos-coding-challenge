// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditPasswordStore on _EditPasswordStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_EditPasswordStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$hasErrorAtom =
      Atom(name: '_EditPasswordStoreBase.hasError', context: context);

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$_EditPasswordStoreBaseActionController =
      ActionController(name: '_EditPasswordStoreBase', context: context);

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
isLoading: ${isLoading},
hasError: ${hasError}
    ''';
  }
}
