import 'dart:io';
import 'package:car_inspection/app/data/profile/profile_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileRemoteDataSource implements ProfileService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<bool> signOut() async {
    var hasLoggedOut = false;
    await _firebaseAuth
        .signOut()
        .whenComplete(() => hasLoggedOut = true);
    return hasLoggedOut;
  }

  @override
  User? getUserInfo() {
    return _firebaseAuth.currentUser;
  }

  @override
  Future<String?> updateUserProfilePicture(String photoUrl, String userId) async {
    final response =
        await saveUserProfilePicture(photoUrl, userId);
    if (response) {
      final storedPhotoUrl =
          await getUserProfilePictureUrl(userId);
      _firebaseAuth.currentUser?.updatePhotoURL(photoUrl);
      return storedPhotoUrl;
    } else {
      return null;
    }
  }

  Future<bool> saveUserProfilePicture(String photoUrl, String userId) async {
    final storageRef = _firebaseStorage.ref();
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

  @override
  Future<String?> getUserProfilePictureUrl(String userId) async {
    final storageRef = _firebaseStorage.ref();
    try {
      final imageUrl = await storageRef
          .child('user/$userId/profilepicture')
          .getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (exception) {
      return null;
    }
  }

  @override
  Future<bool> editPassword(String updatedPassword) async {
    try {
      await _firebaseAuth.currentUser?.updatePassword(updatedPassword);
      return true;
    } on FirebaseException catch (exception) {
      return false;
    }
  }
}
