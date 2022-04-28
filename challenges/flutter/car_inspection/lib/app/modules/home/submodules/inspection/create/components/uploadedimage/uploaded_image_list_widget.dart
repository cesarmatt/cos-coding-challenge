import 'package:flutter/material.dart';

import 'item/uploaded_image_item_widget.dart';


class UploadedImageListWidget extends StatelessWidget {
  const UploadedImageListWidget({Key? key, required this.selectedPhotosUrl, required this.onDeleteClicked}) : super(key: key);

  final List<String>? selectedPhotosUrl;
  final Function(String) onDeleteClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 1,
        child: ListView.builder(
            itemCount: selectedPhotosUrl?.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              if (selectedPhotosUrl?.isNotEmpty == true) {
                var selectedPhotoUrl = selectedPhotosUrl?[index];
                return UploadedImageItemWidget(
                    selectedPhotoUrl: selectedPhotoUrl,
                    onDeleteClicked: onDeleteClicked,
                );
              } else {
                return Column();
              }
            }));
  }
}
