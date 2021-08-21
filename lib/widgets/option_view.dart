import 'package:flutter/material.dart';

class OptionView extends StatelessWidget {
  final Function onTapItem;
  final IconData icon;
  final String label;

  OptionView({
    required this.onTapItem,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapItem();
        Navigator.of(context).pop();
      },
      child: ListTile(
        leading: Icon(
          icon,
        ),
        title: Text(
          label,
        ),
      ),
    );
  }
}
