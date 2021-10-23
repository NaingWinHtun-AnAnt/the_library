import 'package:flutter/material.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/resources/strings.dart';

class ShelfNameTextFieldView extends StatelessWidget {
  final TextEditingController textController;

  ShelfNameTextFieldView({
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: TEXT_HEADING_1X,
      ),
      decoration: InputDecoration(
        hintText: SHELF_NAME,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: TEXT_HEADING_1X,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return EMPTY_SHELF_NAME;
        } else
          return null;
      },
    );
  }
}
