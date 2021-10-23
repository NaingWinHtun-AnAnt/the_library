import 'package:the_library/data/models/library_model.dart';
import 'package:the_library/data/vos/book_by_list_name_vo.dart';
import 'package:the_library/data/vos/book_list_result_vo.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/search_book_vo.dart';

import '../mock_data/mock_data.dart';

class LibraryModelImplMock extends LibraryModel {
  @override
  Future<BookVO?>? getBookDetailFromDatabase(String primaryIsbn13) {
    return Future.value(getMyMockBook().first);
  }

  @override
  void getBookList(String publishedDate) {
    /// no need to implement
  }

  @override
  void getBookListByListName(String date, String bookListName) {
    /// no need to implement
  }

  @override
  Stream<List<BookByListNameVO>> getBookListByListNameFromDatabase(
      String date, String bookListName) {
    return Stream.value(getMockBookByListName());
  }

  @override
  Stream<BookListResultVO?> getBookListFromDatabase(String publishedDate) {
    return Stream.value(getMockBookList());
  }

  @override
  Stream<List<BookVO>> getMyBookFromDatabase() {
    return Stream.value(getMyMockBook());
  }

  @override
  void saveMyBook(BookVO? book) {
    /// no need to implement
  }

  @override
  Future<List<SearchBookVO>?>? searchBook(String searchText) {
    return Future.value(getMockSearchBook());
  }
}
