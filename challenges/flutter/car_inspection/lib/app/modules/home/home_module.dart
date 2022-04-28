import 'package:car_inspection/app/modules/home/submodules/inspection/inspection_module.dart';
import 'package:car_inspection/app/modules/home/submodules/inspection/inspection_store.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/profile_module.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/profile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeStore()),
    Bind.singleton((i) => InspectionStore()),
    Bind.singleton((i) => ProfileStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage(), children: [
      ModuleRoute('/inspection', module: InspectionModule()),
      ModuleRoute('/profile', module: ProfileModule()),
    ]),
  ];

}