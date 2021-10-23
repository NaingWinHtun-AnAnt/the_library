import 'package:flutter/material.dart';
import 'package:the_library/data/vos/shelf_vo.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';

class ShelfView extends StatelessWidget {
  final String? firstBookImage;
  final ShelfVO? shelf;
  final Function(String) onTapShelf;

  ShelfView({
    required this.firstBookImage,
    required this.shelf,
    required this.onTapShelf,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapShelf(shelf?.id ?? "0"),
      child: Container(
        color: COLOR_WHITE,
        height: SHELF_VIEW_ITEM_HEIGHT,
        margin: EdgeInsets.only(
          bottom: MARGIN_MEDIUM_2,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: ShelfImageView(
                      imageUrl: firstBookImage,
                    ),
                  ),
                  SizedBox(
                    width: MARGIN_MEDIUM_2,
                  ),
                  Expanded(
                    flex: 4,
                    child: ShelfNameAndBookCountView(shelf: shelf),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: COLOR_GREY,
                    size: 16,
                  ),
                  SizedBox(
                    width: MARGIN_LARGE,
                  ),
                ],
              ),
            ),
            Divider(
              height: 0.0,
              color: COLOR_GREY_3,
            ),
          ],
        ),
      ),
    );
  }
}

class ShelfNameAndBookCountView extends StatelessWidget {
  final ShelfVO? shelf;

  ShelfNameAndBookCountView({
    required this.shelf,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            shelf?.name ?? "-",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600,
              color: COLOR_GREY_3,
            ),
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          "${shelf?.books.length ?? 0} books",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: COLOR_GREY,
          ),
        ),
      ],
    );
  }
}

class ShelfImageView extends StatelessWidget {
  final String? imageUrl;

  ShelfImageView({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(BOOK_COVER_IMAGE_RADIUS),
      ),
      clipBehavior: Clip.antiAlias,
      child: imageUrl != null
          ? Image.network(
              imageUrl ??
                  "https://media.istockphoto.com/videos/splash-element-object-background-stock-video-video-id1184050807?s=640x640",
              height: LIST_VIEW_ITEM_HEIGHT,
              fit: BoxFit.cover,
            )
          : Container(
              height: LIST_VIEW_ITEM_HEIGHT,
              color: COLOR_GREY,
            ),
    );
  }
}
