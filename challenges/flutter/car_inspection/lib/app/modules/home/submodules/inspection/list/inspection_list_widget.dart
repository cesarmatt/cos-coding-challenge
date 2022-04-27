import 'package:car_inspection/app/components/loader/primary_loader_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../data/model/inspection/inspection.dart';

// class InspectionListWidget extends StatelessWidget {
//   const InspectionListWidget({
//     Key? key,
//     required this.onItemPressed,
//     required this.inspectionStream})
//       : super(key: key);
//
//   final void Function() onItemPressed;
//   final Stream<QuerySnapshot> inspectionStream;
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//         stream: inspectionStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return const Text('Error');
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const PrimaryLoaderWidget();
//           }
//
//           return ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data = document.data()! as Map<
//                   String,
//                   dynamic>;
//               return Text(data['vehicleMake']);
//             }).toList(),
//           );
//         }
//     );
//   }
// }
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
          print(inspection);
          return Text(inspection?.vehicleModel ?? '');
        });
  }
}
