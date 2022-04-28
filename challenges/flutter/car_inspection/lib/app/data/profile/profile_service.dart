import 'package:firebase_auth/firebase_auth.dart';

abstract class ProfileService {
  Future<bool> signOut();
  User? getUserInfo();
  Future<String?> updateUserProfilePicture(String photoUrl, String userId);
  Future<String?> getUserProfilePictureUrl(String userId);
  Future<bool> editPassword(String updatedPassword);
}