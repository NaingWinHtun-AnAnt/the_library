import 'package:the_library/data/vos/book_by_list_name_vo.dart';
import 'package:the_library/persistence/daos/book_by_list_name_dao.dart';

import '../mock_data/mock_data.dart';

class BookByListNameDaoImplMock extends BookByListNameDao {
  Map<String, BookByListNameVO> bookByListNameMap = {};

  @override
  void saveBookListByListName(List<BookByListNameVO> bookByListName) {
    bookByListName.forEach((element) {
      bookByListNameMap[element.isbns?[0].isbn13 ?? "${DateTime.now()}"] =
          element;
    });
  }

  @override
  List<BookByListNameVO> getBookListByListName(String listName) {
    return getMockBookByListName();
  }

  @override
  Stream<void> getBookByListNameEventStream() {
    return Stream.value(null);
  }

  @override
  Stream<List<BookByListNameVO>> getBookByListNameStream(String listName) {
    return Stream.value(getMockBookByListName());
  }

  @override
  List<BookByListNameVO> getBookByListNameFirstTime(String listName) {
    return getMockBookByListName();
  }
}
