import 'package:car_inspection/app/modules/home/submodules/profile/editpassword/edit_password_page.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/editpassword/edit_password_store.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/profile_page.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/profile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProfileStore()),
    Bind.lazySingleton((i) => EditPasswordStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProfilePage()),
    ChildRoute('/editpassword', child: (_, args) => EditPasswordPage())
  ];
}
