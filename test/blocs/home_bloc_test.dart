import 'package:flutter_test/flutter_test.dart';
import 'package:the_library/blocs/home_bloc.dart';

import '../data.models/library_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("Home Page Bloc Test", () {
    HomeBloc? homeBloc;

    setUp(() {
      homeBloc = HomeBloc(libraryModel: LibraryModelImplMock());
    });

    /// book list with list name
    test("Book List", () {
      expect(
        homeBloc?.bookList,
        getMockBookList().lists,
      );
    });

    /// get my save book
    test("My Book Test", () {
      expect(
        homeBloc?.myBookList,
        getMyMockBook(),
      );
    });
  });
}
