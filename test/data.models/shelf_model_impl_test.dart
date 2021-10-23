import 'package:flutter_test/flutter_test.dart';
import 'package:the_library/data/models/shelf_model_impl.dart';

import '../mock_data/mock_data.dart';
import '../persistence/shelf_dao_impl_mock.dart';

void main() {
  group("Shelf Model Test", () {
    var shelfModel = ShelfModelImpl();

    setUp(() {
      shelfModel.setDao(shelfDao: ShelfDaoImplMock());
    });

    /// shelf list test
    test("Shelf List Test", () {
      expect(
        shelfModel.getAllShelfList(),
        emits(getMockShelf()),
      );
    });

    /// shelf test
    test("Shelf Test", () {
      expect(
        shelfModel.getShelfById("shelfId"),
        emits(getMockShelf().first),
      );
    });

  });
}
