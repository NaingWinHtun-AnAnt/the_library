import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:integration_test/integration_test.dart';
import 'package:the_library/data/vos/book_by_list_name_vo.dart';
import 'package:the_library/data/vos/book_detail_vo.dart';
import 'package:the_library/data/vos/book_list_result_vo.dart';
import 'package:the_library/data/vos/book_list_vo.dart';
import 'package:the_library/data/vos/book_review_vo.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/buy_link_vo.dart';
import 'package:the_library/data/vos/isbn_vo.dart';
import 'package:the_library/data/vos/shelf_vo.dart';
import 'package:the_library/main.dart';
import 'package:the_library/pages/app_main_page.dart';
import 'package:the_library/pages/home_page.dart';
import 'package:the_library/pages/library_page.dart';
import 'package:the_library/persistence/hive_constants.dart';
import 'package:the_library/resources/strings.dart';
import 'package:the_library/viewitems/shelf_view.dart';
import 'package:the_library/widgets/shelf_name_text_field_view.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(BookByListNameVOAdapter());
  Hive.registerAdapter(IsbnVOAdapter());
  Hive.registerAdapter(BookDetailVOAdapter());
  Hive.registerAdapter(BookReviewVOAdapter());
  Hive.registerAdapter(BookListResultVOAdapter());
  Hive.registerAdapter(BookListVOAdapter());
  Hive.registerAdapter(BookVOAdapter());
  Hive.registerAdapter(BuyLinkVOAdapter());
  Hive.registerAdapter(ShelfVOAdapter());

  await Hive.openBox<BookByListNameVO>(BOX_NAME_BOOK_BY_LIST_NAME_VO);
  await Hive.openBox<BookListResultVO>(BOX_NAME_BOOK_LIST_RESULT_VO);
  await Hive.openBox<BookVO>(BOX_NAME_MY_BOOK);
  await Hive.openBox<ShelfVO>(BOX_NAME_SHELF_VO);

  /// test about shelf
  testWidgets("Create Shelf, Delete Shelf, Edit Shelf",
      (WidgetTester tester) async {
    /// load my app page on screen
    await tester.pumpWidget(MyApp());
    await Future.delayed(Duration(seconds: 2));

    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.byType(AppMainPage), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);

    /// navigate to library
    await tester.tap(find.byKey(Key("LIBRARY")));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// find library page
    expect(find.byType(LibraryPage), findsOneWidget);

    /// my shelf page
    expect(find.text(YOUR_SHELVES), findsOneWidget);
    await tester.tap(find.text(YOUR_SHELVES));
    await tester.pumpAndSettle(Duration(seconds: 2));

    /// create new shelf button and navigate to shelf create view
    expect(find.text(CREATE_NEW), findsOneWidget);
    await tester.tap(find.text(CREATE_NEW));
    await tester.pumpAndSettle(Duration(seconds: 3));

    /// enter text to text field
    expect(find.byType(ShelfNameTextFieldView), findsOneWidget);
    await tester.enterText(
        find.byType(ShelfNameTextFieldView), "Book For Later");

    /// done button tap and will be back to shelf list page
    expect(find.byKey(Key(CREATE_NEW)), findsOneWidget);
    await tester.tap(find.byKey(Key(CREATE_NEW)));
    await tester.pumpAndSettle(Duration(seconds: 3));

    /// check create new shelf is exist or not
    expect(find.text("Book For Later"), findsOneWidget);

    /// shelf detail
    expect(find.byType(ShelfView), findsWidgets);
    await tester.tap(find.byType(ShelfView));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// rename shelf
    expect(find.byKey(Key("SHELF_OPTION")), findsOneWidget);
    await tester.tap(find.byKey(Key("SHELF_OPTION")));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// tap on rename shelf option and edit shelf name
    /// save and back to shelf list page
    expect(find.byKey(Key(RENAME_SHELF)), findsOneWidget);
    await tester.tap(find.byKey(Key(RENAME_SHELF)));
    await tester.pumpAndSettle(Duration(seconds: 5));
    await tester.pump(Duration(seconds: 2));
    await tester.enterText(find.byType(ShelfNameTextFieldView), "Edited Shelf");
    await tester.pumpAndSettle(Duration(seconds: 3));
    expect(find.byKey(Key("EDIT_SHELF")), findsOneWidget);
    await tester.tap(find.byKey(Key("EDIT_SHELF")));
    await tester.pumpAndSettle(Duration(seconds: 3));
    expect(find.byKey(Key("BACK_SHELF")), findsOneWidget);
    await tester.tap(find.byKey(Key("BACK_SHELF")));
    await tester.pumpAndSettle(Duration(seconds: 3));
    await Future.delayed(Duration(seconds: 3));

    /// rename shelf
    expect(find.text("Edited Shelf"), findsNothing);
    await Future.delayed(Duration(seconds: 3));

    /// navigate to shelf detail again
    expect(find.byType(ShelfView), findsOneWidget);
    await tester.tap(find.byType(ShelfView));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// delete shelf shelf
    await tester.tap(find.byKey(Key("SHELF_OPTION")));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// tap on delete shelf option, back and find (result not found)
    expect(find.byKey(Key(DELETE_SHELF)), findsOneWidget);
    await tester.tap(find.byKey(Key(DELETE_SHELF)));
    await tester.pumpAndSettle(Duration(seconds: 5));
    expect(find.text("Book For Later"), findsNothing);
    await Future.delayed(Duration(seconds: 3));
  });
}
