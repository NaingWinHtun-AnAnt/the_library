import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library/blocs/shelf_bloc.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/shelf_vo.dart';
import 'package:the_library/pages/book_detail_page.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/resources/strings.dart';
import 'package:the_library/widgets/book_list_section_view.dart';
import 'package:the_library/widgets/book_option_menu_view.dart';
import 'package:the_library/widgets/loading_view.dart';
import 'package:the_library/widgets/option_view.dart';
import 'package:the_library/widgets/shelf_name_text_field_view.dart';
import 'package:the_library/widgets/sort_option_section_view.dart';

class ShelfPage extends StatelessWidget {
  final String shelfId;
  final _mTextController = TextEditingController();

  ShelfPage({
    required this.shelfId,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ShelfBloc(shelfId),
      child: Selector<ShelfBloc, ShelfVO?>(
        selector: (BuildContext context, ShelfBloc bloc) => bloc.mShelf,
        builder: (BuildContext context, shelf, Widget? child) => Scaffold(
          appBar: AppBar(
            backgroundColor: COLOR_WHITE,
            elevation: 0.0,
            leading: Selector<ShelfBloc, bool>(
              selector: (BuildContext context, ShelfBloc bloc) =>
                  bloc.isRenameShelf,
              builder: (BuildContext context, isRenameShelf, Widget? child) =>
                  isRenameShelf
                      ? GestureDetector(
                          onTap: () => _renameShelf(context, shelfId),
                          child: Icon(
                            Icons.done,
                            color: COLOR_GREY_3,
                            key: Key("EDIT_SHELF"),
                          ),
                        )
                      : GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: COLOR_GREY_3,
                            key: Key("BACK_SHELF"),
                          ),
                        ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(
                  right: MARGIN_MEDIUM_2,
                ),
                child: GestureDetector(
                  onTap: () => displayShelfOptionButtonSheet(
                    context,
                    shelfName: shelf?.name ?? "-",
                    onTapRename: () => _onTapRenameShelfOption(context),
                    onTapDelete: () =>
                        _deleteShelfAndPopToShelfListPage(context, shelfId),
                  ),
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: COLOR_GREY_3,
                    key: Key("SHELF_OPTION"),
                  ),
                ),
              ),
            ],
          ),
          body: shelf == null
              ? LoadingView()
              : ListView(
                  children: [
                    SizedBox(
                      height: MARGIN_LARGE_2,
                    ),
                    Selector<ShelfBloc, bool>(
                      selector: (BuildContext context, ShelfBloc bloc) =>
                          bloc.isRenameShelf,
                      builder:
                          (BuildContext context, isRenameShelf, Widget? child) {
                        _mTextController.text = shelf.name;
                        return isRenameShelf
                            ? Container(
                                margin: EdgeInsets.only(
                                  left: MARGIN_MEDIUM_3,
                                  right: MARGIN_MEDIUM_3,
                                  bottom: MARGIN_MEDIUM_3,
                                ),
                                child: ShelfNameTextFieldView(
                                  textController: _mTextController,
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(
                                  left: MARGIN_MEDIUM_3,
                                  right: MARGIN_MEDIUM_3,
                                  bottom: MARGIN_MEDIUM_3,
                                ),
                                child: ShelfNameView(
                                  shelfName: shelf.name,
                                ),
                              );
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: MARGIN_MEDIUM_3,
                      ),
                      child: BookCountView(
                        bookCount: shelf.books.length,
                      ),
                    ),
                    SizedBox(
                      height: MARGIN_MEDIUM,
                    ),
                    Divider(
                      color: COLOR_GREY,
                    ),
                    Selector<ShelfBloc, BookListLayout>(
                      selector: (BuildContext context, ShelfBloc bloc) =>
                          bloc.bookListLayout,
                      builder: (BuildContext context, bookListLayout,
                              Widget? child) =>
                          Selector<ShelfBloc, BookSortOption>(
                        selector: (BuildContext context, ShelfBloc bloc) =>
                            bloc.selectedSortValue,
                        builder:
                            (BuildContext context, sortValue, Widget? child) =>
                                BookListSectionView(
                          myBookList: shelf.books,
                          onTapSortButton: () => _onTapSortOptionButton(
                            context,
                            SortOptionSectionView(
                              selectedSortValue: sortValue,
                              onTapSortItem: (value) => _onTapSortOption(
                                value,
                                context,
                              ),
                            ),
                          ),
                          onTapGridButton: (bookListLayout) =>
                              _onTapChangeLayout(context, bookListLayout),
                          onTapOption: (book) =>
                              _onTapBookItemMenu(context, book),
                          onTapBook: (book) => _navigateToBookDetailPage(
                            context,
                            book,
                          ),
                          bookLayout: bookListLayout,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  void _onTapChangeLayout(BuildContext context, BookListLayout bookListLayout) {
    final ShelfBloc bloc = Provider.of<ShelfBloc>(context, listen: false);
    bloc.onTapChangeLayout(bookListLayout);
  }

  void _onTapRenameShelfOption(BuildContext context) {
    final ShelfBloc bloc = Provider.of<ShelfBloc>(context, listen: false);
    bloc.onTapRenameShelfOption();
  }

  void _renameShelf(BuildContext context, String shelfId) {
    final ShelfBloc bloc = Provider.of<ShelfBloc>(context, listen: false);
    bloc.onTapRenameShelf(shelfId, _mTextController.text);
  }

  void _deleteShelfAndPopToShelfListPage(BuildContext context, String shelfId) {
    final ShelfBloc bloc = Provider.of<ShelfBloc>(context, listen: false);
    bloc.onTapDeleteShelf(shelfId);
    Navigator.of(context).pop();
  }

  void _onTapSortOptionButton(BuildContext context, Widget bottomSheetLayout) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) =>
                bottomSheetLayout,
      ),
    );
  }

  void _onTapBookItemMenu(BuildContext context, BookVO book) {
    final ShelfBloc bloc = Provider.of<ShelfBloc>(context, listen: false);

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) =>
                BookOptionMenuView(
          book: book,
          onTapAddToShelf: (book) => bloc.onTapAddBookToShelf(shelfId, book),
          onTapRemoveFromShelf: (book) =>
              bloc.onTapRemoveBookFromShelf(shelfId, book),
        ),
      ),
    );
  }

