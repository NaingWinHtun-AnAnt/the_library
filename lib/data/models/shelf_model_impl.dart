import 'package:stream_transform/stream_transform.dart';
import 'package:the_library/data/models/shelf_model.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/shelf_vo.dart';
import 'package:the_library/persistence/daos/impls/shelf_dao_impl.dart';
import 'package:the_library/persistence/daos/shelf_dao.dart';
import 'package:uuid/uuid.dart';

class ShelfModelImpl extends ShelfModel {
  static final ShelfModelImpl _singleton = ShelfModelImpl._internal();

  factory ShelfModelImpl() => _singleton;

  ShelfModelImpl._internal();

  /// daos
  ShelfDao _mShelfDao = ShelfDaoImpl();

  /// for test
  void setDao({required ShelfDao shelfDao}) {
    _mShelfDao = shelfDao;
  }

  /// shelf
  @override
  void createNewShelf(String name) {
    final shelf = ShelfVO(id: Uuid().v1(), name: name, books: []);
    _mShelfDao.createNewShelf(shelf);
  }

  @override
  Stream<List<ShelfVO>> getAllShelfList() {
    return _mShelfDao
        .getShelfEventStream()
        .startWith(_mShelfDao.getShelfListStream())
        .map((event) => _mShelfDao.getShelfListFirstTime());
  }

  @override
  Stream<ShelfVO?>? getShelfById(String shelfId) {
    return _mShelfDao.getShelfStream(shelfId);
  }

  @override
  Stream<ShelfVO?>? renameShelf(String shelfId, String shelfName) {
    return _mShelfDao
        .getShelfEventStream()
        .startWith(_mShelfDao.getShelfRenameStream(shelfId, shelfName))
        .map((event) => _mShelfDao.getShelfById(shelfId));
  }

  @override
  void deleteShelf(String shelfId) {
    _mShelfDao.deleteShelf(shelfId);
  }

  /// shelf's book
  @override
  void addBookToShelf(String shelfId, BookVO? book) {
    _mShelfDao.addBookToShelf(shelfId, book);
  }

  @override
  void removeBookFromShelf(String shelfId, BookVO? book) {
    _mShelfDao.removeBookFromShelf(shelfId, book);
  }
}
