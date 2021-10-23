import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/shelf_vo.dart';

abstract class ShelfDao {
  /// shelf
  /// create new shelf
  void createNewShelf(ShelfVO shelf);

  /// get shelves
  List<ShelfVO> getShelfList();

  /// get single shelf
  ShelfVO? getShelfById(String shelfId);

  /// rename shelf
  ShelfVO? renameShelf(String shelfId, String shelfName);

  /// delete shelf
  void deleteShelf(String shelfId);

  /// shelf's book
  ShelfVO? addBookToShelf(String shelfId, BookVO? book);

  ShelfVO? removeBookFromShelf(String shelfId, BookVO? book);

  /// reactive stream
  Stream<void> getShelfEventStream();

  Stream<List<ShelfVO>> getShelfListStream();

  Stream<ShelfVO?>? getShelfStream(String shelfId);

  Stream<ShelfVO?>? getShelfRenameStream(String shelfId, String shelfName);

  /// if hive is empty or null
  List<ShelfVO> getShelfListFirstTime();
}
