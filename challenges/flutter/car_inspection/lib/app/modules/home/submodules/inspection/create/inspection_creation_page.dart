import 'package:car_inspection/app/components/input/primary_text_input_widget.dart';
import 'package:car_inspection/app/modules/home/submodules/inspection/create/inspection_creation_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class InspectionCreationPage extends StatefulWidget {
  final String title;

  const InspectionCreationPage(
      {Key? key, this.title = "InspectionCreationPage"})
      : super(key: key);

  @override
  InspectionCreationPageState createState() => InspectionCreationPageState();
}

class InspectionCreationPageState extends State<InspectionCreationPage> {
  final InspectionCreationStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new inspection'),
        actions: [
          IconButton(
              onPressed: () {
                store.onCreateClicked();
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Center(
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select inspection date',
                      style: textTheme.bodyText1?.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SfDateRangePicker(
                      onSelectionChanged: (args) => store.onDateSelected(args),
                      selectionMode: DateRangePickerSelectionMode.single,
                      initialSelectedDate: DateTime.now(),
                      maxDate: DateTime.now(),
                      selectionColor: const Color(0xFFffd452),
                      todayHighlightColor: const Color(0xFFffd452),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                PrimaryTextInputWidget(
                  inputTextEditingController:
                      store.vehicleIdentificationNumberTextEditingController,
                  hint: 'Vehicle Identification Number',
                ),
                const SizedBox(height: 12),
                PrimaryTextInputWidget(
                  inputTextEditingController:
                      store.vehicleMakeTextEditingController,
                  hint: 'Vehicle Make',
                ),
                const SizedBox(height: 12),
                PrimaryTextInputWidget(
                  inputTextEditingController:
                      store.vehicleModelTextEditingController,
                  hint: 'Vehicle Model',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
