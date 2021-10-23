import 'package:the_library/data/vos/book_vo.dart';

abstract class MyBookDao {
  /// save
  void saveMyBook(BookVO? book);

  /// get
  List<BookVO> getMyBookList();

  /// get single book
  BookVO? getSingleBook(String primaryIsbn13);

  /// reactive programming
  Stream<void> getMyBookStreamEvent();

  Stream<List<BookVO>> getMyBookListStream();

  /// is hive empty?
  List<BookVO> getMyBookListFirstTime();
}
