import 'package:flutter/material.dart';

class TheButtonWidget extends StatelessWidget {
  const TheButtonWidget({
    Key? key,
    required this.onPressed,
    required this.child,
    this.icon,
    this.color,
  }) : super(key: key);

  final void Function() onPressed;
  final Widget? icon;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(
          primary: color
        ),
      ),
    );
  }
}