import 'package:flutter/material.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/widgets/book_text_view.dart';

class BookView extends StatelessWidget {
  final BookVO book;
  final Function(BookVO) onTapBook;

  BookView({
    required this.book,
    required this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapBook(book),
      child: Container(
        width: BOOK_IMAGE_WIDTH,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  BOOK_COVER_IMAGE_RADIUS,
                ),
                child: Image.network(
                  book.bookImage ?? "-",
                  height: BOOK_IMAGE_HEIGHT,
                  width: BOOK_IMAGE_WIDTH,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: MARGIN_SMALL,
            ),
            GestureDetector(
              onTap: () => onTapBook(book),
              child: BookTextView(
                text: book.title,
              ),
            ),
            GestureDetector(
              onTap: () => onTapBook(book),
              child: BookTextView(
                text: book.author,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
