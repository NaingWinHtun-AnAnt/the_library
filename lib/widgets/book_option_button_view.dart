import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';

class BookOptionButtonView extends StatelessWidget {
  final IconData icon;

  BookOptionButtonView({
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        MARGIN_SMALL,
      ),
      decoration: BoxDecoration(
        color: COLOR_CAROUSEL_BUTTON,
        borderRadius: BorderRadius.circular(
          CAROUSEL_ITEM_BUTTON_BORDER_RADIUS,
        ),
      ),
      child: Icon(
        icon,
        color: COLOR_WHITE,
      ),
    );
  }
}
