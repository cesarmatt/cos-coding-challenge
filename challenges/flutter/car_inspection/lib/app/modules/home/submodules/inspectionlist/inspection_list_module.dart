import 'package:car_inspection/app/modules/home/submodules/inspectionlist/inspection_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InspectionListModule extends Module {

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => InspectionListPage()),
  ];

}