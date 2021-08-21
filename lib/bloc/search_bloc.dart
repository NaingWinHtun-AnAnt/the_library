import 'package:flutter/cupertino.dart';
import 'package:the_library/data/models/library_model.dart';
import 'package:the_library/data/models/library_model_impl.dart';
import 'package:the_library/data/vos/search_book_vo.dart';

class SearchBloc extends ChangeNotifier {
  /// states
  List<SearchBookVO> _mSearchResultBook = [];

  /// models
  final LibraryModel _mLibraryModel = LibraryModelImpl();

  SearchBloc() {}

  void onTapSearch(String text) {
    _searchBooks(text);
  }

  void _searchBooks(String text) {
    _mLibraryModel.searchBook(text).then((value) {
      _mSearchResultBook = value;
      notifyListeners();
    });
  }
}
