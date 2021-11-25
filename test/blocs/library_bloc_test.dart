import 'package:flutter_test/flutter_test.dart';
import 'package:the_library/blocs/library_bloc.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/widgets/book_list_section_view.dart';

import '../data.models/library_model_impl_mock.dart';
import '../data.models/shelf_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("Library Block Test", () {
    LibraryBloc? libraryBloc;

    setUp(() {
      libraryBloc = LibraryBloc(
        libraryModel: LibraryModelImplMock(),
        shelfModel: ShelfModelImplMock(),
      );
    });

    /// my book list
    test("Library Bloc My Book List Test", () {
      expect(
        libraryBloc?.myBookList,
        getMyMockBook(),
      );
    });

    /// my shelf list
    test("Shelf List Test", () {
      expect(
        libraryBloc?.myShelfList,
        getMockShelf(),
      );
    });

    /// book sort test
    test("Library Book Sort Test", () {
      libraryBloc?.onTapSortButton(BookSortOption.AUTHOR);

      expect(
        libraryBloc?.myBookList?.first,
        BookVO.sortBookList(BookSortOption.AUTHOR, getMyMockBook()).first,
      );
    });

    /// book sort test
    test("Book Layout Test", () {
      libraryBloc?.onTapLayoutChangeButton(BookListLayout.LIST_VIEW);
      expect(libraryBloc?.bookListLayout, BookListLayout.LIST_VIEW);
    });
  });
}
