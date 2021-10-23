import 'package:flutter_test/flutter_test.dart';
import 'package:the_library/blocs/search_bloc.dart';

import '../data.models/library_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("Search Bloc", () {
    SearchBloc? searchBloc;

    setUp(() {
      searchBloc = SearchBloc(libraryModel: LibraryModelImplMock());
    });

    /// search book test(Library Model)
    test("Search Book Test", () async {
      /// need to search first
      /// and wait
      searchBloc?.onSearch("text");
      await Future.delayed(Duration(seconds: 2));
      expect(
        searchBloc?.mSearchResultBook,
        getMockSearchBook(),
      );
    });
  });
}
