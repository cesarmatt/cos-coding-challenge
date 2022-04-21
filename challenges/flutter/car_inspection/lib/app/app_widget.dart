import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'utils/atomic/atomic.dart';

class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Car Inspection",
      debugShowCheckedModeBanner: false,
      theme: Atomic.buildTheme(context),
    ).modular();
  }
}