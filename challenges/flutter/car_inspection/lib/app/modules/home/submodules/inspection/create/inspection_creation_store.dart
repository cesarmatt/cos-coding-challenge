import 'package:car_inspection/app/data/inspection/inspection_repository.dart';
import 'package:car_inspection/app/data/model/inspection/inspection.dart';
import 'package:car_inspection/app/utils/imagepicker/image_picker_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uuid/uuid.dart';

part 'inspection_creation_store.g.dart';

class InspectionCreationStore = _InspectionCreationStoreBase
    with _$InspectionCreationStore;

abstract class _InspectionCreationStoreBase with Store {
  _InspectionCreationStoreBase({required this.repository});

  final InspectionRepository repository;
  final _imagePickerUtils = ImagePickerUtils();
  final vehicleIdentificationNumberTextEditingController =
      TextEditingController();
  final vehicleMakeTextEditingController = TextEditingController();
  final vehicleModelTextEditingController = TextEditingController();

  @observable
  DateTime? _selectedDate;

  @observable
  bool isLoading = false;

  @observable
  bool hasFailed = false;

  @observable
  bool hasSucceeded = false;

  @observable
  String? userPreferredUploadMethod;

  @observable
  List<String> selectedPhotosUrl = [];

  @action
  void onDateSelected(DateRangePickerSelectionChangedArgs args) {
    _selectedDate = args.value as DateTime;
  }

  @action
  Future<void> onCreateClicked() async {
    // FORM VALIDATION
    isLoading = true;
    var response = await repository.saveInspection(_makeInspection());
    if (response) {
      isLoading = false;
    } else {
      isLoading = false;
    }
  }

  Inspection _makeInspection() {
    return Inspection(
      vehicleId: const Uuid().v4(),
      inspectionDate: Timestamp.fromDate(_selectedDate ?? DateTime.now()),
      vehicleIdentificationNumber:
          vehicleIdentificationNumberTextEditingController.text,
      vehicleMake: vehicleMakeTextEditingController.text,
      vehicleModel: vehicleModelTextEditingController.text,
      vehiclePhoto: selectedPhotosUrl,
    );
  }

  Future<void> onUploadButtonClicked(BuildContext context) async {
    _imagePickerUtils.showPickerPreferenceDialog(
        context, (uploadMethod) => openSelectedUploadMethod(uploadMethod));
  }

  Future<void> openSelectedUploadMethod(String uploadMethod) async {
    _imagePickerUtils.openSelectedUploadMethod(
        uploadMethod, (photoUrl) => _onPhotoSelected(photoUrl));
  }

  Future<void> _onPhotoSelected(String? photoUrl) async {
    isLoading = true;
    var bucketId = await repository.uploadInspectionPicture(photoUrl ?? '');
    if (bucketId != null) {
      _getUploadedPicture(bucketId);
      isLoading = false;
    } else {
      hasFailed = true;
      isLoading = false;
    }
  }

  @action
  Future<void> _getUploadedPicture(String bucketId) async {
    isLoading = true;
    final uploadedPictureUrl =
        await repository.getInspectionPictureUrl(bucketId);
    if (uploadedPictureUrl != null) {
      selectedPhotosUrl.add(uploadedPictureUrl);
      var newSelectedPhotosUrlValue = selectedPhotosUrl;
      selectedPhotosUrl = newSelectedPhotosUrlValue;
      isLoading = false;
    } else {
      hasFailed = true;
      isLoading = false;
    }
  }

  @action
  Future<void> onDeleteAttachmentClicked(String photoUrl) async {
    isLoading = true;
    selectedPhotosUrl.remove(photoUrl);
    isLoading = false;
  }
}
