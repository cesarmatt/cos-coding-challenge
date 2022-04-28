// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ProfileStoreBase.isLoading', context: context);

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

  late final _$isErrorAtom =
      Atom(name: '_ProfileStoreBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$userInfoAtom =
      Atom(name: '_ProfileStoreBase.userInfo', context: context);

  @override
  User? get userInfo {
    _$userInfoAtom.reportRead();
    return super.userInfo;
  }

  @override
  set userInfo(User? value) {
    _$userInfoAtom.reportWrite(value, super.userInfo, () {
      super.userInfo = value;
    });
  }

  late final _$userPreferredUploadMethodAtom = Atom(
      name: '_ProfileStoreBase.userPreferredUploadMethod', context: context);

  @override
  String? get userPreferredUploadMethod {
    _$userPreferredUploadMethodAtom.reportRead();
    return super.userPreferredUploadMethod;
  }

  @override
  set userPreferredUploadMethod(String? value) {
    _$userPreferredUploadMethodAtom
        .reportWrite(value, super.userPreferredUploadMethod, () {
      super.userPreferredUploadMethod = value;
    });
  }

  late final _$userPictureUrlAtom =
      Atom(name: '_ProfileStoreBase.userPictureUrl', context: context);

  @override
  String? get userPictureUrl {
    _$userPictureUrlAtom.reportRead();
    return super.userPictureUrl;
  }

  @override
  set userPictureUrl(String? value) {
    _$userPictureUrlAtom.reportWrite(value, super.userPictureUrl, () {
      super.userPictureUrl = value;
    });
  }

  late final _$getUploadPreferredMethodAsyncAction = AsyncAction(
      '_ProfileStoreBase.getUploadPreferredMethod',
      context: context);

  @override
  Future<void> getUploadPreferredMethod() {
    return _$getUploadPreferredMethodAsyncAction
        .run(() => super.getUploadPreferredMethod());
  }

  late final _$updateUserPhotoAsyncAction =
      AsyncAction('_ProfileStoreBase.updateUserPhoto', context: context);

  @override
  Future<void> updateUserPhoto(String photoUrl) {
    return _$updateUserPhotoAsyncAction
        .run(() => super.updateUserPhoto(photoUrl));
  }

  late final _$_ProfileStoreBaseActionController =
      ActionController(name: '_ProfileStoreBase', context: context);

  @override
  void loadProfilePageData() {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
        name: '_ProfileStoreBase.loadProfilePageData');
    try {
      return super.loadProfilePageData();
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
userInfo: ${userInfo},
userPreferredUploadMethod: ${userPreferredUploadMethod},
userPictureUrl: ${userPictureUrl}
    ''';
  }
}
