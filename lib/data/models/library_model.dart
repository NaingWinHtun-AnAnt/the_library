import 'package:the_library/data/vos/book_by_list_name_vo.dart';
import 'package:the_library/data/vos/book_list_result_vo.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/search_book_vo.dart';

abstract class LibraryModel {
  /// from network
  /// from nyt
  void getBookList(String publishedDate);

  void getBookListByListName(String bookListName);

  /// from google
  Future<List<SearchBookVO>> searchBook(String searchText);

  /// save book if user click on that book
  void saveMyBook(BookVO book);

  /// from database
  Stream<BookListResultVO?> getBookListFromDatabase(String publishedDate);

  Stream<List<BookByListNameVO>> getBookListByListNameFromDatabase(
    String bookListName,
  );

  Stream<List<BookVO>> getMyBookFromDatabase();
}
