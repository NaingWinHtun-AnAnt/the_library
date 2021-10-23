import 'package:flutter_test/flutter_test.dart';
import 'package:the_library/blocs/shelf_bloc.dart';

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
  });
}
