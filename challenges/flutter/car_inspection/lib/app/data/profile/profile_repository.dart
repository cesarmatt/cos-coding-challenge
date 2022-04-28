import 'package:car_inspection/app/data/profile/profile_local_data_source.dart';
import 'package:car_inspection/app/data/profile/profile_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepository {
  ProfileRepository(
      {required this.remoteDataSource, required this.localDataSource});

  final ProfileRemoteDataSource remoteDataSource;

  final ProfileLocalDataSource localDataSource;

  Future<bool> savePreferredUploadMethod(String preferredUploadMethod) async {
    final response =
        await localDataSource.savePreferredUploadMethod(preferredUploadMethod);
    return response;
  }

  Future<String> getPreferredUploadMethod() async {
    final response = await localDataSource.getPreferredUploadMethod();
    return response;
  }

  Future<bool> hasPreferredUploadMethod() async {
    final response = await localDataSource.hasPreferredUploadMethod();
    return response;
  }

  Future<bool> signOut() async {
    final response = await remoteDataSource.signOut();
    return response;
  }

  User? getUserInfo() {
    final response = remoteDataSource.getUserInfo();
    return response;
  }

  Future<String?> updateUserProfilePicture(String photoUrl, String userId) async {
    final response =
        remoteDataSource.updateUserProfilePicture(photoUrl, userId);
    return response;
  }

  Future<String?> getUserProfilePictureUrl(String userId) async {
    final response = await remoteDataSource.getUserProfilePictureUrl(userId);
    return response;
  }

  Future<bool> editPassword(String updatedPassword) async {
    final response = await remoteDataSource.editPassword(updatedPassword);
    return response;
  }
}
