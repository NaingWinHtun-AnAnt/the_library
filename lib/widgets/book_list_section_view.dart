import 'package:flutter/material.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/viewitems/book_list_item_view.dart';
import 'package:the_library/viewitems/three_column_book_view.dart';
import 'package:the_library/widgets/filter_list_view.dart';
import 'package:the_library/widgets/sorting_control_section_view.dart';
import 'package:the_library/widgets/two_column_grid_view.dart';

class BookListSectionView extends StatelessWidget {
  final List<BookVO> myBookList;
  final Function onTapSortButton;
  final Function(BookListLayout) onTapGridButton;
  final Function onTapOption;
  final Function(BookVO) onTapBook;
  final BookListLayout bookLayout;

  BookListSectionView({
    required this.myBookList,
    required this.onTapSortButton,
    required this.onTapGridButton,
    required this.onTapOption,
    required this.onTapBook,
    required this.bookLayout,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Container(
          height: FILTER_LIST_VIEW_HEIGHT,
          child: FilterListView(),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: MARGIN_LARGE,
          ),
          child: SortingControlSectionView(
            onTapSortButton: () => onTapSortButton(),
            onTapGridButton: () => onTapGridButton(_handleToggleButton()),
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_2,
          ),
          child: bookLayout == BookListLayout.LIST_VIEW
              ? BookListView(
                  myBookList: myBookList,
                  onTapOption: () => onTapOption(),
                  onTapBook: (book) => onTapBook(book),
                )
              : bookLayout == BookListLayout.THREE_COLUMN_GRID_VIEW
                  ? ThreeColumnGridView(
                      myBookList: myBookList,
                      onTapOption: () => onTapOption(),
                      onTapBook: (book) => onTapBook(book),
                    )
                  : TwoColumnGridView(
                      myBookList: myBookList,
                      onTapOption: () => onTapOption(),
                      onTapBook: (book) => onTapBook(book),
                    ),
        ),
      ],
    );
  }

  BookListLayout _handleToggleButton() {
    switch (bookLayout) {
      case BookListLayout.LIST_VIEW:
        return BookListLayout.TWO_COLUMN_GRID_VIEW;
      case BookListLayout.TWO_COLUMN_GRID_VIEW:
        return BookListLayout.THREE_COLUMN_GRID_VIEW;
      case BookListLayout.THREE_COLUMN_GRID_VIEW:
        return BookListLayout.LIST_VIEW;
    }
  }
}

class ThreeColumnGridView extends StatelessWidget {
  final List<BookVO> myBookList;
  final Function onTapOption;
  final Function(BookVO) onTapBook;

  ThreeColumnGridView({
    required this.myBookList,
    required this.onTapOption,
    required this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: myBookList.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => ThreeColumnBookView(
        myBook: myBookList[index],
        onTapOption: () => onTapOption(),
        onTapBook: (book) => onTapBook(book),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.57,
      ),
    );
  }
}

class BookListView extends StatelessWidget {
  final List<BookVO> myBookList;
  final Function onTapOption;
  final Function(BookVO) onTapBook;

  BookListView({
    required this.myBookList,
    required this.onTapOption,
    required this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myBookList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => BookListItemView(
        myBook: myBookList[index],
        onTapOption: () => onTapOption(),
        onTapBook: (book) => onTapBook(book),
      ),
    );
  }
}

enum BookListLayout {
  LIST_VIEW,
  TWO_COLUMN_GRID_VIEW,
  THREE_COLUMN_GRID_VIEW,
}
