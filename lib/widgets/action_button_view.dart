import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';

class ActionButtonView extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool isGhostButton;
  final double horizontalPadding;
  final Function onTapAction;

  ActionButtonView({
    required this.text,
    required this.onTapAction,
    this.textColor = COLOR_PRIMARY,
    this.isGhostButton = false,
    this.horizontalPadding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapAction(),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: MARGIN_MEDIUM,
          horizontal: horizontalPadding,
        ),
        decoration: BoxDecoration(
          color: isGhostButton ? Colors.transparent : COLOR_PRIMARY,
          border: Border.all(
            color: isGhostButton ? COLOR_GREY : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isGhostButton ? COLOR_PRIMARY : COLOR_GREY_3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
