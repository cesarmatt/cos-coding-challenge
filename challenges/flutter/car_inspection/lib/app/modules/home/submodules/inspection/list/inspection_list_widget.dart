import 'package:car_inspection/app/modules/home/submodules/inspection/list/item/inspection_list_item_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../data/model/inspection/inspection.dart';

class InspectionListWidget extends StatelessWidget {
  const InspectionListWidget(
      {Key? key, required this.onItemPressed, required this.inspections})
      : super(key: key);

  final void Function(String) onItemPressed;
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
          // print(inspection);
          return InspectionListItemWidget(
              inspection: inspection, onCardClicked: onItemPressed);
        });
  }
}
