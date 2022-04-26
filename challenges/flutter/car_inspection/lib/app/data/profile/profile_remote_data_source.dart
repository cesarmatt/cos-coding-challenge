import 'package:car_inspection/app/data/remote/firebase/firebase_auth_service.dart';
import 'package:car_inspection/app/data/remote/firebase/firebase_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRemoteDataSource {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final FirebaseStorageService _firebaseStorageService =
      FirebaseStorageService();

  Future<bool> signOut() async {
    var hasLoggedOut = false;
    await _firebaseAuthService.firebaseAuth
        .signOut()
        .whenComplete(() => hasLoggedOut = true);
    return hasLoggedOut;
  }

  User? getUserInfo() {
    return _firebaseAuthService.getActiveUser();
  }

  Future<bool> updateUserProfilePicture(String photoUrl, String userId) async {
    final response =
        await _firebaseStorageService.saveUserProfilePicture(photoUrl, userId);
    if (response) {
      final storedPhotoUrl =
          await _firebaseStorageService.getUserProfilePictureUrl(userId);
      _firebaseAuthService.updateUserPhoto(storedPhotoUrl ?? '');
      return true;
    } else {
      return false;
    }
  }

  Future<String> getUserProfilePictureUrl(String userId) async {
    final response =
        await _firebaseStorageService.getUserProfilePictureUrl(userId);
    if (response != null) {
      if (response.isNotEmpty) {
        return response;
      }
    } else {
      return '';
    }

    return '';
  }
}
