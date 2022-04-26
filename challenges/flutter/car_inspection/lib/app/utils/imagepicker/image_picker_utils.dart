import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {

  final ImagePicker _picker = ImagePicker();

  Future<XFile?> getImageFromCamera() async {
    return _picker.pickImage(source: ImageSource.camera);
  }

  Future<XFile?> getImageFromGallery() async {
    return _picker.pickImage(source: ImageSource.gallery);
  }
}