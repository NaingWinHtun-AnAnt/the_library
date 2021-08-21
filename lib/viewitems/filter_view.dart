import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/widgets/filter_text_view.dart';

class FilterView extends StatelessWidget {
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
        border: Border.all(
          color: COLOR_GREY,
        ),
      ),
      child: Row(
        children: [
          FilterTextView(
            text: "Purchases",
          ),
          Container(
            color: COLOR_GREY,
            margin: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_2,
            ),
            width: 2,
            height: 12,
          ),
          FilterTextView(
            text: "Samples",
          ),
        ],
      ),
    );
  }
}
