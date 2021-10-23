import 'package:flutter/material.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';

class BookListItemView extends StatelessWidget {
  final BookVO myBook;
  final Function(BookVO) onTapOption;
  final Function(BookVO) onTapBook;

  BookListItemView({
    required this.myBook,
    required this.onTapOption,
    required this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapBook(myBook),
      child: Container(
        color: COLOR_WHITE,
        height: LIST_VIEW_ITEM_HEIGHT,
        margin: EdgeInsets.only(
          bottom: MARGIN_MEDIUM_2,
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  BOOK_COVER_IMAGE_RADIUS,
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  myBook.bookImage?? "-",
                  height: LIST_VIEW_ITEM_HEIGHT,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: MARGIN_MEDIUM_2,
            ),
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          myBook.title?? "-",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: COLOR_GREY_3,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MARGIN_MEDIUM_2,
                      ),
                      Icon(
                        Icons.download_done_outlined,
                        color: COLOR_GREY,
                        size: 16,
                      ),
                      SizedBox(
                        width: MARGIN_LARGE,
                      ),
                      GestureDetector(
                        onTap: () => onTapOption(myBook),
                        child: Icon(
                          Icons.more_horiz_outlined,
                          color: COLOR_GREY,
                        ),
                      ),
                      SizedBox(
                        width: MARGIN_MEDIUM,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MARGIN_MEDIUM,
                  ),
                  Text(
                    myBook.author?? "-",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: COLOR_GREY,
                    ),
                  ),
                  SizedBox(
                    height: MARGIN_SMALL,
                  ),
                  Text(
                    "Ebook - sample",
                    style: TextStyle(
                      color: COLOR_GREY,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
