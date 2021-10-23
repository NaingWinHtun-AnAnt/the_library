import 'package:flutter/material.dart';
import 'package:the_library/data/vos/search_book_vo.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';

class SearchResultView extends StatelessWidget {
  final SearchBookVO searchBook;
  final Function(SearchBookVO) onTapSearchResult;

  SearchResultView({
    required this.searchBook,
    required this.onTapSearchResult,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapSearchResult(searchBook),
      child: Container(
        color: COLOR_WHITE,
        margin: EdgeInsets.only(bottom: MARGIN_MEDIUM_2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              searchBook.volumeInfo?.imageLinks?.thumbnail ??
                  "https://media.istockphoto.com/videos/splash-element-object-background-stock-video-video-id1184050807?s=640x640",
              width: SEARCH_RESULT_IMAGE_WIDTH,
              height: SEARCH_RESULT_IMAGE_HEIGHT,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: MARGIN_MEDIUM_2,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    searchBook.volumeInfo?.title ?? "-",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: MARGIN_SMALL,
                  ),
                  Text(
                    searchBook.volumeInfo!.authors != null
                        ? searchBook.volumeInfo!.authors!
                            .map((e) => e)
                            .join(", ")
                        : "-",
                    overflow: TextOverflow.ellipsis,
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
