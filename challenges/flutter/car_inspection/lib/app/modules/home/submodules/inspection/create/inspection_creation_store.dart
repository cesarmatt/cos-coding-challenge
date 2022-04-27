import 'package:car_inspection/app/data/inspection/inspection_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../../data/model/inspection/inspection.dart';
import 'package:uuid/uuid.dart';

part 'inspection_creation_store.g.dart';

class InspectionCreationStore = _InspectionCreationStoreBase with _$InspectionCreationStore;

abstract class _InspectionCreationStoreBase with Store {
  final _repository = InspectionRepository();
  final vehicleIdentificationNumberTextEditingController = TextEditingController();
  final vehicleMakeTextEditingController = TextEditingController();
  final vehicleModelTextEditingController = TextEditingController();

  @observable
  DateTime? _selectedDate;

  @observable
  bool isLoading = false;

  @observable
  bool hasFailed = false;

  bool hasSucceeded = false;

  @action
  void onDateSelected(DateRangePickerSelectionChangedArgs args) {
    _selectedDate = args.value as DateTime;
  }

  @action
  Future<void> onCreateClicked() async {
    // FORM VALIDATION
    isLoading = true;
    var response = await _repository.saveInspection(makeInspection());
    if (response) {
      hasSucceeded = true;
      isLoading = false;
      Modular.to.pop();
    } else {
      hasFailed = true;
      isLoading = false;
      Modular.to.pop();
    }
  }

  Inspection makeInspection() {
    return Inspection(
      vehicleId: const Uuid().v4(),
      inspectionDate: Timestamp.fromDate(_selectedDate ?? DateTime.now()),
      vehicleIdentificationNumber: vehicleIdentificationNumberTextEditingController.text,
      vehicleMake: vehicleMakeTextEditingController.text,
      vehicleModel: vehicleModelTextEditingController.text,
    );
  }

}