import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library/blocs/add_to_shelf_bloc.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/shelf_vo.dart';
import 'package:the_library/pages/create_new_shelf_page.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/resources/strings.dart';
import 'package:the_library/widgets/loading_view.dart';
import 'package:the_library/widgets/shelf_list_section_view.dart';

class AddToShelfPage extends StatelessWidget {
  final BookVO? book;

  AddToShelfPage({
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AddToShelfBloc(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: COLOR_WHITE,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back,
              color: COLOR_GREY_3,
            ),
          ),
          title: Text(
            ADD_TO_SHELF,
            style: TextStyle(
              color: COLOR_GREY_3,
            ),
          ),
        ),
        body: Selector<AddToShelfBloc, List<ShelfVO>?>(
          selector: (BuildContext context, AddToShelfBloc bloc) =>
              bloc.mShelfList,
          builder: (BuildContext context, shelfList, Widget? child) =>
              shelfList == null
                  ? LoadingView()
                  : Container(
                      margin: EdgeInsets.symmetric(
                        vertical: MARGIN_MEDIUM,
                      ),
                      child: ShelfListSectionView(
                        shelfList: shelfList,
                        onTapShelf: (shelfId) =>
                            _addBookToShelfAndPop(context, shelfId),
                        onTapCreateNew: () =>
                            _navigateToCreateNewShelfPage(context),
                      ),
                    ),
        ),
      ),
    );
  }

  void _addBookToShelfAndPop(BuildContext context, String shelfId) {
    final AddToShelfBloc bloc =
        Provider.of<AddToShelfBloc>(context, listen: false);
    bloc.onTapShelf(shelfId, book);
    Navigator.of(context).pop();
  }

  void _navigateToCreateNewShelfPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => CreateNewShelfPage(),
      ),
    );
  }
}
