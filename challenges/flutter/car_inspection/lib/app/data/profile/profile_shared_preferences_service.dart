abstract class ProfileSharedPreferencesService {
  Future<bool> savePreferredUploadMethod(String preferredUploadMethod);
  Future<String> getPreferredUploadMethod();
  Future<bool> hasPreferredUploadMethod();
}