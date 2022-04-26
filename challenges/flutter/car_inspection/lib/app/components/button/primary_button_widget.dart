import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    Key? key,
    required this.onPressed,
    required this.child,
    this.icon,
    this.color,
    this.width,
    this.height
  }) : super(key: key);

  final void Function() onPressed;
  final Widget? icon;
  final Widget child;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 130,
      height: height ?? 50,
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