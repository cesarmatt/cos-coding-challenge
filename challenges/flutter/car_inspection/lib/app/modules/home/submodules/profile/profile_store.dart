import 'package:car_inspection/app/data/profile/profile_repository.dart';
import 'package:car_inspection/app/utils/imagepicker/image_picker_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  _ProfileStoreBase({required this.repository}) {
    loadProfilePageData();
    getUploadPreferredMethod();
  }

  final ImagePickerUtils imagePickerUtils = ImagePickerUtils();
  final ProfileRepository repository;

  @observable
  bool isLoading = true;

  @observable
  bool isError = false;

  @observable
  User? userInfo;

  @observable
  String? userPreferredUploadMethod;

  @observable
  String? userPictureUrl;

  @action
  void loadProfilePageData() {
    isLoading = true;
    var response = repository.getUserInfo();
    if (response != null) {
      userInfo = response;
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }

  @action
  Future<void> getUploadPreferredMethod() async {
    isLoading = true;
    var response = await repository.getPreferredUploadMethod();
    if (response != null) {
      userPreferredUploadMethod = response;
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }

  Future<void> onUploadMethodSelected(String preferredUploadMethod) async {
    final response =
        await repository.savePreferredUploadMethod(preferredUploadMethod);
    if (response) {
      openSelectedUploadMethod();
    } else {
      isError = true;
    }
  }

  Future<void> openSelectedUploadMethod() async {
    switch (userPreferredUploadMethod) {
      case 'camera':
        imagePickerUtils
            .getImageFromCamera()
            .then((file) => updateUserPhoto(file?.path ?? ''));
        break;
      case 'gallery':
        imagePickerUtils
            .getImageFromGallery()
            .then((file) => updateUserPhoto(file?.path ?? ''));
    }
  }

  void onEditPasswordClicked() {
    Modular.to.pushNamed('/home/profile/editpassword', forRoot: true);
  }

  void onLogoutClicked() {
    repository.signOut().whenComplete(() => Modular.to.navigate('/'));
  }

  @action
  Future<void> updateUserPhoto(String photoUrl) async {
    if (photoUrl.isNotEmpty) {
      isLoading = true;
      final updateResponse = await repository.updateUserProfilePicture(
          photoUrl, userInfo?.uid ?? '');
      if (updateResponse?.isNotEmpty == true) {
        userPictureUrl = updateResponse ?? '';
        final response =
            await repository.getUserProfilePictureUrl(userInfo?.uid ?? '');
        if (response?.isNotEmpty == true) {
          loadProfilePageData();
        }
      } else {
        isLoading = false;
      }
    } else {
      isLoading = false;
    }
  }
}
