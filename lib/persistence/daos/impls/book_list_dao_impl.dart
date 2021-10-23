import 'package:hive/hive.dart';
import 'package:the_library/data/vos/book_list_result_vo.dart';
import 'package:the_library/persistence/daos/book_list_dao.dart';
import 'package:the_library/persistence/hive_constants.dart';

class BookListDaoImpl extends BookListDao{
  static final BookListDaoImpl _singleton = BookListDaoImpl._internal();

  factory BookListDaoImpl() => _singleton;

  BookListDaoImpl._internal();

  /// save to hive
  void saveBookResult(BookListResultVO? bookList) async {
    if (bookList != null)
      await _getBookListBox().put(bookList.publishedDateByAndroid, bookList);
  }

  /// get from hive
  BookListResultVO? getBookResult(String publishedDate) {
    return _getBookListBox().get(publishedDate);
  }

  /// reactive programming
  Stream<void> getBookListEventStream() {
    return _getBookListBox().watch();
  }

  Stream<BookListResultVO?> getBookResultStream(String publishedDate) {
    return Stream.value(getBookResult(publishedDate));
  }

  /// book box
  Box<BookListResultVO> _getBookListBox() {
    return Hive.box(BOX_NAME_BOOK_LIST_RESULT_VO);
  }
}
