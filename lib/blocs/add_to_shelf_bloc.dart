import 'package:flutter/cupertino.dart';
import 'package:the_library/data/models/shelf_model.dart';
import 'package:the_library/data/models/shelf_model_impl.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/shelf_vo.dart';

class AddToShelfBloc extends ChangeNotifier {
  /// states
  List<ShelfVO>? mShelfList;

  /// models
  final ShelfModel _mShelfModel = ShelfModelImpl();

  AddToShelfBloc() {
    _mShelfModel.getAllShelfList().listen((event) {
      mShelfList = event;
      notifyListeners();
    });
  }

  ///
  void onTapShelf(String shelfId, BookVO? book) {
    _addBookToShelf(shelfId, book);
  }

  /// add book to shelf
  void _addBookToShelf(String shelfId, BookVO? book) {
    _mShelfModel.addBookToShelf(shelfId, book);
  }
}
