import 'package:car_inspection/app/data/inspection/inspection_remote_data_source.dart';
import 'package:car_inspection/app/data/inspection/inspection_repository.dart';
import 'package:car_inspection/app/data/model/inspection/inspection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../utils/firebase_mock.dart';

class InspectionRemoteDataSourceMock extends Mock implements InspectionRemoteDataSource {}

final mockInspection = Inspection(
  vehicleId: 'testId',
  inspectionDate: Timestamp.now(),
  vehicleIdentificationNumber: 'A1E2M3H4J5K6',
  vehicleMake: 'Vehicle Make Test',
  vehicleModel: 'Vehicle Model Test',
  vehiclePhoto: ['www.testphoto.com'],
);

void main() {
  setupFirebaseAuthMocks();
  late final InspectionRemoteDataSourceMock remoteDataSourceMock;
  late final InspectionRepository sut;

  setUpAll(() async {
    await Firebase.initializeApp();
    remoteDataSourceMock = InspectionRemoteDataSourceMock();
    sut = InspectionRepository(remoteDataSource: remoteDataSourceMock);
  });

  test('When getInspection succeeds it should return a List with inspections', () async {
    when(() => remoteDataSourceMock.getInspections()).thenAnswer((_) async => <Inspection>[mockInspection]);
    var response = await sut.getInspections();

    expect(response, [mockInspection]);
  });

  test('When getInspection fails it should return an empty list', () async {
    when(() => remoteDataSourceMock.getInspections()).thenAnswer((_) async => <Inspection>[]);
    var response = await sut.getInspections();

    expect(response, []);
  });

  test('When saveInspection succeeds it should return true', () async {
    when(() => remoteDataSourceMock.saveInspection(mockInspection)).thenAnswer((_) async => true);
    var response = await sut.saveInspection(mockInspection);

    expect(response, true);
  });

  test('When saveInspection fails it should return false', () async {
    when(() => remoteDataSourceMock.saveInspection(mockInspection)).thenAnswer((_) async => false);
    var response = await sut.saveInspection(mockInspection);

    expect(response, false);
  });

  test('When uploadInspectionPicture succeeds it should return the bucket id for the uploaded image', () async {
    when(() => remoteDataSourceMock.uploadInspectionPicture("www.photourltest.com")).thenAnswer((_) async => 'bucketIdTest');
    var response = await sut.uploadInspectionPicture("www.photourltest.com");

    expect(response, 'bucketIdTest');
  });

  test('When uploadInspectionPicture fails it should return null', () async {
    when(() => remoteDataSourceMock.uploadInspectionPicture("www.photourltest.com")).thenAnswer((_) async => null);
    var response = await sut.uploadInspectionPicture("www.photourltest.com");

    expect(response, null);
  });

  test('When getInspectionPictureUrl succeeds it should return the uploaded picture url', () async {
    when(() => remoteDataSourceMock.getInspectionPictureUrl('bucketIdTest')).thenAnswer((_) async => "www.photourltest.com");
    var response = await sut.getInspectionPictureUrl('bucketIdTest');

    expect(response, "www.photourltest.com");
  });

  test('When getInspectionPictureUrl fails it should return null', () async {
    when(() => remoteDataSourceMock.getInspectionPictureUrl('bucketIdTest')).thenAnswer((_) async => null);
    var response = await sut.getInspectionPictureUrl('bucketIdTest');

    expect(response, null);
  });
}