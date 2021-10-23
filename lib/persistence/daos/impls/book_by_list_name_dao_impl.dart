import 'package:hive/hive.dart';
import 'package:the_library/data/vos/book_by_list_name_vo.dart';
import 'package:the_library/persistence/daos/book_by_list_name_dao.dart';
import 'package:the_library/persistence/hive_constants.dart';

class BookByListNameDaoImpl extends BookByListNameDao {
  static final BookByListNameDaoImpl _singleton =
      BookByListNameDaoImpl._internal();

  factory BookByListNameDaoImpl() => _singleton;

  BookByListNameDaoImpl._internal();

  /// save
  void saveBookListByListName(List<BookByListNameVO> bookByListName) async {
    final Map<String, BookByListNameVO> _bookByListNameMap = Map.fromIterable(
      bookByListName,
      key: (book) => book.isbns[0].isbn13,
      value: (book) => book,
    );
    await _getBookByListNameBox().putAll(_bookByListNameMap);
  }

  /// get
  List<BookByListNameVO> getBookListByListName(String listName) {
    return _getBookByListNameBox()
        .values
        .where((element) => element.listName == listName)
        .toList();
  }

  /// reactive programming
  Stream<void> getBookByListNameEventStream() {
    return _getBookByListNameBox().watch();
  }

  /// book by list name stream
  Stream<List<BookByListNameVO>> getBookByListNameStream(String listName) {
    return Stream.value(getBookListByListName(listName));
  }

  /// handle hive is empty
  List<BookByListNameVO> getBookByListNameFirstTime(String listName) {
    if (getBookListByListName(listName).isNotEmpty)
      return getBookListByListName(listName);
    else
      return [];
  }

  Box<BookByListNameVO> _getBookByListNameBox() {
    return Hive.box(BOX_NAME_BOOK_BY_LIST_NAME_VO);
  }
}
