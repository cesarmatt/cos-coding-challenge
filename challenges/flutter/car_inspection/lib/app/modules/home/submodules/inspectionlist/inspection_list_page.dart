import 'package:car_inspection/app/modules/home/submodules/inspectionlist/inspection_list_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InspectionListPage extends StatefulWidget {
  final String title;

  const InspectionListPage({Key? key, this.title = 'InspectionListPage'}) : super(key: key);

  @override
  InspectionListPageState createState() => InspectionListPageState();
}

class InspectionListPageState extends State<InspectionListPage> {

  final InspectionListStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Inspection'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [Text("InspectionList")],
      ),
    );
  }

}