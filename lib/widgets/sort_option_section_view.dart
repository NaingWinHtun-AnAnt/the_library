import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/widgets/book_list_section_view.dart';

class SortOptionSectionView extends StatelessWidget {
  final BookSortOption selectedSortValue;
  final Function(BookSortOption) onTapSortItem;

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
            value: BookSortOption.RECENTLY_OPEN,
            selectedValue: selectedSortValue,
            label: "Recently Open",
            onTapItem: (value) => onTapSortItem(value),
          ),
          SortOptionView(
            value: BookSortOption.TITLE,
            selectedValue: selectedSortValue,
            label: "Title",
            onTapItem: (value) => onTapSortItem(value),
          ),
          SortOptionView(
            value: BookSortOption.AUTHOR,
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
  final BookSortOption selectedValue;
  final BookSortOption value;
  final Function(BookSortOption) onTapItem;

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
            onTapItem(selectedValue as BookSortOption),
        activeColor: COLOR_PRIMARY,
      ),
      title: Text(label),
    );
  }
}
