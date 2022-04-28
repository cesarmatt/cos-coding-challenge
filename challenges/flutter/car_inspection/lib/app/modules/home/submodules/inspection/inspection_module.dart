import 'package:car_inspection/app/modules/home/submodules/inspection/create/inspection_creation_page.dart';
import 'package:car_inspection/app/modules/home/submodules/inspection/inspection_page.dart';
import 'package:car_inspection/app/modules/home/submodules/inspection/inspection_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'create/inspection_creation_store.dart';

class InspectionModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => InspectionStore()),
    Bind.lazySingleton((i) => InspectionCreationStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const InspectionPage()),
    ChildRoute('/create', child: (_, args) => const InspectionCreationPage())
  ];

}