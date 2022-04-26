import 'package:car_inspection/app/modules/home/submodules/profile/editpassword/edit_password_store.dart';
import 'package:car_inspection/app/components/button/primary_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditPasswordPage extends StatefulWidget {
  final String title;

  const EditPasswordPage({Key? key, this.title = "EditPasswordPage"})
      : super(key: key);

  @override
  EditPasswordPageState createState() => EditPasswordPageState();
}

class EditPasswordPageState extends State<EditPasswordPage> {
  final EditPasswordStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      TextFormField(
                        controller: store.currentPasswordTextEditingController,
                        decoration:
                            InputDecoration(hintText: 'Current password'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text("Forgot password?")
                          ),
                        ],
                      )
                    ],
                  ),
                  TextFormField(
                    controller: store.newPasswordTextEditingController,
                    decoration: InputDecoration(hintText: 'New password'),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: store.confirmNewPasswordTextEditingController,
                    decoration:
                        InputDecoration(hintText: 'Confirm new password'),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButtonWidget(
                      onPressed: () {
                        store.onCancelClicked();
                      },
                      child: Text("Cancel"),
                      width: 150,
                    ),
                    SizedBox(width: 16),
                    PrimaryButtonWidget(
                      onPressed: () {
                        store.onSaveClicked();
                      },
                      child: Text("Save"),
                      width: 150,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
