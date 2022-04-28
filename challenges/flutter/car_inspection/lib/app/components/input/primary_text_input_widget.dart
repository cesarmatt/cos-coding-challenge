import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryTextInputWidget extends StatelessWidget {
  const PrimaryTextInputWidget(
      {Key? key,
      this.inputTextEditingController,
      this.hint,
      this.initialValue,
      this.isReadOnly,
      this.formValidation})
      : super(key: key);

  final TextEditingController? inputTextEditingController;
  final String? hint;
  final String? initialValue;
  final bool? isReadOnly;
  final FormFieldValidator<String>? formValidation;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return TextFormField(
      decoration: InputDecoration(hintText: hint),
      controller: inputTextEditingController,
      initialValue: initialValue,
      style: textTheme.bodyText1?.copyWith(fontSize: 16),
      readOnly: isReadOnly ?? false,
      validator: formValidation,
    );
  }
}
