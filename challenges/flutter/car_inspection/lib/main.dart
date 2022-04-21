import 'package:car_inspection/app/app_module.dart';
import 'package:car_inspection/app/app_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 5554);
  runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}