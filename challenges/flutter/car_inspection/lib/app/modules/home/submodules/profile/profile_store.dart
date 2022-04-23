import 'package:car_inspection/app/data/local/sharedpreferences/shared_preferences_service.dart';
import 'package:car_inspection/app/data/profile/profile_repository.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/pickerprefferences/picker_prefferences_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:car_inspection/app/data/remote/firebase/firebase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  final firebaseService = FirebaseService();
  final emailTextEditingController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final _repository = ProfileRepository();
  String imagePath = '';
  bool hasPreferredMethod = false;

  @action
  Future<void> onUploadMethodSelected(String preferredUploadMethod) async {
    final response = await _repository.savePreferredUploadMethod(preferredUploadMethod);
    if (response) {
      openSelectedUploadMethod();
    } else {
      print('ERROR');
    }
  }

  Future<bool> hasPreferredUploadMethod() async {
    final response = await _repository.hasPreferredUploadMethod();
    hasPreferredMethod = response;
    return response;
  }

  Future<void> openSelectedUploadMethod() async {
    final uploadMethod = await _repository.getPreferredUploadMethod();
    switch (uploadMethod) {
      case 'camera':
        _picker.pickImage(source: ImageSource.camera);
        break;
      case 'gallery':
        _picker.pickImage(source: ImageSource.gallery);
    }
  }

  @action
  void onEditPasswordClicked() {
    Modular.to.pushNamed('/home/profile/editpassword', forRoot: true);
  }

  @action
  void onLogoutClicked() {
    firebaseService.firebaseAuth
        .signOut()
        .whenComplete(() => Modular.to.navigate('/'));
  }

  void setCurrentUserEmail() {
    emailTextEditingController.text =
        firebaseService.getActiveUser()?.email ?? '';
  }

  void openUploadMethod() {

  }
}
