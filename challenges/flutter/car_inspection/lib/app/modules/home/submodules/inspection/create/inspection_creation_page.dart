import 'package:car_inspection/app/components/button/primary_button_widget.dart';
import 'package:car_inspection/app/components/input/primary_text_input_widget.dart';
import 'package:car_inspection/app/components/loader/primary_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'components/uploadedimage/uploaded_image_list_widget.dart';
import 'inspection_creation_store.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create new inspection'),
          actions: [
            IconButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')));
                    await store.onCreateClicked();
                    Modular.to.pop();
                  }
                },
                icon: const Icon(Icons.check))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
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
                        onSelectionChanged: (args) =>
                            store.onDateSelected(args),
                        selectionMode: DateRangePickerSelectionMode.single,
                        initialSelectedDate: DateTime.now(),
                        maxDate: DateTime.now(),
                        selectionColor: const Color(0xFFffd452),
                        todayHighlightColor: const Color(0xFFffd452),
                      ),
                    ],
                  ),
                  PrimaryTextInputWidget(
                    inputTextEditingController:
                        store.vehicleIdentificationNumberTextEditingController,
                    hint: 'Vehicle Identification Number',
                    formValidation: (value) {
                      _vehicleIdentificationNumberValidator(value);
                    },
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
                  const SizedBox(height: 12),
                  Column(
                    children: <Widget>[
                      PrimaryButtonWidget(
                        width: double.infinity,
                        onPressed: () {
                          store.onUploadButtonClicked(context);
                        },
                        child: const Text("Upload photo"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Observer(builder: (_) {
                        if (store.isLoading) {
                          return const PrimaryLoaderWidget();
                        } else {
                          return UploadedImageListWidget(
                            selectedPhotosUrl: store.selectedPhotosUrl,
                            onDeleteClicked: (url) {
                              store.onDeleteAttachmentClicked(url);
                            },
                          );
                        }
                      })
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
  
  String? _vehicleIdentificationNumberValidator(String? value) {
    if (value?.contains('I') == true ||
        value?.contains('O') == true ||
        value?.contains('U') == true) {
      return 'Your VIN should not contain I, O or U';
    }
    return null;
  }
}
