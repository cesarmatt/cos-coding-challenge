import 'package:car_inspection/app/modules/home/submodules/profile/pickerprefferences/picker_prefferences_dialog.dart';
import 'package:car_inspection/app/utils/atomic/atoms/primary_button_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/profile_store.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  final String title;

  const ProfilePage({Key? key, this.title = 'SubmodulesPage'})
      : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final ProfileStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    store.setCurrentUserEmail();
    store.hasPreferredUploadMethod();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.network(
                      'https://64.media.tumblr.com/ea15b4330a8d1ca20a3fda92ac2765e7/b61e1bc3a74ef218-7c/s500x750/9c892cd8ad317402793809a83441568553f9700b.jpg',
                      width: 140,
                      height: 140,
                    ),
                    const Spacer(),
                    PrimaryButtonWidget(
                      onPressed: () {
                        if (store.hasPreferredMethod) {
                          store.openSelectedUploadMethod();
                        } else {
                          showPickerPreferenceDialog(context);
                        }
                      },
                      child: const Text("Upload"),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: store.emailTextEditingController,
                  readOnly: true,
                ),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  TextButton(
                      onPressed: () {
                        store.onEditPasswordClicked();
                      },
                      child: const Text('Edit password')),
                  const Divider(),
                  TextButton(
                      onPressed: () {
                        store.onLogoutClicked();
                      },
                      child: const Text('Logout')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showPickerPreferenceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          PickerPreferencesDialog(
            onUploadMethodSelected: (uploadMethod) {
              store.onUploadMethodSelected(uploadMethod);
            },
          ),
    );
  }
}
