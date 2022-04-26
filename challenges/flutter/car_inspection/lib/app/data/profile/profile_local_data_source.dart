import 'package:car_inspection/app/data/local/sharedpreferences/shared_preferences_service.dart';

class ProfileLocalDataSource {
  final SharedPreferencesService _sharedPreferencesService =
  SharedPreferencesService();

  Future<bool> savePreferredUploadMethod(String preferredUploadMethod) async {
    final response = await _sharedPreferencesService
        .savePreferredUploadMethod(preferredUploadMethod);
    return response;
  }

  Future<String> getPreferredUploadMethod() async {
    final response = await _sharedPreferencesService.getPreferredUploadMethod();
    return response ?? '';
  }

  Future<bool> hasPreferredUploadMethod() async {
    final response = await _sharedPreferencesService.hasPreferredUploadMethod();
    return response;
  }
}