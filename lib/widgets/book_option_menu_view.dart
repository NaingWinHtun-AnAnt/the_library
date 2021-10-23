import 'package:flutter/material.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/resources/strings.dart';
import 'package:the_library/widgets/option_view.dart';

class BookOptionMenuView extends StatelessWidget {
  final BookVO? book;
  final Function(BookVO?) onTapAddToShelf;
  final Function(BookVO?)? onTapRemoveFromShelf;

  BookOptionMenuView({
    required this.book,
    required this.onTapAddToShelf,
    this.onTapRemoveFromShelf,
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
            child: BookCoverAndInfoSectionView(book: book),
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
            label: OPEN_SERIES,
          ),
          OptionView(
            onTapItem: () {},
            icon: Icons.remove_circle_outline,
            label: REMOVE_DOWNLOAD,
          ),
          OptionView(
            onTapItem: () {},
            icon: Icons.delete,
            label: DELETE_FROM_LIBRARY,
          ),
          OptionView(
            onTapItem: () => onTapAddToShelf(book),
            icon: Icons.add,
            label: ADD_TO_SHELF,
          ),
          Visibility(
            visible: onTapRemoveFromShelf != null,
            child: OptionView(
              onTapItem: () => onTapRemoveFromShelf!(book),
              icon: Icons.remove,
              label: REMOVE_FROM_SHELF,
            ),
          ),
          OptionView(
            onTapItem: () {},
            icon: Icons.book,
            label: ABOUT_THIS_EBOOK,
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

class BookCoverAndInfoSectionView extends StatelessWidget {
  final BookVO? book;

  BookCoverAndInfoSectionView({
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            CAROUSEL_OPTION_IMAGE_RADIUS,
          ),
          child: Image.network(
            book?.bookImage ?? "-",
            height: 80,
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM_2,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book?.title ?? "-",
                style: TextStyle(
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: MARGIN_SMALL,
              ),
              Text(
                book?.author ?? "-",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
