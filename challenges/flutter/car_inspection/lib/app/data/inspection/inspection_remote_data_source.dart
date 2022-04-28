import 'dart:io';

import 'package:car_inspection/app/data/inspection/inspection_service.dart';
import 'package:car_inspection/app/data/model/inspection/inspection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class InspectionRemoteDataSource implements InspectionService {
  final _firebaseStorage = FirebaseStorage.instance;
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

  List<Inspection>? makeInspectionList(
      List<QueryDocumentSnapshot<Inspection>> snapshot) {
    return snapshot.map((inspection) => inspection.data()).toList();
  }

  @override
  Future<String?> uploadInspectionPicture(String photoUrl) async {
    final storageRef = _firebaseStorage.ref();
    final bucketId = const Uuid().v4();
    final pictureRef = storageRef.child('/inspection/carpicture/$bucketId');
    final file = File(photoUrl);
    try {
      await pictureRef.putFile(file);
      return bucketId;
    } on FirebaseException catch (exception) {
      return null;
    }
  }

  Future<String?> getInspectionPictureUrl(String bucketId) async {
    final storageRef = _firebaseStorage.ref();
    try {
      final imageUrl = await storageRef.child(
          '/inspection/carpicture/$bucketId')
          .getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (exception) {
      return null;
    }
  }
}
