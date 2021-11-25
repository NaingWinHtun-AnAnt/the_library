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
      shelfModel.createNewShelf("Shelf Name");
      expect(
        shelfModel.getShelfById("shelfId"),
        emits(getShelf()),
      );
    });

    /// shelf create
    test("Create Shelf", () {
      shelfModel.createNewShelf("Shelf Name");

      expect(
        shelfModel.getShelfById("shelfId")?.map((event) => event?.name),
        emits("Shelf Name"),
      );
    });

    /// update shelf
    test("Update Shelf", () {
      shelfModel.createNewShelf("Shelf Name");
      shelfModel.renameShelf("shelfId", "Rename Shelf");

      expect(
        shelfModel.getShelfById("shelfId")?.map((event) => event?.name),
        emits("Rename Shelf"),
      );
    });

    /// remove shelf
    test("Delete Shelf", () {
      shelfModel.createNewShelf("Shelf Name");
      shelfModel.deleteShelf("shelfId");

      expect(
        shelfModel.getShelfById("shelfId")?.map((event) => event?.name),
        emits(null),
      );
    });
  });
}
