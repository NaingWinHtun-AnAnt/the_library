import 'package:flutter/cupertino.dart';
import 'package:the_library/data/models/shelf_model.dart';
import 'package:the_library/data/models/shelf_model_impl.dart';

class CreateNewShelfBloc extends ChangeNotifier {
  final ShelfModel _mShelfModel = ShelfModelImpl();

  void onCreateNewShelf(String shelfName) {
    _createNewShelf(shelfName);
  }

  void _createNewShelf(String shelfName) {
    _mShelfModel.createNewShelf(shelfName);
  }
}
