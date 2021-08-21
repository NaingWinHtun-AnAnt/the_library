import 'package:flutter/material.dart';

class BookTextView extends StatelessWidget {
  final String text;

  BookTextView({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
