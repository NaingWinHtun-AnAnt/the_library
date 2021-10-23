import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library/blocs/library_bloc.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/pages/add_to_shelf_page.dart';
import 'package:the_library/pages/book_detail_page.dart';
import 'package:the_library/pages/create_new_shelf_page.dart';
import 'package:the_library/pages/search_page.dart';
import 'package:the_library/pages/shelf_page.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/resources/strings.dart';
import 'package:the_library/widgets/book_list_section_view.dart';
import 'package:the_library/widgets/book_option_menu_view.dart';
import 'package:the_library/widgets/dual_teb_section_view.dart';
import 'package:the_library/widgets/loading_view.dart';
import 'package:the_library/widgets/search_bar_view.dart';
import 'package:the_library/widgets/shelf_list_section_view.dart';
import 'package:the_library/widgets/sort_option_section_view.dart';

class LibraryPage extends StatefulWidget {
  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LibraryBloc(),
      child: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              SearchBarView(
                onTapSearchBarView: () => _navigateToSearchPage(context),
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              DualTabSectionView(
                tabList: [
                  YOUR_BOOKS,
                  YOUR_SHELVES,
                ],
              ),
              Flexible(
                child: TabBarView(
                  children: [
                    Selector<LibraryBloc, List<BookVO>?>(
                      selector: (
                        BuildContext context,
                        LibraryBloc bloc,
                      ) =>
                          bloc.myBookList,
                      builder: (
                        BuildContext context,
                        myBookList,
                        Widget? child,
                      ) =>
                          SingleChildScrollView(
                        child: myBookList == null
                            ? LoadingView()
                            : Selector<LibraryBloc, BookListLayout>(
                                selector:
                                    (BuildContext context, LibraryBloc bloc) =>
                                        bloc.bookListLayout,
                                builder: (BuildContext context, bookListLayout,
                                        Widget? child) =>
                                    Selector<LibraryBloc, BookSortOption>(
                                  selector: (BuildContext context,
                                          LibraryBloc bloc) =>
                                      bloc.selectedSortValue,
                                  builder: (BuildContext context, sortValue,
                                          Widget? child) =>
                                      BookListSectionView(
                                    myBookList: myBookList,
                                    onTapSortButton: () => _onTapSortButton(
                                      context,
                                      SortOptionSectionView(
                                        selectedSortValue: sortValue,
                                        onTapSortItem: (value) =>
                                            _onTapSortOption(
                                          value,
                                          context,
                                        ),
                                      ),
                                    ),
                                    onTapGridButton: (bookListLayout) =>
                                        _onTapLayoutChangeButton(
                                            context, bookListLayout),
                                    onTapOption: (book) =>
                                        _onTapBookItemMenu(context, book),
                                    onTapBook: (book) =>
                                        _navigateToBookDetailPage(
                                            context, book),
                                    bookLayout: bookListLayout,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    // Selector<LibraryBloc, List<ShelfVO>?>(
                    //   selector: (BuildContext context, LibraryBloc bloc) =>
                    //       bloc.myShelfList,
                    //   builder:
                    //       (BuildContext context, shelfList, Widget? child) =>
                    //           ,
                    // ),
                    Consumer<LibraryBloc>(
                      builder: (BuildContext context, LibraryBloc bloc,
                          Widget? child) {
                        return ShelfListSectionView(
                          shelfList: bloc.myShelfList,
                          onTapShelf: (shelfId) =>
                              _navigateToShelfPage(context, shelfId),
                          onTapCreateNew: () =>
                              _navigateToCreateNewShelfPage(context),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapLayoutChangeButton(
      BuildContext context, BookListLayout bookListLayout) {
    final LibraryBloc bloc = Provider.of<LibraryBloc>(context, listen: false);
    bloc.onTapLayoutChangeButton(bookListLayout);
  }

  void _onTapSortButton(BuildContext context, Widget bottomSheetLayout) {
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
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) =>
                BookOptionMenuView(
          onTapAddToShelf: (book) => _navigateToAddToShelfPage(context, book),
          book: book,
        ),
      ),
    );
  }

  void _onTapSortOption(
    BookSortOption bookSortOption,
    BuildContext context,
  ) {
    final LibraryBloc bloc = Provider.of<LibraryBloc>(context, listen: false);
    bloc.onTapSortButton(bookSortOption);
    Navigator.of(context).pop();
  }

  void _navigateToAddToShelfPage(BuildContext context, BookVO? book) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => AddToShelfPage(book: book),
      ),
    );
  }

  void _navigateToSearchPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => SearchPage(),
      ),
    );
  }

  void _navigateToShelfPage(BuildContext context, String shelfId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => ShelfPage(
          shelfId: shelfId,
        ),
      ),
    );
  }

  void _navigateToCreateNewShelfPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => CreateNewShelfPage(),
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
}
