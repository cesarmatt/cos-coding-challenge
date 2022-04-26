import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final firebaseStorage = FirebaseStorage.instance;

  Future<bool> saveUserProfilePicture(String photoUrl, String userId) async {
    final storageRef = firebaseStorage.ref();
    final pictureRef =
        storageRef.child('user/$userId/profilepicture');
    final file = File(photoUrl);
    try {
      await pictureRef.putFile(file);
      return true;
    } on FirebaseException catch (exception) {
      return false;
    }
  }

  Future<String?> getUserProfilePictureUrl(String userId) async {
    final storageRef = firebaseStorage.ref();
    try {
      final imageUrl = await storageRef
          .child('user/$userId/profilepicture')
          .getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (exception) {
      return null;
    }
  }
}
