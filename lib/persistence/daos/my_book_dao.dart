import 'package:hive/hive.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/persistence/hive_constants.dart';

class MyBookDao {
  static final MyBookDao _singleton = MyBookDao._internal();

  factory MyBookDao() => _singleton;

  MyBookDao._internal();

  /// save
  void saveMyBook(BookVO book) async {
    await _getBookBox().put(book.primaryIsbn13, book);
  }

  /// get
  List<BookVO> _getMyBookList() {
    return _getBookBox().values.toList();
  }

  /// reactive programming
  Stream<void> getMyBookStreamEvent() {
    return _getBookBox().watch();
  }

  Stream<List<BookVO>> getMyBookListStream() {
    return Stream.value(_getMyBookList());
  }

  /// is hive empty?
  List<BookVO> getMyBookListFirstTime() {
    if (_getMyBookList().isNotEmpty) {
      return _getMyBookList();
    } else {
      return [];
    }
  }

  /// box
  Box<BookVO> _getBookBox() {
    return Hive.box(BOX_NAME_MY_BOOK);
  }
}
