import 'package:flutter/material.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/widgets/book_option_button_view.dart';
import 'package:the_library/widgets/book_text_view.dart';
import 'package:the_library/widgets/book_type_text_view.dart';

class ThreeColumnBookView extends StatelessWidget {
  final BookVO myBook;
  final Function(BookVO) onTapOption;
  final Function(BookVO) onTapBook;

  ThreeColumnBookView({
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
            ImageAndOptionSectionView(
              myBook: myBook,
              onTapOption: (book) => onTapOption(book),
            ),
            SizedBox(
              height: MARGIN_SMALL,
            ),
            BookTextView(text: myBook.title),
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
  final Function(BookVO) onTapOption;

  ImageAndOptionSectionView({
    required this.myBook,
    required this.onTapOption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BOOK_IMAGE_HEIGHT,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                BOOK_COVER_IMAGE_RADIUS,
              ),
              child: Image.network(
                myBook.bookImage ?? "-",
                width: BOOK_IMAGE_WIDTH,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => onTapOption(myBook),
                child: Container(
                  margin: EdgeInsets.all(
                    MARGIN_MEDIUM,
                  ),
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: COLOR_WHITE,
                    key: Key("BOOK_OPTION"),
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
