import 'package:flutter/cupertino.dart';
import 'package:the_library/data/models/library_model.dart';
import 'package:the_library/data/models/library_model_impl.dart';
import 'package:the_library/data/models/shelf_model.dart';
import 'package:the_library/data/models/shelf_model_impl.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/shelf_vo.dart';
import 'package:the_library/widgets/book_list_section_view.dart';

class LibraryBloc extends ChangeNotifier {
  /// states
  BookListLayout bookListLayout = BookListLayout.THREE_COLUMN_GRID_VIEW;
  BookSortOption selectedSortValue = BookSortOption.RECENTLY_OPEN;
  List<BookVO>? myBookList;
  List<ShelfVO>? myShelfList;

  /// models
  LibraryModel _mLibraryModel = LibraryModelImpl();
  ShelfModel _mShelfModel = ShelfModelImpl();

  LibraryBloc({LibraryModel? libraryModel, ShelfModel? shelfModel}) {
    /// for test
    if (libraryModel != null && shelfModel != null) {
      _mLibraryModel = libraryModel;
      _mShelfModel = shelfModel;
    }

    /// my book
    _mLibraryModel.getMyBookFromDatabase().listen((event) {
      myBookList = event;
      notifyListeners();
    });

    /// my shelf
    _mShelfModel.getAllShelfList().listen((event) {
      myShelfList = event;
      notifyListeners();
    });
  }

  /// change layout
  void onTapLayoutChangeButton(BookListLayout bookListLayout) {
    _changeLayout(bookListLayout);
  }

  /// change book list layout
  void _changeLayout(BookListLayout layout) {
    bookListLayout = layout;
    notifyListeners();
  }

  /// sort order of book list
  void onTapSortButton(BookSortOption bookSortOption) {
    myBookList = BookVO.sortBookList(bookSortOption, myBookList!);

    /// set select sort value
    selectedSortValue = bookSortOption;
    notifyListeners();
  }
}
