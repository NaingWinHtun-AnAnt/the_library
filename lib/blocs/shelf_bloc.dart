import 'package:flutter/cupertino.dart';
import 'package:the_library/data/models/shelf_model.dart';
import 'package:the_library/data/models/shelf_model_impl.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/shelf_vo.dart';
import 'package:the_library/widgets/book_list_section_view.dart';

class ShelfBloc extends ChangeNotifier {
  /// states
  BookListLayout bookListLayout = BookListLayout.THREE_COLUMN_GRID_VIEW;
  BookSortOption selectedSortValue = BookSortOption.RECENTLY_OPEN;
  ShelfVO? mShelf;
  bool isRenameShelf = false;

  /// models
  ShelfModel _mShelfModel = ShelfModelImpl();

  ShelfBloc(String shelfId, {ShelfModel? shelfModel}) {
    /// for test
    if (shelfModel != null) {
      _mShelfModel = shelfModel;
    }
    _getShelf(shelfId);
  }

  /// get
  void _getShelf(String shelfId) {
    _mShelfModel.getShelfById(shelfId)?.listen((value) {
      mShelf = value;
      notifyListeners();
    });
  }

  /// sort order of book list
  void onTapSortButton(BookSortOption bookSortOption) {
    mShelf?.books = BookVO.sortBookList(bookSortOption, mShelf?.books);

    /// set select sort value
    selectedSortValue = bookSortOption;
    notifyListeners();
  }

  ///
  void onTapChangeLayout(BookListLayout bookListLayout) {
    _changeLayout(bookListLayout);
  }

  ///
  void onTapRenameShelf(String shelfId, String shelfName) {
    _reNameShelf(shelfId, shelfName);
    isRenameShelf = false;
    notifyListeners();
  }

  ///
  void onTapRenameShelfOption() {
    _reNameShelfOption();
    notifyListeners();
  }

  ///
  void onTapDeleteShelf(String shelfId) {
    _deleteShelf(shelfId);
  }

  ///
  void onTapAddBookToShelf(String shelfId, BookVO? book) {
    _addBookToShelf(shelfId, book);
  }

  ///
  void onTapRemoveBookFromShelf(String shelfId, BookVO? book) {
    _removeBookFromShelf(shelfId, book);
    _getShelf(shelfId);
  }

  /// rename option
  void _reNameShelfOption() {
    isRenameShelf = true;
  }

  /// change book layout
  void _changeLayout(BookListLayout layout) {
    bookListLayout = layout;
    notifyListeners();
  }

  /// rename shelf
  void _reNameShelf(String shelfId, String shelfName) {
    _mShelfModel
        .renameShelf(
      shelfId,
      shelfName,
    )
        ?.listen((event) {
      mShelf = event;
    });
  }

  /// rename shelf
  void _deleteShelf(String shelfId) {
    _mShelfModel.deleteShelf(shelfId);
  }

  /// add book to shelf
  void _addBookToShelf(String shelfId, BookVO? book) {
    _mShelfModel.addBookToShelf(shelfId, book);
  }

  /// remove book to shelf
  void _removeBookFromShelf(String shelfId, BookVO? book) {
    _mShelfModel.removeBookFromShelf(shelfId, book);
  }
}
