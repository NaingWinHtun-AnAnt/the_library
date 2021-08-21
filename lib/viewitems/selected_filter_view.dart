import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/widgets/filter_text_view.dart';

class SelectedFilterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: MARGIN_MEDIUM_2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
        vertical: MARGIN_MEDIUM,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: COLOR_PRIMARY_DARK,
      ),
      child: Center(
        child: FilterTextView(
          text: "Ebooks",
          textColor: COLOR_WHITE,
        ),
      ),
    );
  }
}
