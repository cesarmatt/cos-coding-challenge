import 'package:car_inspection/app/components/button/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/cupertino.dart';
import 'login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome Back!',
                style: textTheme.bodyText1?.copyWith(
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                controller: store.emailTextEditingController,
                style: textTheme.bodyText1?.copyWith(),
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: store.passwordTextEditingController,
                style: textTheme.bodyText1?.copyWith(),
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              PrimaryButtonWidget(
                  onPressed: () {
                    store.signIn();
                  },
                  child: const Text('Sign in')
              )
            ],
          ),
        ),
      ),
    );
  }
}
