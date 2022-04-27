import 'package:car_inspection/app/data/model/inspection/inspection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class InspectionService {
  Future<List<Inspection>?> getInspections();
  Future<bool> saveInspection(Inspection inspection);
  Stream<QuerySnapshot<Map<String, dynamic>>> getInspectionsStream();
}