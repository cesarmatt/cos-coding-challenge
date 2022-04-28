import 'package:car_inspection/app/data/profile/profile_local_data_source.dart';
import 'package:car_inspection/app/data/profile/profile_remote_data_source.dart';
import 'package:car_inspection/app/data/profile/profile_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../utils/firebase_mock.dart';

class ProfileRemoteDataSourceMock extends Mock
    implements ProfileRemoteDataSource {}

class ProfileLocalDataSourceMock extends Mock
    implements ProfileLocalDataSource {}

class UserMock extends Mock implements User {}

void main() {
  setupFirebaseAuthMocks();
  late final ProfileRemoteDataSourceMock remoteDataSourceMock;
  late final ProfileLocalDataSourceMock localDataSourceMock;
  late final UserMock userMock;
  late final ProfileRepository sut;

  setUpAll(() async {
    await Firebase.initializeApp();
    remoteDataSourceMock = ProfileRemoteDataSourceMock();
    localDataSourceMock = ProfileLocalDataSourceMock();
    userMock = UserMock();
    sut = ProfileRepository(
        remoteDataSource: remoteDataSourceMock,
        localDataSource: localDataSourceMock);
  });

  test('When savePreferredUploadMethod succeeds it should return true', () async {
    when(() => localDataSourceMock.savePreferredUploadMethod('preferredUploadMethodTest')).thenAnswer((_) async => true);
    var response = await sut.savePreferredUploadMethod('preferredUploadMethodTest');

    expect(response, true);
  });

  test('When savePreferredUploadMethod fails it should return false', () async {
    when(() => localDataSourceMock.savePreferredUploadMethod('preferredUploadMethodTest')).thenAnswer((_) async => false);
    var response = await sut.savePreferredUploadMethod('preferredUploadMethodTest');

    expect(response, false);
  });

  test('When getPreferredUploadMethod succeeds it should return the preferred upload method', () async {
    when(() => localDataSourceMock.getPreferredUploadMethod()).thenAnswer((_) async => 'preferredUploadMethodTest');
    var response = await sut.getPreferredUploadMethod();

    expect(response, 'preferredUploadMethodTest');
  });

  test('When getPreferredUploadMethod fails it should return an empty string', () async {
    when(() => localDataSourceMock.getPreferredUploadMethod()).thenAnswer((_) async => '');
    var response = await sut.getPreferredUploadMethod();

    expect(response, '');
  });

  test('When hasPreferredUploadMethod succeeds it should return true', () async {
    when(() => localDataSourceMock.hasPreferredUploadMethod()).thenAnswer((_) async => true);
    var response = await sut.hasPreferredUploadMethod();

    expect(response, true);
  });

  test('When hasPreferredUploadMethod fails it should return false', () async {
    when(() => localDataSourceMock.hasPreferredUploadMethod()).thenAnswer((_) async => false);
    var response = await sut.hasPreferredUploadMethod();

    expect(response, false);
  });

  test('When signOut succeeds it should return true', () async {
    when(() => remoteDataSourceMock.signOut()).thenAnswer((_) async => true);
    var response = await sut.signOut();

    expect(response, true);
  });

  test('When signOut fails it should return false', () async {
    when(() => remoteDataSourceMock.signOut()).thenAnswer((_) async => false);
    var response = await sut.signOut();

    expect(response, false);
  });

  test('When getUserInfo succeeds it should return an User', () async {
    when(() => remoteDataSourceMock.getUserInfo()).thenAnswer((_) => userMock);
    var response = sut.getUserInfo();

    expect(response , userMock);
  });

  test('When getUserInfo fails it should return null', () async {
    when(() => remoteDataSourceMock.getUserInfo()).thenAnswer((_) => null);
    var response = sut.getUserInfo();

    expect(response , null);
  });

  test('When updateUserProfilePicture succeeds it should return an the stored photo url', () async {
    when(() => remoteDataSourceMock.updateUserProfilePicture('photoUrlTest', 'userIdTest')).thenAnswer((_) async => 'photoUrlTest');
    var response = await sut.updateUserProfilePicture('photoUrlTest', 'userIdTest');

    expect(response, 'photoUrlTest');
  });

  test('When updateUserProfilePicture fails it should return null', () async {
    when(() => remoteDataSourceMock.updateUserProfilePicture('photoUrlTest', 'userIdTest')).thenAnswer((_) async => null);
    var response = await sut.updateUserProfilePicture('photoUrlTest', 'userIdTest');

    expect(response, null);
  });

  test('When getUserProfilePictureUrl succeeds it should return an the stored photo url', () async {
    when(() => remoteDataSourceMock.getUserProfilePictureUrl('userId')).thenAnswer((_) async => 'storedPhotoUrl');
    var response = await sut.getUserProfilePictureUrl('userId');

    expect(response, 'storedPhotoUrl');
  });

  test('When getUserProfilePictureUrl fails it should return null', () async {
    when(() => remoteDataSourceMock.getUserProfilePictureUrl('userId')).thenAnswer((_) async => null);
    var response = await sut.getUserProfilePictureUrl('userId');

    expect(response, null);
  });

  test('When editPassword succeeds it should return true', () async {
    when(() => remoteDataSourceMock.editPassword('updatedPassword')).thenAnswer((_) async => true);
    var response = await sut.editPassword('updatedPassword');

    expect(response, true);
  });

  test('When editPassword fails it should return false', () async {
    when(() => remoteDataSourceMock.editPassword('updatedPassword')).thenAnswer((_) async => false);
    var response = await sut.editPassword('updatedPassword');

    expect(response, false);
  });
}
