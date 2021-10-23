import 'package:the_library/data/vos/book_by_list_name_vo.dart';

abstract class BookByListNameDao {
  /// save
  void saveBookListByListName(List<BookByListNameVO> bookByListName);

  /// get
  List<BookByListNameVO> getBookListByListName(String listName);

  /// reactive programming
  Stream<void> getBookByListNameEventStream();

  /// book by list name stream
  Stream<List<BookByListNameVO>> getBookByListNameStream(String listName);

  /// handle hive is empty
  List<BookByListNameVO> getBookByListNameFirstTime(String listName);
}
