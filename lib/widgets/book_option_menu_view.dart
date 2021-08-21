import 'package:flutter/material.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/widgets/option_view.dart';

class BookOptionMenuView extends StatelessWidget {
  final BookVO book;

  BookOptionMenuView({
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MARGIN_MEDIUM_3,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    CAROUSEL_OPTION_IMAGE_RADIUS,
                  ),
                  child: Image.network(
                    book.bookImage,
                    height: 80,
                  ),
                ),
                SizedBox(
                  width: MARGIN_MEDIUM_2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: TextStyle(
                        fontSize: TEXT_REGULAR_2X,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: MARGIN_SMALL,
                    ),
                    Text(
                      book.author,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Divider(
            color: COLOR_GREY,
          ),
          OptionView(
            onTapItem: () {},
            icon: Icons.dashboard,
            label: "Open Series",
          ),
          OptionView(
            onTapItem: () {},
            icon: Icons.remove_circle_outline,
            label: "Remove download",
          ),
          OptionView(
            onTapItem: () {},
            icon: Icons.delete,
            label: "Delete from library",
          ),
          OptionView(
            onTapItem: () {},
            icon: Icons.add,
            label: "Add to shelf",
          ),
          OptionView(
            onTapItem: () {},
            icon: Icons.book,
            label: "About this ebook",
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3,
            ),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Buy 4.99"),
            ),
          ),
        ],
      ),
    );
  }
}
