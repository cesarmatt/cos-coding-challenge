import 'package:car_inspection/app/modules/home/submodules/inspection/inspection_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InspectionModule extends Module {

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => InspectionPage()),
  ];

}