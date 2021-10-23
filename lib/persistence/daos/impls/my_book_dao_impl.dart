import 'package:hive/hive.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/persistence/daos/my_book_dao.dart';
import 'package:the_library/persistence/hive_constants.dart';

class MyBookDaoImpl extends MyBookDao {
  static final MyBookDaoImpl _singleton = MyBookDaoImpl._internal();

  factory MyBookDaoImpl() => _singleton;

  MyBookDaoImpl._internal();

  /// save
  void saveMyBook(BookVO? book) async {
    if (book != null) await _getBookBox().put(book.primaryIsbn13, book);
  }

  /// get
  List<BookVO> getMyBookList() {
    return _getBookBox().values.toList();
  }

  /// get single book
  BookVO? getSingleBook(String primaryIsbn13) {
    return _getBookBox().get(primaryIsbn13);
  }

  /// reactive programming
  Stream<void> getMyBookStreamEvent() {
    return _getBookBox().watch();
  }

  Stream<List<BookVO>> getMyBookListStream() {
    return Stream.value(getMyBookList());
  }

  /// is hive empty?
  List<BookVO> getMyBookListFirstTime() {
    if (getMyBookList().isNotEmpty) {
      return getMyBookList();
    } else {
      return [];
    }
  }

  /// box
  Box<BookVO> _getBookBox() {
    return Hive.box(BOX_NAME_MY_BOOK);
  }
}
