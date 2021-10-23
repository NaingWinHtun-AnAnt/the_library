import 'package:the_library/data/vos/book_by_list_name_vo.dart';
import 'package:the_library/data/vos/book_list_result_vo.dart';
import 'package:the_library/data/vos/search_book_vo.dart';
import 'package:the_library/network/agents/library_data_agent.dart';

import '../mock_data/mock_data.dart';

class LibraryDataAgentImplMock extends LibraryDataAgent {
  @override
  Future<BookListResultVO?>? getBookList(String publishedDate) {
    return Future.value(getMockBookList());
  }

  @override
  Future<List<BookByListNameVO>?>? getBookListByListName(
    String date,
    String bookListName,
  ) {
    return Future.value(getMockBookByListName());
  }

  @override
  Future<List<SearchBookVO>?>? searchBook(String searchText) {
    return Future.value(getMockSearchBook());
  }
}
