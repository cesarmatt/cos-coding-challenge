import 'package:car_inspection/app/data/profile/profile_local_data_source.dart';
import 'package:car_inspection/app/data/profile/profile_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource = ProfileRemoteDataSource();
  final ProfileLocalDataSource _localDataSource = ProfileLocalDataSource();

  Future<bool> savePreferredUploadMethod(String preferredUploadMethod) async {
    final response =
        await _localDataSource.savePreferredUploadMethod(preferredUploadMethod);
    return response;
  }

  Future<String> getPreferredUploadMethod() async {
    final response = await _localDataSource.getPreferredUploadMethod();
    return response;
  }

  Future<bool> hasPreferredUploadMethod() async {
    final response = await _localDataSource.hasPreferredUploadMethod();
    return response;
  }

  Future<bool> signOut() async {
    final response = await _remoteDataSource.signOut();
    return response;
  }

  User? getUserInfo() {
    final response = _remoteDataSource.getUserInfo();
    return response;
  }

  Future<bool> updateUserProfilePicture(String photoUrl, String userId) async {
    final response =
        _remoteDataSource.updateUserProfilePicture(photoUrl, userId);
    return response;
  }

  Future<String> getUserProfilePictureUrl(String userId) async {
    final response = await _remoteDataSource.getUserProfilePictureUrl(userId);
    return response;
  }
}
