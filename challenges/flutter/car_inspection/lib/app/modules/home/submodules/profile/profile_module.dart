import 'package:car_inspection/app/data/profile/profile_local_data_source.dart';
import 'package:car_inspection/app/data/profile/profile_remote_data_source.dart';
import 'package:car_inspection/app/data/profile/profile_repository.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/editpassword/edit_password_page.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/editpassword/edit_password_store.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/profile_page.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/profile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => ProfileRemoteDataSource()),
    Bind.factory((i) => ProfileLocalDataSource()),
    Bind.factory((i) =>
        ProfileRepository(remoteDataSource: i.get(), localDataSource: i.get())),
    Bind.lazySingleton((i) => ProfileStore(repository: i.get())),
    Bind.lazySingleton((i) => EditPasswordStore(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProfilePage()),
    ChildRoute('/editpassword', child: (_, args) => EditPasswordPage())
  ];
}
