import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/shelf_vo.dart';
import 'package:the_library/persistence/daos/shelf_dao.dart';

import '../mock_data/mock_data.dart';

class ShelfDaoImplMock extends ShelfDao {
  Map<String, ShelfVO> shelfMap = {};

  @override
  void createNewShelf(ShelfVO shelf) {
    final _mShelf = ShelfVO(id: "id", name: shelf.name, books: shelf.books);
    shelfMap[_mShelf.id] = _mShelf;
  }

  @override
  void deleteShelf(String shelfId) {
    shelfMap.remove("id");
  }

  @override
  ShelfVO? getShelfById(String shelfId) {
    return shelfMap["id"];
    // return getMockShelf().first;
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
    shelfMap["id"] = ShelfVO(id: "id", name: "Rename Shelf", books: []);
    return Stream.value(getShelfById(shelfId));
  }

  @override
  Stream<ShelfVO?>? getShelfStream(String shelfId) {
    return Stream.value(getShelfById(shelfId));
  }

  @override
  ShelfVO? removeBookFromShelf(String shelfId, BookVO? book) {
    return getShelfById(shelfId);
  }

  @override
  ShelfVO? renameShelf(String shelfId, String shelfName) {
    return shelfMap[shelfId];
  }

  @override
  ShelfVO? addBookToShelf(String shelfId, BookVO? book) {
    return getShelfById(shelfId);
  }
}
