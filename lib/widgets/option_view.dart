import 'package:flutter/material.dart';

class OptionView extends StatelessWidget {
  final Function onTapItem;
  final IconData icon;
  final String label;
  final Key? key;

  OptionView({
    required this.onTapItem,
    required this.icon,
    required this.label,
    this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        onTapItem();
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
