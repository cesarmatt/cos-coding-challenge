// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_creation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InspectionCreationStore on _InspectionCreationStoreBase, Store {
  late final _$_selectedDateAtom = Atom(
      name: '_InspectionCreationStoreBase._selectedDate', context: context);

  @override
  DateTime? get _selectedDate {
    _$_selectedDateAtom.reportRead();
    return super._selectedDate;
  }

  @override
  set _selectedDate(DateTime? value) {
    _$_selectedDateAtom.reportWrite(value, super._selectedDate, () {
      super._selectedDate = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_InspectionCreationStoreBase.isLoading', context: context);

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

  late final _$hasFailedAtom =
      Atom(name: '_InspectionCreationStoreBase.hasFailed', context: context);

  @override
  bool get hasFailed {
    _$hasFailedAtom.reportRead();
    return super.hasFailed;
  }

  @override
  set hasFailed(bool value) {
    _$hasFailedAtom.reportWrite(value, super.hasFailed, () {
      super.hasFailed = value;
    });
  }

  late final _$hasSucceededAtom =
      Atom(name: '_InspectionCreationStoreBase.hasSucceeded', context: context);

  @override
  bool get hasSucceeded {
    _$hasSucceededAtom.reportRead();
    return super.hasSucceeded;
  }

  @override
  set hasSucceeded(bool value) {
    _$hasSucceededAtom.reportWrite(value, super.hasSucceeded, () {
      super.hasSucceeded = value;
    });
  }

  late final _$userPreferredUploadMethodAtom = Atom(
      name: '_InspectionCreationStoreBase.userPreferredUploadMethod',
      context: context);

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

  late final _$selectedPhotosUrlAtom = Atom(
      name: '_InspectionCreationStoreBase.selectedPhotosUrl', context: context);

  @override
  List<String> get selectedPhotosUrl {
    _$selectedPhotosUrlAtom.reportRead();
    return super.selectedPhotosUrl;
  }

  @override
  set selectedPhotosUrl(List<String> value) {
    _$selectedPhotosUrlAtom.reportWrite(value, super.selectedPhotosUrl, () {
      super.selectedPhotosUrl = value;
    });
  }

  late final _$onCreateClickedAsyncAction = AsyncAction(
      '_InspectionCreationStoreBase.onCreateClicked',
      context: context);

  @override
  Future<void> onCreateClicked() {
    return _$onCreateClickedAsyncAction.run(() => super.onCreateClicked());
  }

  late final _$_getUploadedPictureAsyncAction = AsyncAction(
      '_InspectionCreationStoreBase._getUploadedPicture',
      context: context);

  @override
  Future<void> _getUploadedPicture(String bucketId) {
    return _$_getUploadedPictureAsyncAction
        .run(() => super._getUploadedPicture(bucketId));
  }

  late final _$onDeleteAttachmentClickedAsyncAction = AsyncAction(
      '_InspectionCreationStoreBase.onDeleteAttachmentClicked',
      context: context);

  @override
  Future<void> onDeleteAttachmentClicked(String photoUrl) {
    return _$onDeleteAttachmentClickedAsyncAction
        .run(() => super.onDeleteAttachmentClicked(photoUrl));
  }

  late final _$_InspectionCreationStoreBaseActionController =
      ActionController(name: '_InspectionCreationStoreBase', context: context);

  @override
  void onDateSelected(DateRangePickerSelectionChangedArgs args) {
    final _$actionInfo = _$_InspectionCreationStoreBaseActionController
        .startAction(name: '_InspectionCreationStoreBase.onDateSelected');
    try {
      return super.onDateSelected(args);
    } finally {
      _$_InspectionCreationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasFailed: ${hasFailed},
hasSucceeded: ${hasSucceeded},
userPreferredUploadMethod: ${userPreferredUploadMethod},
selectedPhotosUrl: ${selectedPhotosUrl}
    ''';
  }
}
