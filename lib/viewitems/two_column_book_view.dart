import 'package:flutter/material.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/widgets/book_option_button_view.dart';
import 'package:the_library/widgets/book_text_view.dart';
import 'package:the_library/widgets/book_type_text_view.dart';

class TwoColumnBookView extends StatelessWidget {
  final BookVO myBook;
  final Function onTapOption;
  final Function(BookVO) onTapBook;

  TwoColumnBookView({
    required this.myBook,
    required this.onTapOption,
    required this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapBook(myBook),
      child: Container(
        width: BOOK_IMAGE_WIDTH,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageAndOptionSectionView(myBook: myBook,
              onTapOption: () => onTapOption(),
            ),
            SizedBox(
              height: MARGIN_SMALL,
            ),
            BookTextView(
              text: myBook.title,
            ),
            BookTextView(
              text: myBook.author,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageAndOptionSectionView extends StatelessWidget {
  final BookVO myBook;
  final Function onTapOption;

  ImageAndOptionSectionView({
    required this.myBook,
    required this.onTapOption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TWO_COLUMN_BOOK_IMAGE_HEIGHT,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                BOOK_COVER_IMAGE_RADIUS,
              ),
              child: Image.network(
                myBook.bookImage,
                width: TWO_COLUMN_BOOK_IMAGE_HEIGHT,
                height: TWO_COLUMN_BOOK_IMAGE_HEIGHT,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => onTapOption(),
                child: Container(
                  margin: EdgeInsets.all(
                    MARGIN_MEDIUM,
                  ),
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: COLOR_WHITE,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.all(
                  MARGIN_MEDIUM,
                ),
                child: BookOptionButtonView(
                  icon: Icons.download_done_outlined,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: BookTypeTextView(
                text: "Sample",
              ),
            ),
          ],
        ),
      ),
    );
  }
}