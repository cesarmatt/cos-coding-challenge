import 'package:car_inspection/app/data/inspection/inspection_service.dart';
import 'package:car_inspection/app/data/model/inspection/inspection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InspectionRemoteDataSource implements InspectionService {
  final _firebaseFirestoreInspectionRef = FirebaseFirestore.instance
      .collection('inspection')
      .withConverter<Inspection>(
          fromFirestore: ((snapshot, _) =>
              Inspection.fromJson(snapshot.data()!)),
          toFirestore: ((inspection, _) => inspection.toJson()));

  @override
  Future<List<Inspection>?> getInspections() async {
    var snapshot = await _firebaseFirestoreInspectionRef
        .get()
        .then((snapshot) => snapshot.docs);
    List<Inspection>? inspections = makeInspectionList(snapshot);
    return inspections;
  }

  @override
  Future<bool> saveInspection(Inspection inspection) async {
    var response = await _firebaseFirestoreInspectionRef.add(inspection);
    return response != null;
  }

  List<Inspection>? makeInspectionList(List<QueryDocumentSnapshot<Inspection>> snapshot) {
    return snapshot.map((inspection) => inspection.data()).toList();
  }
}
