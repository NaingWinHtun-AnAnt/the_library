import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_library/bloc/book_list_by_list_name_bloc.dart';
import 'package:the_library/data/vos/book_by_list_name_vo.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/viewitems/book_list_by_list_name_view.dart';
import 'package:the_library/widgets/loading_view.dart';

class BookListByListNamePage extends StatefulWidget {
  final String listName;
  final String listNameEncoded;

  BookListByListNamePage({
    required this.listName,
    required this.listNameEncoded,
  });

  @override
  State<BookListByListNamePage> createState() => _BookListByListNamePageState();
}

class _BookListByListNamePageState extends State<BookListByListNamePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          BookListByListNameBloc(widget.listNameEncoded),
      child: Scaffold(
        body: SafeArea(
          child: Selector<BookListByListNameBloc, List<BookByListNameVO>?>(
            selector: (BuildContext context, BookListByListNameBloc bloc) =>
                bloc.bookList,
            builder: (BuildContext context, bookList, Widget? child) =>
                bookList == null
                    ? LoadingView()
                    : ListView(
                        padding: EdgeInsets.symmetric(
                          vertical: MARGIN_MEDIUM_3,
                        ),
                        children: [
                          TitleSectionView(
                            title: widget.listName,
                            onTapBackButton: () => _onTapBackButton(context),
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM,
                          ),
                          Divider(
                            color: COLOR_GREY,
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: MARGIN_MEDIUM_3,
                            ),
                            child: BookListByListNameGridView(
                              bookList: bookList,
                              onTapBook: () =>
                                  _navigateToBookDetailPage(context),
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }

  void _onTapBackButton(BuildContext context) => Navigator.of(context).pop();

  void _navigateToBookDetailPage(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => BookDetailPage(),
    //   ),
    // );
  }
}

class BookListByListNameGridView extends StatelessWidget {
  final List<BookByListNameVO> bookList;
  final Function onTapBook;

  BookListByListNameGridView({
    required this.bookList,
    required this.onTapBook,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: bookList.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => BookListByListNameView(
        bookByListName: bookList[index],
        onTapBook: () => onTapBook(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
      ),
    );
  }
}

class TitleSectionView extends StatelessWidget {
  final Function onTapBackButton;
  final String title;

  TitleSectionView({
    required this.onTapBackButton,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MARGIN_MEDIUM_3,
        ),
        GestureDetector(
          onTap: () => onTapBackButton(),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: COLOR_GREY_3,
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM,
        ),
        Text(
          title,
          style: TextStyle(
            color: COLOR_GREY_3,
            fontSize: TEXT_REGULAR_3X,
          ),
        ),
      ],
    );
  }
}
