import 'package:car_inspection/app/data/profile/profile_shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileLocalDataSource implements ProfileSharedPreferencesService {

  @override
  Future<bool> savePreferredUploadMethod(String preferredUploadMethod) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final response = await sharedPreferences.setString('preferredUploadMethod', preferredUploadMethod);
    return response;
  }

  @override
  Future<String> getPreferredUploadMethod() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final response = await sharedPreferences.getString('preferredUploadMethod');
    return response ?? '';
  }

  @override
  Future<bool> hasPreferredUploadMethod() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final response = await sharedPreferences.getString('preferredUploadMethod');
    return response != null;
  }
}