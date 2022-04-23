// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  late final _$formStateAtom =
      Atom(name: '_LoginStoreBase.formState', context: context);

  @override
  LoginFormState get formState {
    _$formStateAtom.reportRead();
    return super.formState;
  }

  @override
  set formState(LoginFormState value) {
    _$formStateAtom.reportWrite(value, super.formState, () {
      super.formState = value;
    });
  }

  @override
  String toString() {
    return '''
formState: ${formState}
    ''';
  }
}
