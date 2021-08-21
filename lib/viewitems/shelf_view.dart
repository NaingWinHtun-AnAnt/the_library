import 'package:flutter/material.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';

class ShelfView extends StatelessWidget {
  final Function onTapShelf;

  ShelfView({
    required this.onTapShelf,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapShelf(),
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(BOOK_COVER_IMAGE_RADIUS),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        "https://images.unsplash.com/photo-1621827979802-6d778e161b28?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80",
                        height: LIST_VIEW_ITEM_HEIGHT,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MARGIN_MEDIUM_2,
                  ),
                  Flexible(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            "10 Interaction Design Books to Read",
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
                          "3 books",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: COLOR_GREY,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
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
