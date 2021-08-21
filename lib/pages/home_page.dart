import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library/bloc/home_bloc.dart';
import 'package:the_library/data/vos/book_list_vo.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/pages/book_detail_page.dart';
import 'package:the_library/pages/book_list_by_list_name_page.dart';
import 'package:the_library/pages/search_page.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/resources/strings.dart';
import 'package:the_library/viewitems/carousel_item_view.dart';
import 'package:the_library/widgets/book_option_menu_view.dart';
import 'package:the_library/widgets/dual_teb_section_view.dart';
import 'package:the_library/widgets/horizontal_book_list_view.dart';
import 'package:the_library/widgets/loading_view.dart';
import 'package:the_library/widgets/search_bar_view.dart';
import 'package:the_library/widgets/title_and_more_button_section_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeBloc(),
      child: DefaultTabController(
        length: 2,
        child: Selector<HomeBloc, List<BookListVO>?>(
          selector: (BuildContext context, homeBloc) => homeBloc.bookList,
          builder: (BuildContext context, bookList, Widget? child) => SafeArea(
            child: bookList == null
                ? LoadingView()
                : ListView(
                    padding: EdgeInsets.symmetric(
                      vertical: MARGIN_MEDIUM_2,
                    ),
                    children: [
                      SearchBarView(
                        onTapSearchBarView: () => navigateToSearchPage(context),
                      ),
                      SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      Selector<HomeBloc, List<BookVO>?>(
                        selector: (BuildContext context, HomeBloc bloc) =>
                            bloc.myBookList,
                        builder:
                            (BuildContext context, myBookList, Widget? child) =>
                                Visibility(
                          visible: myBookList!.isNotEmpty,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: MARGIN_XLARGE_2,
                            ),
                            child: CarouselSliderView(
                              myBookList: myBookList,
                              onTapOptionButton: (book) =>
                                  _onTapCarouselItemMenu(
                                context,
                                book: book,
                              ),
                            ),
                          ),
                        ),
                      ),
                      DualTabSectionView(
                        tabList: [
                          TAB_EBOOKS,
                          TAB_AUDIO_BOOKS,
                        ],
                      ),
                      BookListListView(
                        bookList: bookList,
                        onTapMoreBook: (listName, listNameEncoded) =>
                            _navigateToMoreBookPage(
                          context,
                          listName: listName,
                          listNameEncoded: listNameEncoded,
                        ),
                        onTapBook: (book) =>
                            _navigateToBookDetailPage(context, book),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  void _onTapCarouselItemMenu(BuildContext context, {required BookVO book}) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) =>
                BookOptionMenuView(
          book: book,
        ),
      ),
    );
  }

  void _navigateToMoreBookPage(
    BuildContext context, {
    required String listName,
    required String listNameEncoded,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => BookListByListNamePage(
          listName: listName,
          listNameEncoded: listNameEncoded,
        ),
      ),
    );
  }

  void _navigateToBookDetailPage(BuildContext context, BookVO book) {
    HomeBloc bloc = Provider.of<HomeBloc>(context, listen: false);
    bloc.onTapBook(book);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => BookDetailPage(
          book: book,
        ),
      ),
    );
  }

  void navigateToSearchPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => SearchPage(),
      ),
    );
  }
}

class BookListListView extends StatelessWidget {
  final List<BookListVO> bookList;
  final Function(String, String) onTapMoreBook;
  final Function(BookVO) onTapBook;

  BookListListView({
    required this.bookList,
    required this.onTapMoreBook,
    required this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => BookListSectionView(
        mBook: bookList[index],
        onTapMoreButton: (listName, listNameEncoded) => onTapMoreBook(
          listName,
          listNameEncoded,
        ),
        onTapBook: (book) => onTapBook(book),
      ),
    );
  }
}

class CarouselSliderView extends StatelessWidget {
  final List<BookVO> myBookList;
  final Function(BookVO) onTapOptionButton;

  CarouselSliderView({
    required this.myBookList,
    required this.onTapOptionButton,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.3,
        viewportFraction: 0.6,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
      ),
      itemCount: myBookList.length,
      itemBuilder: (BuildContext context, int index, int realIndex) =>
          CarouselItemView(
        book: myBookList[realIndex],
        onTapOptionButton: (book) => onTapOptionButton(book),
      ),
    );
  }
}

class BookListSectionView extends StatelessWidget {
  final BookListVO mBook;
  final Function(String listName, String listNameEncoded) onTapMoreButton;
  final Function(BookVO) onTapBook;

  BookListSectionView({
    required this.mBook,
    required this.onTapMoreButton,
    required this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
        TitleAndMoreButtonSectionView(
          title: mBook.displayName,
          onTapMoreButton: () =>
              onTapMoreButton(mBook.listName, mBook.listNameEncoded),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
        HorizontalBookListView(
          bookList: mBook.books,
          onTapBook: (book) => onTapBook(book),
        ),
      ],
    );
  }
}
