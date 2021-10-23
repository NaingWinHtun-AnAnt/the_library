import 'package:the_library/data/vos/book_by_list_name_vo.dart';
import 'package:the_library/data/vos/book_list_result_vo.dart';
import 'package:the_library/data/vos/search_book_vo.dart';

abstract class LibraryDataAgent {
  /// from nyt
  Future<BookListResultVO?>? getBookList(String publishedDate);

  Future<List<BookByListNameVO>?>? getBookListByListName(String date,String bookListName);

  /// from google
  Future<List<SearchBookVO>?>? searchBook(String searchText);
}
