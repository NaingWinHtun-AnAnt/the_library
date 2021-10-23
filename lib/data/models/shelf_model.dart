import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/shelf_vo.dart';

abstract class ShelfModel {
  void createNewShelf(String name);

  Stream<List<ShelfVO>> getAllShelfList();

  Stream<ShelfVO?>? getShelfById(String shelfId);

  Stream<ShelfVO?>? renameShelf(String shelfId, String shelfName);

  void deleteShelf(String shelfId);

  void addBookToShelf(String shelfId, BookVO? book);

  void removeBookFromShelf(String shelfId, BookVO? book);
}
