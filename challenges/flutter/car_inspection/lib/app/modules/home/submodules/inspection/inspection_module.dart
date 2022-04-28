import 'package:car_inspection/app/data/inspection/inspection_remote_data_source.dart';
import 'package:car_inspection/app/data/inspection/inspection_repository.dart';
import 'package:car_inspection/app/modules/home/submodules/inspection/create/inspection_creation_page.dart';
import 'package:car_inspection/app/modules/home/submodules/inspection/inspection_page.dart';
import 'package:car_inspection/app/modules/home/submodules/inspection/inspection_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'create/inspection_creation_store.dart';

class InspectionModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.factory((i) => InspectionRemoteDataSource()),
    Bind.factory((i) => InspectionRepository(remoteDataSource: i.get())),
    Bind.lazySingleton((i) => InspectionStore(inspectionRepository: i.get())),
    Bind.lazySingleton((i) => InspectionCreationStore(repository: i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const InspectionPage()),
    ChildRoute('/create', child: (_, args) => const InspectionCreationPage())
  ];

}