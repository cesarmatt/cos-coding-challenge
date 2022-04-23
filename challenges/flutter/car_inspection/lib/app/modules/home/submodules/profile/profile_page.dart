import 'package:flutter_modular/flutter_modular.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/profile_store.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key? key, this.title = 'SubmodulesPage'}) : super(key: key);
  @override
  ProfilePageState createState() => ProfilePageState();
}
class ProfilePageState extends State<ProfilePage> {
  final ProfileStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [Text("Profile")],
      ),
    );
  }
}