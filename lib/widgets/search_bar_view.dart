import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';

class SearchBarView extends StatelessWidget {
  final Function onTapSearchBarView;

  SearchBarView({
    required this.onTapSearchBarView,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapSearchBarView(),
      child: Card(
        color: COLOR_WHITE,
        shadowColor: COLOR_GREY,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SEARCH_BAR_BORDER_RADIUS,
          ),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM_2,
        ),
        child: Padding(
          padding: EdgeInsets.all(
            MARGIN_CARD_MEDIUM_2,
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: COLOR_GREY,
              ),
              SizedBox(
                width: MARGIN_MEDIUM,
              ),
              Text(
                "Search Play Books",
                style: TextStyle(
                  color: COLOR_GREY,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              ProfileImageView(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        SEARCH_BAR_PROFILE_IMAGE_SIZE / 2,
      ),
      child: Image.network(
        "https://images.unsplash.com/photo-1623091411395-09e79fdbfcf3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
        fit: BoxFit.cover,
        width: SEARCH_BAR_PROFILE_IMAGE_SIZE,
        height: SEARCH_BAR_PROFILE_IMAGE_SIZE,
      ),
    );
  }
}
