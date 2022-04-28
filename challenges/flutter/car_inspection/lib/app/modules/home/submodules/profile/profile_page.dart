import 'package:car_inspection/app/components/loader/primary_loader_widget.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/pickerprefferences/picker_prefferences_dialog.dart';
import 'package:car_inspection/app/components/button/primary_button_widget.dart';
import 'package:car_inspection/app/theme/car_inspection_theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:car_inspection/app/modules/home/submodules/profile/profile_store.dart';
import 'package:flutter/material.dart';

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
  void initState() {
    super.initState();
    store.loadProfilePageData();
    store.getUploadPreferredMethod();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Observer(builder: (_) {
        if (store.isLoading) {
          return const PrimaryLoaderWidget();
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        showProfilePicture(),
                        PrimaryButtonWidget(
                          onPressed: () {
                            onButtonClicked();
                          },
                          child: const Text("Upload"),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'User email',
                          style: textTheme.bodyText1?.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          initialValue: store.userInfo?.email ?? '',
                          readOnly: true,
                        ),
                      ],
                    )
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
          );
        }
      }),
    );
  }

  void onButtonClicked() {
    if (store.userPreferredUploadMethod?.isNotEmpty == true) {
      store.openSelectedUploadMethod();
    } else {
      showPickerPreferenceDialog(context);
    }
  }

  void showPickerPreferenceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => PickerPreferencesDialog(
        onUploadMethodSelected: (uploadMethod) {
          store.onUploadMethodSelected(uploadMethod);
        },
      ),
    );
  }

  Widget showProfilePicture() {
    var photoUrl = store.userPictureUrl;
    var placeholder = 'assets/images/profile_placeholder.png';
    if (store.isLoading) {
      return const PrimaryLoaderWidget();
    } else {
      if (photoUrl != null) {
        return Image.network(
          photoUrl,
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.3,
        );
      } else {
        return Image.asset(
          placeholder,
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.3,
        );
      }
    }
  }
}
