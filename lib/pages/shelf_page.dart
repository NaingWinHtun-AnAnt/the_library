import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/widgets/book_list_section_view.dart';
import 'package:the_library/widgets/option_view.dart';
import 'package:the_library/widgets/sort_option_section_view.dart';

class ShelfPage extends StatefulWidget {
  @override
  State<ShelfPage> createState() => _ShelfPageState();
}

class _ShelfPageState extends State<ShelfPage> {
  int _selectedSortValue = 1;
  BookListLayout _bookListLayout = BookListLayout.THREE_COLUMN_GRID_VIEW;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_WHITE,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: COLOR_GREY_3,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: MARGIN_MEDIUM_2,
            ),
            child: GestureDetector(
              onTap: () => displayShelfOptionButtonSheet(context),
              child: Icon(
                Icons.more_horiz_outlined,
                color: COLOR_GREY_3,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MARGIN_LARGE_2,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3,
            ),
            child: Text(
              "10 Interaction Design Books to Read",
              style: TextStyle(
                fontSize: TEXT_HEADING_2X,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3,
            ),
            child: Text(
              "3 books",
              style: TextStyle(
                fontSize: TEXT_REGULAR_2X,
              ),
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Divider(
            color: COLOR_GREY,
          ),
          BookListSectionView(
            myBookList: [],
            onTapSortButton: () => _onTapSortOptionButton(context),
            onTapGridButton: (bookListLayout) {
              setState(() {
                _bookListLayout = bookListLayout;
              });
            },
            onTapOption: () => _onTapBookItemMenu(context),
            onTapBook: (book) => _navigateToBookDetailPage(context),
            bookLayout: _bookListLayout,
          ),
        ],
      ),
    );
  }

  void _onTapSortOptionButton(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) =>
                SortOptionSectionView(
          selectedSortValue: _selectedSortValue,
          onTapSortItem: (value) => onTapSortOption(setState, value, context),
        ),
      ),
    );
  }

  void _onTapBookItemMenu(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) =>
                // BookOptionMenuView(book:,),
                Container(),
      ),
    );
  }

  void _navigateToBookDetailPage(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => BookDetailPage(),
    //   ),
    // );
  }

  void onTapSortOption(
    void Function(void Function()) setState,
    int value,
    BuildContext context,
  ) {
    setState(() {
      _selectedSortValue = value;
    });
    Navigator.of(context).pop();
  }

  void displayShelfOptionButtonSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
        child: ShelfOptionSectionView(
          onTapRenameShelf: () {},
          onTapDeleteShelf: () {},
        ),
      ),
    );
  }
}

class ShelfOptionSectionView extends StatelessWidget {
  final Function onTapRenameShelf;
  final Function onTapDeleteShelf;

  ShelfOptionSectionView({
    required this.onTapRenameShelf,
    required this.onTapDeleteShelf,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(
            MARGIN_MEDIUM_2,
          ),
          child: Text(
            "10 Interaction Design Books to Read",
            style: TextStyle(
              color: COLOR_GREY_3,
              fontSize: TEXT_REGULAR_2X,
            ),
          ),
        ),
        Divider(
          color: COLOR_GREY,
        ),
        OptionView(
          icon: Icons.edit_outlined,
          label: "Rename shelf",
          onTapItem: () => onTapRenameShelf(),
        ),
        OptionView(
          icon: Icons.delete,
          label: "Delete shelf",
          onTapItem: () => onTapDeleteShelf(),
        ),
      ],
    );
  }
}
