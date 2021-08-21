import 'package:flutter/cupertino.dart';
import 'package:the_library/data/models/library_model.dart';
import 'package:the_library/data/models/library_model_impl.dart';
import 'package:the_library/data/vos/book_by_list_name_vo.dart';

class BookListByListNameBloc extends ChangeNotifier {
  /// states
  List<BookByListNameVO>? bookList;

  /// models
  final LibraryModel _mLibraryModel = LibraryModelImpl();

  BookListByListNameBloc(String listNameEncoded) {
    /// from network
    _mLibraryModel
        .getBookListByListNameFromDatabase(listNameEncoded)
        .listen((value) {
      bookList = value;
      notifyListeners();
    });
  }
}
