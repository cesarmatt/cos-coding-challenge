import 'package:car_inspection/app/data/model/inspection/inspection.dart';

abstract class InspectionService {
  Future<List<Inspection>?> getInspections();
  Future<bool> saveInspection(Inspection inspection);
  Future<String?> uploadInspectionPicture(String photoUrl);
  Future<String?> getInspectionPictureUrl(String inspectionId);
}