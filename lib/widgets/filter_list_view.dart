import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/viewitems/filter_view.dart';
import 'package:the_library/viewitems/selected_filter_view.dart';

class FilterListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(
        left: MARGIN_MEDIUM_2,
      ),
      children: [
        Container(
          padding: EdgeInsets.all(
            MARGIN_MEDIUM,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: COLOR_GREY,
          ),
          child: Icon(
            Icons.clear,
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM_2,
        ),
        ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) =>
              SelectedFilterView(),
        ),
        ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => FilterView(),
        )
      ],
    );
  }
}
