import 'package:car_inspection/app/data/inspection/inspection_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../data/model/inspection/inspection.dart';

part 'inspection_store.g.dart';

class InspectionStore = _InspectionStoreBase with _$InspectionStore;

abstract class _InspectionStoreBase with Store {
  final InspectionRepository _inspectionRepository = InspectionRepository();

  @observable
  bool isLoading = true;

  @observable
  bool isError = false;

  @observable
  List<Inspection?>? inspections;

  @action
  Future<void> getInspections() async {
    isLoading = true;
    var response = await _inspectionRepository.getInspections();
    if (response != null) {
      inspections = response;
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }

}