  void _navigateToBookDetailPage(BuildContext context, BookVO book) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => BookDetailPage(
          bookPrimaryIsbn13: book.primaryIsbn13 ?? "0",
        ),
      ),
    );
  }

  void _onTapSortOption(
    BookSortOption bookSortOption,
    BuildContext context,
  ) {
    final ShelfBloc bloc = Provider.of<ShelfBloc>(context, listen: false);
    bloc.onTapSortButton(bookSortOption);
    Navigator.of(context).pop();
  }

  void displayShelfOptionButtonSheet(
    BuildContext context, {
    required String shelfName,
    required Function onTapRename,
    required Function onTapDelete,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
        child: ShelfOptionSectionView(
          shelfName: shelfName,
          onTapRenameShelf: () => onTapRename(),
          onTapDeleteShelf: () => onTapDelete(),
        ),
      ),
    );
  }
}

class BookCountView extends StatelessWidget {
  final int bookCount;

  BookCountView({
    required this.bookCount,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$bookCount books",
      style: TextStyle(
        fontSize: TEXT_REGULAR_2X,
      ),
    );
  }
}

class ShelfNameView extends StatelessWidget {
  final String shelfName;

  ShelfNameView({
    required this.shelfName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      shelfName,
      style: TextStyle(
        fontSize: TEXT_HEADING_2X,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class ShelfOptionSectionView extends StatelessWidget {
  final String shelfName;
  final Function onTapRenameShelf;
  final Function onTapDeleteShelf;

  ShelfOptionSectionView({
    required this.shelfName,
    required this.onTapRenameShelf,
    required this.onTapDeleteShelf,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(
            MARGIN_MEDIUM_2,
          ),
          child: Text(
            shelfName,
            style: TextStyle(
              color: COLOR_GREY_3,
              fontSize: TEXT_REGULAR_2X,
            ),
          ),
        ),
        Divider(
          color: COLOR_GREY,
        ),
        OptionView(
          icon: Icons.edit_outlined,
          label: RENAME_SHELF,
          onTapItem: () => onTapRenameShelf(),
          key: Key(RENAME_SHELF),
        ),
        OptionView(
          icon: Icons.delete,
          label: DELETE_SHELF,
          onTapItem: () => onTapDeleteShelf(),
          key: Key(DELETE_SHELF),
        ),
      ],
    );
  }
}
