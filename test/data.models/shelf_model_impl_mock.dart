import 'package:the_library/data/models/shelf_model.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/shelf_vo.dart';

import '../mock_data/mock_data.dart';

class ShelfModelImplMock extends ShelfModel {
  @override
  void addBookToShelf(String shelfId, BookVO? book) {
    /// no need to implement
  }

  @override
  void createNewShelf(String name) {
    /// no need to implement
  }

  @override
  void deleteShelf(String shelfId) {
    /// no need to implement
  }

  @override
  Stream<List<ShelfVO>> getAllShelfList() {
    return Stream.value(getMockShelf());
  }

  @override
  Stream<ShelfVO?>? getShelfById(String shelfId) {
    return Stream.value(getMockShelf().first);
  }

  @override
  void removeBookFromShelf(String shelfId, BookVO? book) {
    /// no need to implement
  }

  @override
  Stream<ShelfVO?>? renameShelf(String shelfId, String shelfName) {
    /// no need to implement
  }
}
