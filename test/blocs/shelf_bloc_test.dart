import 'package:flutter_test/flutter_test.dart';
import 'package:the_library/blocs/shelf_bloc.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/widgets/book_list_section_view.dart';

import '../data.models/shelf_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("Shelf Bloc Test", () {
    ShelfBloc? shelfBloc;

    setUp(() {
      shelfBloc = ShelfBloc("shelfId", shelfModel: ShelfModelImplMock());
    });

    /// shelf list bloc test
    test("Shelf List bloc Test", () {
      expect(
        shelfBloc?.mShelf,
        getMockShelf().first,
      );
    });

    /// book sort test
    test("Shelf Book Sort Test", () {
      shelfBloc?.onTapSortButton(BookSortOption.AUTHOR);

      expect(
        shelfBloc?.mShelf?.books.first,
        BookVO.sortBookList(BookSortOption.AUTHOR, getMyMockBook()).first,
      );
    });

    /// book sort test
    test("Shelf Book Layout Test", () {
      shelfBloc?.onTapChangeLayout(BookListLayout.LIST_VIEW);
      expect(shelfBloc?.bookListLayout, BookListLayout.LIST_VIEW);
    });
  });
}
