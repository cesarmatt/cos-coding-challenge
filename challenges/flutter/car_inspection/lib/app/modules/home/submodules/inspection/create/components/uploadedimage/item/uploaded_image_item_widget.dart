import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadedImageItemWidget extends StatelessWidget {
  const UploadedImageItemWidget({Key? key, required this.selectedPhotoUrl, required this.onDeleteClicked})
      : super(key: key);

  final String? selectedPhotoUrl;
  final Function(String) onDeleteClicked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            iconSize: 16,
            onPressed: () {
              onDeleteClicked(selectedPhotoUrl ?? "");
            },
            icon: const Icon(Icons.delete, color: Color(0xFFffd452))),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                selectedPhotoUrl ?? "",
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
