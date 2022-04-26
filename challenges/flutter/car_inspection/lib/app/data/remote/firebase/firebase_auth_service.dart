import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? getActiveUser() {
    return firebaseAuth.currentUser;
  }

  void updateUserPhoto(String photoUrl) {
    firebaseAuth.currentUser?.updatePhotoURL(photoUrl);
  }
}