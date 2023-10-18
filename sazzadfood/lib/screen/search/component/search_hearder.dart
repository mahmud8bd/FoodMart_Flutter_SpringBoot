
import 'package:flutter/material.dart';
import 'package:sazzadfood/component/text_field_search.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _search = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RoundedSearchField(onChanged: (value){}, controller: _search)
      ],
    );
  }
}