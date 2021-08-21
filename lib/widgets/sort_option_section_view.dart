import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';

class SortOptionSectionView extends StatelessWidget {
  final int selectedSortValue;
  final Function(int) onTapSortItem;

  SortOptionSectionView({
    required this.selectedSortValue,
    required this.onTapSortItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_WHITE,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            backgroundColor: COLOR_WHITE,
            elevation: 0.6,
            automaticallyImplyLeading: false,
            title: Text(
              "Sort By",
              style: TextStyle(
                color: COLOR_GREY_3,
              ),
            ),
          ),
          SortOptionView(
            value: 1,
            selectedValue: selectedSortValue,
            label: "Recently Open",
            onTapItem: (value) => onTapSortItem(value),
          ),
          SortOptionView(
            value: 2,
            selectedValue: selectedSortValue,
            label: "Title",
            onTapItem: (value) => onTapSortItem(value),
          ),
          SortOptionView(
            value: 3,
            selectedValue: selectedSortValue,
            label: "Author",
            onTapItem: (value) => onTapSortItem(value),
          ),
        ],
      ),
    );
  }
}

class SortOptionView extends StatelessWidget {
  final String label;
  final int selectedValue;
  final int value;
  final Function(int) onTapItem;

  SortOptionView({
    required this.label,
    required this.selectedValue,
    required this.value,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Radio(
        value: value,
        groupValue: selectedValue,
        onChanged: (selectedValue) =>
            onTapItem(int.parse(selectedValue.toString())),
        activeColor: COLOR_PRIMARY,
      ),
      title: Text(label),
    );
  }
}
