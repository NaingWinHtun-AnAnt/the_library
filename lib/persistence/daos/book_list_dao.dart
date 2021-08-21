import 'package:hive/hive.dart';
import 'package:the_library/data/vos/book_list_result_vo.dart';
import 'package:the_library/persistence/hive_constants.dart';

class BookListDao {
  static final BookListDao _singleton = BookListDao._internal();

  factory BookListDao() => _singleton;

  BookListDao._internal();

  /// save to hive
  void saveBookResult(BookListResultVO bookList) async {
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

  /// if hive is empty
  BookListResultVO? getBookResultFirstTime(String publishedDate) {
    if (getBookResult(publishedDate) != null) {
      getBookResult(publishedDate);
    } else {
      return null;
    }
  }

  /// book box
  Box<BookListResultVO> _getBookListBox() {
    return Hive.box(BOX_NAME_BOOK_LIST_RESULT_VO);
  }
}
