import 'package:flutter_test/flutter_test.dart';
import 'package:the_library/blocs/library_bloc.dart';

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
  });
}
