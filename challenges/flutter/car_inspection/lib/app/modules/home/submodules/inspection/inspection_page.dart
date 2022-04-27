import 'package:car_inspection/app/components/loader/primary_loader_widget.dart';
import 'package:car_inspection/app/modules/home/submodules/inspection/inspection_store.dart';
import 'package:car_inspection/app/modules/home/submodules/inspection/list/inspection_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InspectionPage extends StatefulWidget {
  final String title;

  const InspectionPage({Key? key, this.title = 'InspectionListPage'})
      : super(key: key);

  @override
  InspectionPageState createState() => InspectionPageState();
}

class InspectionPageState extends State<InspectionPage> {
  final InspectionStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.getInspections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Inspection'),
        automaticallyImplyLeading: false,
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return PrimaryLoaderWidget();
          } else {
            return InspectionListWidget(
              onItemPressed: () {
                print("clicked!");
              },
              inspections: store.inspections,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
