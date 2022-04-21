import 'package:car_inspection/app/utils/atomic/atoms/the_button.dart';
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
  // Move controllers to store file
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

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
                controller: emailTextEditingController,
                onChanged: (email) { store.onEmailChanged(email); },
                style: textTheme.bodyText1?.copyWith(),
                decoration: InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: passwordTextEditingController,
                onChanged: (password) { store.onPasswordChanged(password); },
                style: textTheme.bodyText1?.copyWith(),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TheButtonWidget(
                  onPressed: () {
                    store.signIn();
                  },
                  child: Text('Sign in')
              )
            ],
          ),
        ),
      ),
    );
  }
}
