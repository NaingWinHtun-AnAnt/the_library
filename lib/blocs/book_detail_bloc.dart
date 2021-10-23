import 'package:flutter/cupertino.dart';
import 'package:the_library/data/models/library_model.dart';
import 'package:the_library/data/models/library_model_impl.dart';
import 'package:the_library/data/vos/book_vo.dart';

class BookDetailBloc extends ChangeNotifier {
  /// states
  BookVO? book;

  /// models
  LibraryModel _mLibraryModel = LibraryModelImpl();

  BookDetailBloc(String bookPrimaryIsbn13, {LibraryModel? libraryModel}) {
    /// for test bloc
    if (libraryModel != null) {
      _mLibraryModel = libraryModel;
    }

    /// book detail
    _mLibraryModel.getBookDetailFromDatabase(bookPrimaryIsbn13)?.then((value) {
      book = value;
      notifyListeners();
    });
  }
}
