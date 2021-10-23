import 'package:the_library/data/vos/book_list_result_vo.dart';
import 'package:the_library/persistence/daos/book_list_dao.dart';

import '../mock_data/mock_data.dart';

class BookListDaoImplMock extends BookListDao {
  Map<String, BookListResultVO> bookListResultVOMap = {};

  @override
  void saveBookResult(BookListResultVO? bookList) {
    if (bookList != null) {
      bookListResultVOMap[bookList.publishedDate ?? ""] = bookList;
    }
  }

  @override
  BookListResultVO? getBookResult(String publishedDate) {
    return getMockBookList();
  }

  @override
  Stream<void> getBookListEventStream() {
    return Stream.value(null);
  }

  @override
  Stream<BookListResultVO?> getBookResultStream(String publishedDate) {
    return Stream.value(getMockBookList());
  }
}
