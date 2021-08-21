import 'package:hive/hive.dart';
import 'package:the_library/data/vos/book_by_list_name_vo.dart';
import 'package:the_library/persistence/hive_constants.dart';

class BookByListNameDao {
  static final BookByListNameDao _singleton = BookByListNameDao._internal();

  factory BookByListNameDao() => _singleton;

  BookByListNameDao._internal();

  /// save
  void saveBookListByListName(List<BookByListNameVO> bookByListName) async {
    final Map<String, BookByListNameVO> _bookByListNameMap = Map.fromIterable(
      bookByListName,
      key: (book) => book.isbns[0].isbn10,
      value: (book) => book,
    );
    await _getBookByListNameBox().putAll(_bookByListNameMap);
  }

  /// get
  List<BookByListNameVO> _getBookListByListName() {
    return _getBookByListNameBox().values.toList();
  }

  /// reactive programming
  Stream<void> getBookByListNameEventStream() {
    return _getBookByListNameBox().watch();
  }

  /// book by list name stream
  Stream<List<BookByListNameVO>> getBookByListNameStream() {
    return Stream.value(_getBookListByListName());
  }

  /// handle hive is empty
  List<BookByListNameVO> getBookByListNameFirstTime() {
    if (_getBookListByListName().isNotEmpty)
      return _getBookListByListName();
    else
      return [];
  }

  Box<BookByListNameVO> _getBookByListNameBox() {
    return Hive.box(BOX_NAME_BOOK_BY_LIST_NAME_VO);
  }
}
