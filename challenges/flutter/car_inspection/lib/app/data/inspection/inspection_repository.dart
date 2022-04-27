import 'package:car_inspection/app/data/inspection/inspection_remote_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/inspection/inspection.dart';

class InspectionRepository {
  final InspectionRemoteDataSource _remoteDataSource = InspectionRemoteDataSource();

  Future<List<Inspection>?> getInspections() async {
    var response = await _remoteDataSource.getInspections();
    return response;
  }

  Future<bool> saveInspection(Inspection inspection) async {
    var response = await _remoteDataSource.saveInspection(inspection);
    return response;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getInspectionsStream() {
    return _remoteDataSource.getInspectionsStream();
  }
}