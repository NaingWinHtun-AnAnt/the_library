import 'package:flutter_test/flutter_test.dart';
import 'package:the_library/blocs/book_detail_bloc.dart';

import '../data.models/library_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("Book Detail Block Test", () {
    BookDetailBloc? bookDetailBloc;

    setUp(() {
      bookDetailBloc = BookDetailBloc(
        "bookPrimaryIsbn13",
        libraryModel: LibraryModelImplMock(),
      );
    });

    /// book test
    test("Book Detail Test", () {
      expect(
        bookDetailBloc?.book,
        getMyMockBook().first,
      );
    });
  });
}
