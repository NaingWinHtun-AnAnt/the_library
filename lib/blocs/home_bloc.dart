import 'package:flutter/cupertino.dart';
import 'package:the_library/data/models/library_model.dart';
import 'package:the_library/data/models/library_model_impl.dart';
import 'package:the_library/data/vos/book_list_vo.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/utils/date_functions.dart';

class HomeBloc extends ChangeNotifier {
  /// states
  List<BookListVO>? bookList;
  List<BookVO>? myBookList;

  /// models
  LibraryModel _mLibraryModel = LibraryModelImpl();

  HomeBloc({LibraryModel? libraryModel}) {
    if (libraryModel != null) {
      _mLibraryModel = libraryModel;
    }

    /// from database
    /// my read book
    _mLibraryModel.getMyBookFromDatabase().listen((value) {
      myBookList = value;
      notifyListeners();
    });

    /// book list
    _mLibraryModel.getBookListFromDatabase(getFormattedDate()).listen((value) {
      if (value != null) {
        bookList = value.lists;
        notifyListeners();
      }
    });
  }

  ///
  void onTapBook(BookVO? book) {
    _saveBook(book);
  }

  /// save user clicked book
  void _saveBook(BookVO? book) {
    _mLibraryModel.saveMyBook(book);
  }
}
