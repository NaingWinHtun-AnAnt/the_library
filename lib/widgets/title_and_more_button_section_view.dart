import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';

class TitleAndMoreButtonSectionView extends StatelessWidget {
  final String title;
  final Function onTapMoreButton;

  TitleAndMoreButtonSectionView({
    required this.title,
    required this.onTapMoreButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: COLOR_GREY_3,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onTapMoreButton(),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: COLOR_PRIMARY,
              size: SEE_MORE_BUTTON_SIZE,
            ),
          ),
        ],
      ),
    );
  }
}
