import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:the_library/data/models/library_model.dart';
import 'package:the_library/data/models/library_model_impl.dart';
import 'package:the_library/data/vos/search_book_vo.dart';

class SearchBloc extends ChangeNotifier {
  /// states
  final _deBouncer = DeBouncer(milliseconds: 1000);
  List<SearchBookVO>? mSearchResultBook;

  /// models
  LibraryModel _mLibraryModel = LibraryModelImpl();

  SearchBloc({LibraryModel? libraryModel}) {
    if (libraryModel != null) {
      _mLibraryModel = libraryModel;
    }
  }

  ///
  void onSearch(String text) {
    _deBouncer.run(() => _searchBooks(text));
  }

  /// search book
  void _searchBooks(String text) {
    _mLibraryModel.searchBook(text)?.then((value) {
      if (value != null) mSearchResultBook = value;
      notifyListeners();
    });
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
