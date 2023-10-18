import 'package:flutter/material.dart';
import 'package:sazzadfood/component/text_field_container.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedInputField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: sPrimaryColor,
            ),
            border: InputBorder.none,
            hintText: hintText),
      ),
    );
  }
}
