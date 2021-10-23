import 'package:flutter/material.dart';
import 'package:the_library/data/vos/shelf_vo.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/resources/strings.dart';
import 'package:the_library/viewitems/shelf_view.dart';

class ShelfListSectionView extends StatelessWidget {
  final List<ShelfVO>? shelfList;
  final Function(String) onTapShelf;
  final Function onTapCreateNew;

  ShelfListSectionView({
    required this.shelfList,
    required this.onTapShelf,
    required this.onTapCreateNew,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: MARGIN_LARGE,
          ),
          child: ListView.builder(
            itemCount: shelfList?.length ?? 0,
            shrinkWrap: true,
            padding: EdgeInsets.only(
              top: MARGIN_MEDIUM_2,
            ),
            itemBuilder: (BuildContext context, int index) => ShelfView(
              firstBookImage: shelfList?[index].books.isEmpty ?? true
                  ? null
                  : shelfList?[index].books[0].bookImage,
              shelf: shelfList?[index],
              onTapShelf: (shelfId) => onTapShelf(shelfId),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton.icon(
            onPressed: () => onTapCreateNew(),
            icon: Icon(Icons.edit_outlined),
            label: Text(CREATE_NEW),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            )),
          ),
        ),
      ],
    );
  }
}
