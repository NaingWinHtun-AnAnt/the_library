import 'package:hive/hive.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/shelf_vo.dart';
import 'package:the_library/persistence/daos/shelf_dao.dart';
import 'package:the_library/persistence/hive_constants.dart';

class ShelfDaoImpl extends ShelfDao {
  static final ShelfDaoImpl _singleton = ShelfDaoImpl._internal();

  factory ShelfDaoImpl() => _singleton;

  ShelfDaoImpl._internal();

  /// shelf
  /// create new shelf
  void createNewShelf(ShelfVO shelf) async {
    await _getShelfBox().put(shelf.id, shelf);
  }

  /// get shelves
  List<ShelfVO> getShelfList() {
    return _getShelfBox().values.toList();
  }

  /// get single shelf
  ShelfVO? getShelfById(String shelfId) {
    return _getShelfBox().get(shelfId);
  }

  /// rename shelf
  ShelfVO? renameShelf(String shelfId, String shelfName) {
    final _shelf = _getShelfBox().get(shelfId);
    _shelf?.name = shelfName;
    _shelf?.save();
    return _shelf;
  }

  /// delete shelf
  void deleteShelf(String shelfId) {
    _getShelfBox().delete(shelfId);
  }

  /// shelf's book
  ShelfVO? addBookToShelf(String shelfId, BookVO? book) {
    final _shelf = _getShelfBox().get(shelfId);
    if (book != null) _shelf?.books.add(book);
    _shelf?.save();
    return _shelf;
  }

  ShelfVO? removeBookFromShelf(String shelfId, BookVO? book) {
    final _shelf = _getShelfBox().get(shelfId);
    if (book != null) _shelf?.books.remove(book);
    _shelf?.save();
    return _shelf;
  }

  /// reactive stream
  Stream<void> getShelfEventStream() {
    return _getShelfBox().watch();
  }

  Stream<List<ShelfVO>> getShelfListStream() {
    return Stream.value(getShelfList());
  }

  Stream<ShelfVO?>? getShelfStream(String shelfId) {
    return Stream.value(getShelfById(shelfId));
  }

  Stream<ShelfVO?>? getShelfRenameStream(String shelfId, String shelfName) {
    return Stream.value(renameShelf(shelfId, shelfName));
  }

  /// if hive is empty or null
  List<ShelfVO> getShelfListFirstTime() {
    if (getShelfList().isNotEmpty) {
      return getShelfList();
    } else {
      return [];
    }
  }

  /// shelf box
  Box<ShelfVO> _getShelfBox() {
    return Hive.box(BOX_NAME_SHELF_VO);
  }
}
