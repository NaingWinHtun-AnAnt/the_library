import 'package:flutter/cupertino.dart';
import 'package:the_library/data/models/library_model.dart';
import 'package:the_library/data/models/library_model_impl.dart';
import 'package:the_library/data/vos/book_vo.dart';

class LibraryBloc extends ChangeNotifier {
  /// states
  List<BookVO>? myBookList;

  /// models
  final LibraryModel _mLibraryModel = LibraryModelImpl();

  LibraryBloc() {
    _mLibraryModel.getMyBookFromDatabase().listen((event) {
      myBookList = event;
      notifyListeners();
    });
  }
}
