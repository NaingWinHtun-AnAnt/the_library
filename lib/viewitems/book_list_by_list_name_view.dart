import 'package:flutter/material.dart';
import 'package:the_library/data/vos/book_by_list_name_vo.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/widgets/book_text_view.dart';

class BookListByListNameView extends StatelessWidget {
  final BookByListNameVO bookByListName;
  final Function onTapBook;

  BookListByListNameView({
    required this.bookByListName,
    required this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapBook(),
      child: Container(
        width: BOOK_IMAGE_WIDTH,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageView(
              bookImage:
                  "https://images.unsplash.com/photo-1621827979802-6d778e161b28?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80",
            ),
            SizedBox(
              height: MARGIN_SMALL,
            ),
            BookTextView(
              text: bookByListName.displayName,
            ),
            BookTextView(
              text: bookByListName.bookDetails[0].author,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  final String bookImage;

  ImageView({
    required this.bookImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TWO_COLUMN_BOOK_IMAGE_HEIGHT,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            BOOK_COVER_IMAGE_RADIUS,
          ),
          child: Image.network(
            bookImage,
            width: TWO_COLUMN_BOOK_IMAGE_HEIGHT,
            height: TWO_COLUMN_BOOK_IMAGE_HEIGHT,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
