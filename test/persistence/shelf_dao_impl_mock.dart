import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/shelf_vo.dart';
import 'package:the_library/persistence/daos/shelf_dao.dart';

import '../mock_data/mock_data.dart';

class ShelfDaoImplMock extends ShelfDao {
  Map<String, ShelfVO> shelfMap = {};

  @override
  void createNewShelf(ShelfVO shelf) {
    /// no need to implement
  }

  @override
  void deleteShelf(String shelfId) {
    /// no need to implement
  }

  @override
  ShelfVO? getShelfById(String shelfId) {
    return getMockShelf().first;
  }

  @override
  Stream<void> getShelfEventStream() {
    return Stream.value(null);
  }

  @override
  List<ShelfVO> getShelfList() {
    return getMockShelf();
  }

  @override
  List<ShelfVO> getShelfListFirstTime() {
    return getMockShelf();
  }

  @override
  Stream<List<ShelfVO>> getShelfListStream() {
    return Stream.value(getMockShelf());
  }

  @override
  Stream<ShelfVO?>? getShelfRenameStream(String shelfId, String shelfName) {
    return Stream.value(getMockShelf().first);
  }

  @override
  Stream<ShelfVO?>? getShelfStream(String shelfId) {
    return Stream.value(getMockShelf().first);
  }

  @override
  ShelfVO? removeBookFromShelf(String shelfId, BookVO? book) {
    return getMockShelf().first;
  }

  @override
  ShelfVO? renameShelf(String shelfId, String shelfName) {
    return getMockShelf().first;
  }

  @override
  ShelfVO? addBookToShelf(String shelfId, BookVO? book) {
    return getMockShelf().first;
  }
}
