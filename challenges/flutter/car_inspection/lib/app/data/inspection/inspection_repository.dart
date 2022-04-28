import 'package:car_inspection/app/data/inspection/inspection_remote_data_source.dart';
import '../model/inspection/inspection.dart';

class InspectionRepository {

  InspectionRepository({required this.remoteDataSource});

  final InspectionRemoteDataSource remoteDataSource;

  Future<List<Inspection>> getInspections() async {
    var response = await remoteDataSource.getInspections();
    return response;
  }

  Future<bool> saveInspection(Inspection inspection) async {
    var response = await remoteDataSource.saveInspection(inspection);
    return response;
  }

  Future<String?> uploadInspectionPicture(String photoUrl) async {
    final response = remoteDataSource.uploadInspectionPicture(photoUrl);
    return response;
  }

  Future<String?> getInspectionPictureUrl(String bucketId) async {
    final response = await remoteDataSource.getInspectionPictureUrl(bucketId);
    return response;
  }
}
