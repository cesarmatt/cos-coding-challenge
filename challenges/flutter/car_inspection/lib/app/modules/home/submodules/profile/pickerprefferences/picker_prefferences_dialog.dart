import 'package:car_inspection/app/modules/home/submodules/profile/pickerprefferences/prefered_upload_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PickerPreferencesDialog extends StatelessWidget {
  const PickerPreferencesDialog(
      {Key? key, required this.onUploadMethodSelected})
      : super(key: key);

  final Function(String) onUploadMethodSelected;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Please, select your image preferences'),
      content: const Text('Let us know where do you want to take your photo'),
      actions: <Widget>[
        TextButton(
            onPressed: () => Modular.to.pop(), child: const Text('Cancel')),
        TextButton(
            onPressed: () => {
                  Modular.to.pop(),
                  onUploadMethodSelected(PreferredUploadMethod.gallery.name)
                },
            child: const Text('Gallery')),
        TextButton(
            onPressed: () => {Modular.to.pop(), onUploadMethodSelected(PreferredUploadMethod.camera.name)},
            child: const Text('Camera')),
      ],
    );
  }
}
