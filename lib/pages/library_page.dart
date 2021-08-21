import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library/bloc/library_bloc.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/pages/book_detail_page.dart';
import 'package:the_library/pages/create_new_shelf_page.dart';
import 'package:the_library/pages/search_page.dart';
import 'package:the_library/pages/shelf_page.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/resources/strings.dart';
import 'package:the_library/viewitems/shelf_view.dart';
import 'package:the_library/widgets/book_list_section_view.dart';
import 'package:the_library/widgets/dual_teb_section_view.dart';
import 'package:the_library/widgets/loading_view.dart';
import 'package:the_library/widgets/search_bar_view.dart';
import 'package:the_library/widgets/sort_option_section_view.dart';

class LibraryPage extends StatefulWidget {
  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int selectedSortValue = 1;
  BookListLayout _bookListLayout = BookListLayout.THREE_COLUMN_GRID_VIEW;

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
                            : BookListSectionView(
                                myBookList: myBookList,
                                onTapSortButton: () =>
                                    _onTapSortButton(context),
                                onTapGridButton: (bookListLayout) =>
                                    _onTapLayoutChangeButton(bookListLayout),
                                onTapOption: () => _onTapBookItemMenu(context),
                                onTapBook: (book) =>
                                    _navigateToBookDetailPage(context, book),
                                bookLayout: _bookListLayout,
                              ),
                      ),
                    ),
                    ShelvesListSectionView(
                      onTapShelf: () => _navigateToShelfPage(context),
                      onTapCreateNew: () =>
                          _navigateToCreateNewShelfPage(context),
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

  void _onTapLayoutChangeButton(BookListLayout bookListLayout) {
    setState(() {
      _bookListLayout = bookListLayout;
    });
  }

  void _onTapSortButton(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) =>
                SortOptionSectionView(
          selectedSortValue: selectedSortValue,
          onTapSortItem: (value) => onTapSortOption(setState, value, context),
        ),
      ),
    );
  }

  void _onTapBookItemMenu(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) =>
                // BookOptionMenuView(),
                Container(),
      ),
    );
  }

  void onTapSortOption(
    void Function(void Function()) setState,
    int value,
    BuildContext context,
  ) {
    setState(() {
      selectedSortValue = value;
    });
    Navigator.of(context).pop();
  }

  void _navigateToSearchPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => SearchPage(),
      ),
    );
  }

  void _navigateToShelfPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => ShelfPage(),
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
          book: book,
        ),
      ),
    );
  }
}

class ShelvesListSectionView extends StatelessWidget {
  final Function onTapShelf;
  final Function onTapCreateNew;

  ShelvesListSectionView({
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
            itemCount: 10,
            shrinkWrap: true,
            padding: EdgeInsets.only(
              top: MARGIN_MEDIUM_2,
            ),
            itemBuilder: (BuildContext context, int index) => ShelfView(
              onTapShelf: () => onTapShelf(),
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
