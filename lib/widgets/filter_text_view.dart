import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';

class FilterTextView extends StatelessWidget {
  final String text;
  final Color textColor;

  FilterTextView({
    required this.text,
    this.textColor = COLOR_GREY_3,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    );
  }
}
