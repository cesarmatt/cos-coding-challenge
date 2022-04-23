import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {

  Future<bool> savePreferredUploadMethod(String preferredUploadMethod) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final response = await sharedPreferences.setString('preferredUploadMethod', preferredUploadMethod);
    return response;
  }

  Future<String?> getPreferredUploadMethod() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final response = await sharedPreferences.getString('preferredUploadMethod');
    return response;
  }

  Future<bool> hasPreferredUploadMethod() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final uploadMethod = await sharedPreferences.getString('preferredUploadMethod');
    return uploadMethod?.isNotEmpty ?? false;
  }
}
