import 'package:flutter/material.dart';

class PrimaryLoaderWidget extends StatelessWidget {
  const PrimaryLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Center(
          child: CircularProgressIndicator(),
        )
      ],
    );
  }
}
