import 'package:flutter/cupertino.dart';
import 'package:the_library/data/models/library_model.dart';
import 'package:the_library/data/models/library_model_impl.dart';
import 'package:the_library/data/vos/book_by_list_name_vo.dart';
import 'package:the_library/utils/date_functions.dart';

class BookListByListNameBloc extends ChangeNotifier {
  /// states
  List<BookByListNameVO>? bookList;

  /// models
  LibraryModel _mLibraryModel = LibraryModelImpl();

  BookListByListNameBloc(String listNameEncoded, {LibraryModel? libraryModel}) {
    /// for test
    if (libraryModel != null) {
      _mLibraryModel = libraryModel;
    }

    /// from network
    _mLibraryModel
        .getBookListByListNameFromDatabase(getFormattedDate(), listNameEncoded)
        .listen((value) {
      bookList = value;
      notifyListeners();
    });
  }
}
