import 'package:car_inspection/app/data/inspection/inspection_remote_data_source.dart';
import '../model/inspection/inspection.dart';

class InspectionRepository {
  final InspectionRemoteDataSource _remoteDataSource =
      InspectionRemoteDataSource();

  Future<List<Inspection>?> getInspections() async {
    var response = await _remoteDataSource.getInspections();
    return response;
  }

  Future<bool> saveInspection(Inspection inspection) async {
    var response = await _remoteDataSource.saveInspection(inspection);
    return response;
  }

  Future<String?> uploadInspectionPicture(String photoUrl) async {
    final response = _remoteDataSource.uploadInspectionPicture(photoUrl);
    return response;
  }

  Future<String?> getInspectionPictureUrl(String inspectionId) async {
    final response = await _remoteDataSource.getInspectionPictureUrl(inspectionId);
    return response;
  }
}
