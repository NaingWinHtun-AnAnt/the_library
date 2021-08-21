import 'package:flutter/material.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/viewitems/book_view.dart';

class HorizontalBookListView extends StatelessWidget {
  final List<BookVO> bookList;
  final Function(BookVO) onTapBook;

  HorizontalBookListView({
    required this.bookList,
    required this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HORIZONTAL_BOOK_LIST_HEIGHT,
      child: ListView.builder(
        padding: EdgeInsets.only(
          left: MARGIN_MEDIUM_3,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: bookList.length,
        itemBuilder: (BuildContext context, int index) => Container(
          margin: EdgeInsets.only(
            right: MARGIN_MEDIUM_3,
          ),
          child: BookView(
            book: bookList[index],
            onTapBook: (book) => onTapBook(book),
          ),
        ),
      ),
    );
  }
}
