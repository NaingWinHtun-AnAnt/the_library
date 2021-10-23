import 'package:the_library/data/vos/book_list_result_vo.dart';

abstract class BookListDao {
  /// save to hive
  void saveBookResult(BookListResultVO? bookList);

  /// get from hive
  BookListResultVO? getBookResult(String publishedDate);

  /// reactive programming
  Stream<void> getBookListEventStream();

  Stream<BookListResultVO?> getBookResultStream(String publishedDate);
}
