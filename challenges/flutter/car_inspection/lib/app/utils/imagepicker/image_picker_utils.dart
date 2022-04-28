import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../modules/home/submodules/profile/pickerprefferences/picker_prefferences_dialog.dart';

class ImagePickerUtils {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> getImageFromCamera() async {
    return _picker.pickImage(source: ImageSource.camera);
  }

  Future<XFile?> getImageFromGallery() async {
    return _picker.pickImage(source: ImageSource.gallery);
  }

  void showPickerPreferenceDialog(
      BuildContext context, Function(String) onUploadMethodSelected) {
    showDialog(
      context: context,
      builder: (BuildContext context) => PickerPreferencesDialog(
        onUploadMethodSelected: (uploadMethod) {
          onUploadMethodSelected(uploadMethod);
        },
      ),
    );
  }

  Future<void> openSelectedUploadMethod(
      String? preferredUploadMethod, Function(String) onImagePicked) async {
    switch (preferredUploadMethod) {
      case 'camera':
        getImageFromCamera().then((file) => onImagePicked(file?.path ?? ''));
        break;
      case 'gallery':
        getImageFromGallery().then((file) => onImagePicked(file?.path ?? ''));
        break;
    }
  }
}
