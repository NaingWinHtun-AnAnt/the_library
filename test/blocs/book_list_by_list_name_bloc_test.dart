import 'package:flutter_test/flutter_test.dart';
import 'package:the_library/blocs/book_list_by_list_name_bloc.dart';

import '../data.models/library_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("Book Detail Block Test", () {
    BookListByListNameBloc? bookListByListNameBloc;

    setUp(() {
      bookListByListNameBloc = BookListByListNameBloc(
        "listNameEncoded",
        libraryModel: LibraryModelImplMock(),
      );
    });

    /// book test
    test("Book List By List Name Test", () {
      expect(
        bookListByListNameBloc?.bookList,
        getMockBookByListName(),
      );
    });
  });
}
