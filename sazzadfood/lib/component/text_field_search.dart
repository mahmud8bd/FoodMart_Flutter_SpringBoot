import 'package:flutter/material.dart';
import 'package:sazzadfood/component/text_field_container_search.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class RoundedSearchField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedSearchField({
    super.key,
    required this.onChanged,
    required this.controller,
  });

  @override
  State<RoundedSearchField> createState() => _RoundedSearchFieldState();
}


class _RoundedSearchFieldState extends State<RoundedSearchField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextFieldContainerSearch(
        child: TextFormField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: "Search",
            icon: Icon(
              Icons.search,
              color: sPrimaryColor,
            ),
            suffixIcon: GestureDetector(
              onTap: (){
                setState(() {
                  final text = widget.controller.text;
                  if (text.isNotEmpty) {
                    widget.controller.text = text.substring(0, text.length - 1);
                  }
                });
              },
              child: Icon(
                Icons.close,
                color: sPrimaryColor,
              ),
            ),
            border: InputBorder.none,
          ),
        ));
  }
}
