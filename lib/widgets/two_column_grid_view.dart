import 'package:flutter/material.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/viewitems/two_column_book_view.dart';

class TwoColumnGridView extends StatelessWidget {
  final List<BookVO> myBookList;
  final Function onTapOption;
  final Function(BookVO) onTapBook;

  TwoColumnGridView({
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
      itemBuilder: (BuildContext context, int index) => TwoColumnBookView(
        myBook: myBookList[index],
        onTapOption: () => onTapOption(),
        onTapBook: (book) => onTapBook(book),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
      ),
    );
  }
}
