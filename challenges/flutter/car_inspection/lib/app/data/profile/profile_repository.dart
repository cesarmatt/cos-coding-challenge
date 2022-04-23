import 'package:car_inspection/app/data/local/sharedpreferences/shared_preferences_service.dart';

class ProfileRepository {
  final SharedPreferencesService _service = SharedPreferencesService();

  Future<bool> savePreferredUploadMethod(String preferredUploadMethod) async {
    final response = await _service.savePreferredUploadMethod(preferredUploadMethod);
    return response;
  }

  Future<String> getPreferredUploadMethod() async {
    final response = await _service.getPreferredUploadMethod();
    return response ?? '';
  }

  Future<bool> hasPreferredUploadMethod() async {
    final response = await _service.hasPreferredUploadMethod();
    return response;
  }
}