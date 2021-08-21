import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';

class BookTypeTextView extends StatelessWidget {
  final String text;

  BookTypeTextView({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM,
        vertical: MARGIN_MEDIUM,
      ),
      padding: EdgeInsets.all(
        MARGIN_SMALL,
      ),
      decoration: BoxDecoration(
        color: COLOR_CAROUSEL_BUTTON,
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: COLOR_WHITE,
        ),
      ),
    );
  }
}
