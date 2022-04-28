import 'package:car_inspection/app/data/model/inspection/inspection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InspectionListItemWidget extends StatelessWidget {
  const InspectionListItemWidget(
      {Key? key, required this.inspection, required this.onCardClicked})
      : super(key: key);

  final Inspection? inspection;
  final Function(String) onCardClicked;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Card(
        elevation: 5,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.network(
                inspection?.vehiclePhoto?.first ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFTSjmJEW7I8Ax8_JZ3ZuzcQO1LJW1XMjVSDQx2PhkUcRrJ7-Uy9faH2Vnbdcm4JsEc98&usqp=CAU',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    '${inspection?.vehicleIdentificationNumber}',
                  style: textTheme.bodyText1?.copyWith(
                    fontSize: 16,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text('${inspection?.vehicleMake}'),
                    const SizedBox(height: 4),
                    Text('${inspection?.vehicleModel}'),
                    const SizedBox(height: 4),
                    Text(
                      formatDate(inspection?.inspectionDate),
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }

  String formatDate(Timestamp? timestamp) {
    var inspectionDateAsDate = timestamp?.toDate();
    return '${inspectionDateAsDate?.month}/${inspectionDateAsDate?.day}/${inspectionDateAsDate?.year}';
  }
}
