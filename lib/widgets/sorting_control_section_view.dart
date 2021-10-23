import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';

class SortingControlSectionView extends StatelessWidget {
  final Function onTapSortButton;
  final Function onTapGridButton;

  SortingControlSectionView({
    required this.onTapSortButton,
    required this.onTapGridButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onTapSortButton(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.sort,
                color: COLOR_GREY,
              ),
              SizedBox(
                width: MARGIN_MEDIUM,
              ),
              Text(
                "Sort by: Recent",
                style: TextStyle(
                  fontSize: TEXT_REGULAR_2X,
                  color: COLOR_GREY,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () => onTapGridButton(),
          child: Icon(
            Icons.list,
            color: COLOR_GREY,
            key: Key("CHANGE_LAYOUT"),
          ),
        ),
      ],
    );
  }
}
