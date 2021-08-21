import 'package:flutter/material.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/widgets/book_text_view.dart';

class SimilarBookView extends StatelessWidget {
  final Function onTapBook;

  SimilarBookView({
    required this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapBook(),
      child: Container(
        width: SIMILAR_BOOK_IMAGE_WIDTH,
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
                  "https://images.unsplash.com/photo-1621827979802-6d778e161b28?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80",
                  height: SIMILAR_BOOK_IMAGE_HEIGHT,
                  width: SIMILAR_BOOK_IMAGE_WIDTH,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: MARGIN_SMALL,
            ),
            BookTextView(
              text: "UX for Beginner : A Crash",
            ),
            BookTextView(
              text: "Vol 2,#1-5",
            ),
            Row(
              children: [
                BookTextView(
                  text: "4.6",
                ),
                SizedBox(
                  width: MARGIN_SMALL,
                ),
                Icon(
                  Icons.star,
                  size: 16,
                ),
                SizedBox(
                  width: MARGIN_SMALL,
                ),
                BookTextView(
                  text: "14.19",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
