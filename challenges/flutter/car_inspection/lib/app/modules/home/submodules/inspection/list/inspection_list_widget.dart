import 'package:flutter/cupertino.dart';

import '../../../../../data/model/inspection/inspection.dart';

class InspectionListWidget extends StatelessWidget {
  const InspectionListWidget(
      {Key? key, required this.onItemPressed, required this.inspections})
      : super(key: key);

  final void Function() onItemPressed;
  final List<Inspection?>? inspections;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: inspections?.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var inspection = inspections?[index];
          return Text(inspection?.vehicleModel ?? '');
        });
  }
}
