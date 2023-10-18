import 'package:flutter/material.dart';
import 'package:sazzadfood/component/text_field_container.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedPasswordField({
    super.key,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
      controller: controller,
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: sPrimaryColor,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: sPrimaryColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
