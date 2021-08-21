import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';

class DualTabSectionView extends StatelessWidget {
  final List<String> tabList;

  DualTabSectionView({
    required this.tabList,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: COLOR_PRIMARY,
      unselectedLabelColor: COLOR_GREY,
      indicatorWeight: 4.0,
      labelColor: COLOR_PRIMARY,
      labelPadding: EdgeInsets.only(
        bottom: MARGIN_CARD_MEDIUM_2,
      ),
      tabs: tabList.map((e) => Text(e)).toList(),
    );
  }
}
