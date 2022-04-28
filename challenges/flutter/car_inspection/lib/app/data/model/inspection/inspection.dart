import 'package:cloud_firestore/cloud_firestore.dart';

class Inspection {
  Inspection({
    required this.vehicleId,
    required this.inspectionDate,
    required this.vehicleIdentificationNumber,
    this.vehicleMake,
    this.vehicleModel,
    this.vehiclePhoto
  });

  String? vehicleId = '';
  Timestamp? inspectionDate = Timestamp.now();
  String? vehicleIdentificationNumber = '';
  String? vehicleMake = '';
  String? vehicleModel = '';
  List<dynamic>? vehiclePhoto;

  Inspection.fromJson(Map<String, Object?> json)
      : this(
          vehicleId: json['vehicleId']! as String,
          inspectionDate: json['inspectionDate']! as Timestamp,
          vehicleIdentificationNumber:
              json['vehicleIdentificationNumber']! as String,
          vehicleMake: json['vehicleMake'] as String,
          vehicleModel: json['vehicleModel'] as String,
          vehiclePhoto: json['vehiclePhoto'] as List<dynamic>?,
        );

  Map<String, Object?> toJson() {
    return {
      'vehicleId': vehicleId,
      'inspectionDate': inspectionDate,
      'vehicleIdentificationNumber': vehicleIdentificationNumber,
      'vehicleMake': vehicleMake,
      'vehicleModel': vehicleModel,
      'vehiclePhoto': vehiclePhoto,
    };
  }
}
