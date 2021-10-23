import 'package:flutter_test/flutter_test.dart';
import 'package:the_library/data/models/library_model_impl.dart';

import '../mock_data/mock_data.dart';
import '../network/library_data_agent_impl_mock.dart';
import '../persistence/book_by_list_name_dao_impl_mock.dart';
import '../persistence/book_list_dao_impl_mock.dart';
import '../persistence/my_book_dao_impl_mock.dart';

void main() {
  group("Home Page Test Group", () {
    var mLibraryModel = LibraryModelImpl();

    setUp(() {
      mLibraryModel.setDaoAndDataAgent(
        LibraryDataAgentImplMock(),
        BookListDaoImplMock(),
        BookByListNameDaoImplMock(),
        MyBookDaoImplMock(),
      );
    });

    /// home page book list with list name
    test("Book List With List Name", () {
      expect(
        mLibraryModel.getBookListFromDatabase("2021-05-02"),
        emits(
          getMockBookList(),
        ),
      );
    });

    /// book list by list name
    test("Get Book List By List Name", () {
      expect(
        mLibraryModel.getBookListByListNameFromDatabase(
            "2021-05-02", "bookListName"),
        emits(getMockBookByListName()),
      );
    });

    /// get my book list
    test("Get My Book List", () {
      expect(
        mLibraryModel.getMyBookFromDatabase(),
        emits(getMyMockBook()),
      );
    });

    /// book detail
    test("Get Book Detail", () {
      expect(
        mLibraryModel.getBookDetailFromDatabase("primaryIsbn13"),
        completion(getMyMockBook().first),
      );
    });

    /// search book
    test("Search Book Test", () {
      expect(
        mLibraryModel.searchBook("book"),
        completion(
          getMockSearchBook(),
        ),
      );
    });
  });
}
