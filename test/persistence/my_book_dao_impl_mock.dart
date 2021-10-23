import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/persistence/daos/my_book_dao.dart';

import '../mock_data/mock_data.dart';

class MyBookDaoImplMock extends MyBookDao {
  Map<String, BookVO> bookMap = {};

  @override
  void saveMyBook(BookVO? book) {
    if (book != null) bookMap[book.primaryIsbn13 ?? "${DateTime.now()}"] = book;
  }

  @override
  List<BookVO> getMyBookList() {
    return getMyMockBook();
  }

  @override
  BookVO? getSingleBook(String primaryIsbn13) {
    return getMyMockBook().first;
  }

  @override
  Stream<void> getMyBookStreamEvent() {
    return Stream.value(null);
  }

  @override
  List<BookVO> getMyBookListFirstTime() {
    return getMyMockBook();
  }

  @override
  Stream<List<BookVO>> getMyBookListStream() {
    return Stream.value(getMyMockBook());
  }
}
