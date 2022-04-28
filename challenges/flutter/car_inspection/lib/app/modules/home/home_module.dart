import 'package:car_inspection/app/data/inspection/inspection_remote_data_source.dart';
import 'package:car_inspection/app/data/inspection/inspection_repository.dart';
import 'package:car_inspection/app/data/profile/profile_repository.dart';
import 'package:car_inspection/app/modules/home/submodules/inspection/inspection_module.dart';
import 'package:car_inspection/app/modules/home/submodules/inspection/inspection_store.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/profile_module.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/profile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/profile/profile_local_data_source.dart';
import '../../data/profile/profile_remote_data_source.dart';
import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.factory((i) => ProfileRemoteDataSource()),
    Bind.factory((i) => ProfileLocalDataSource()),
    Bind.factory((i) =>
        ProfileRepository(remoteDataSource: i.get(), localDataSource: i.get())),
    Bind.factory((i) => InspectionRemoteDataSource()),
    Bind.factory((i) => InspectionRepository(remoteDataSource: i.get())),
    Bind.singleton((i) => HomeStore()),
    Bind.singleton((i) => InspectionStore(inspectionRepository: i.get())),
    Bind.singleton((i) => ProfileStore(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage(), children: [
      ModuleRoute('/inspection', module: InspectionModule()),
      ModuleRoute('/profile', module: ProfileModule()),
    ]),
  ];

}