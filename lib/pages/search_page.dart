import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_library/data/models/library_model.dart';
import 'package:the_library/data/models/library_model_impl.dart';
import 'package:the_library/data/vos/search_book_vo.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/dimens.dart';
import 'package:the_library/resources/strings.dart';
import 'package:the_library/viewitems/search_result_view.dart';
import 'package:the_library/widgets/action_button_view.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final LibraryModel _mLibraryModel = LibraryModelImpl();
  List<SearchBookVO> _mSearchResultBook = [];
  final _deBouncer = DeBouncer(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_WHITE,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(MARGIN_MEDIUM_3),
              child: SearchTextView(
                onTextChange: (text) => _deBouncer.run(() {
                  _searchBooks(text);
                  print(text);
                }),
              ),
            ),
            _mSearchResultBook.isEmpty
                ? SearchSuggestionListView()
                : Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MARGIN_MEDIUM_2,
                    ),
                    child: SearchResultListView(
                      searchResultBookList: _mSearchResultBook,
                      onTapSearchResult: (book) =>
                          _displayDownloadDialog(context),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void _searchBooks(String text) {
    _mLibraryModel.searchBook(text).then((value) {
      setState(() {
        _mSearchResultBook = value;
      });
    });
  }

  void _displayDownloadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(
                  MARGIN_MEDIUM_3,
                ),
                child: Text(
                  "Data charges may apply",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: TEXT_REGULAR_3X,
                  ),
                ),
              ),
              Divider(
                color: COLOR_GREY_3,
                height: 0,
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                ),
                child: Text(
                  "The Witcher : LEpee de la providence",
                  style: TextStyle(
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                ),
                child: Text(
                  "You're about to download this book over a mobile or metered network. You may be charged for data usage.",
                  style: TextStyle(
                    fontSize: TEXT_REGULAR_2X,
                  ),
                ),
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                ),
                child: ButtonSectionView(
                  onTapCancel: () => Navigator.of(context).pop(),
                ),
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonSectionView extends StatelessWidget {
  final Function onTapCancel;

  ButtonSectionView({
    required this.onTapCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ActionButtonView(
            text: "Cancel",
            isGhostButton: true,
            onTapAction: () => onTapCancel(),
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM_2,
        ),
        Expanded(
          flex: 3,
          child: ActionButtonView(
            text: "Download now",
            onTapAction: () {},
          ),
        ),
      ],
    );
  }
}

class SearchSuggestionListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) =>
            SearchSuggestionView(),
      ),
    );
  }
}

class SearchSuggestionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MARGIN_MEDIUM_2,
      ),
      child: Row(
        children: [
          Icon(
            Icons.new_releases_outlined,
            color: COLOR_PRIMARY,
          ),
          SizedBox(
            width: MARGIN_MEDIUM_2,
          ),
          Text("New Release"),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  final List<SearchBookVO> searchResultBookList;
  final Function(SearchBookVO) onTapSearchResult;

  SearchResultListView({
    required this.searchResultBookList,
    required this.onTapSearchResult,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: searchResultBookList.length,
      itemBuilder: (BuildContext context, int index) => SearchResultView(
        searchBook: searchResultBookList[index],
        onTapSearchResult: (book) => onTapSearchResult(book),
      ),
    );
  }
}

class SearchTextView extends StatelessWidget {
  final Function(String) onTextChange;

  SearchTextView({
    required this.onTextChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: COLOR_GREY,
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM,
        ),
        Flexible(
          child: TextField(
            onChanged: (text) => onTextChange(text),
            decoration: InputDecoration.collapsed(
              hintText: SEARCH_BAR_LABEL,
              hintStyle: TextStyle(
                color: COLOR_GREY,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DeBouncer {
  final int? milliseconds;
  VoidCallback? action;
  Timer? _timer;

  DeBouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds!), action);
  }
}
