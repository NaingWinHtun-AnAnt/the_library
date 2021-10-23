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
import 'package:the_library/pages/search_page.dart';
import 'package:the_library/persistence/hive_constants.dart';
import 'package:the_library/resources/strings.dart';
import 'package:the_library/viewitems/shelf_view.dart';
import 'package:the_library/widgets/book_list_section_view.dart';
import 'package:the_library/widgets/search_bar_view.dart';
import 'package:the_library/widgets/shelf_name_text_field_view.dart';
import 'package:the_library/widgets/two_column_grid_view.dart';

import 'test_data/test_data.dart';

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

  /// book list and tap on a book and navigate to detail page
  /// add book to my book
  /// navigate to library and change layout of book
  testWidgets(
    "Tap Book and Navigate to Book Detail Page.",
    (WidgetTester tester) async {
      /// load my app page on screen
      await tester.pumpWidget(MyApp());
      await Future.delayed(Duration(seconds: 2));

      await tester.pumpAndSettle(Duration(seconds: 5));

      expect(find.byType(AppMainPage), findsOneWidget);
      expect(find.byType(HomePage), findsOneWidget);

      /// home screen books
      expect(find.text(TEST_DATA_BOOK_NAME), findsWidgets);

      /// find a book navigate to book detail
      await tester.tap(find.text(TEST_DATA_BOOK_NAME));

      await tester.pumpAndSettle(Duration(seconds: 5));

      /// detail screen
      /// find book name and author
      expect(find.text(TEST_DATA_BOOK_NAME), findsOneWidget);
      expect(find.text(TEST_DATA_AUTHOR), findsOneWidget);

      /// back
      await tester.tap(find.byKey(Key("BACK")));

      /// go back to home screen and find my book
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(find.byKey(Key("9780063142930")), findsOneWidget);

      /// go to library
      await tester.tap(find.byKey(Key("LIBRARY")));
      await tester.pumpAndSettle(Duration(seconds: 5));

      /// find library page
      expect(find.byType(LibraryPage), findsOneWidget);

      /// find my book
      expect(find.text(TEST_DATA_BOOK_NAME), findsOneWidget);

      /// tap on change layout
      /// two column to list
      await tester.tap(find.byKey(Key("CHANGE_LAYOUT")));
      await tester.pumpAndSettle(Duration(seconds: 2));
      expect(find.byType(BookListView), findsOneWidget);

      /// list to three column
      await tester.tap(find.byKey(Key("CHANGE_LAYOUT")));
      await tester.pumpAndSettle(Duration(seconds: 2));
      expect(find.byType(TwoColumnGridView), findsOneWidget);

      /// three column to two column
      await tester.tap(find.byKey(Key("CHANGE_LAYOUT")));
      await tester.pumpAndSettle(Duration(seconds: 2));
      expect(find.byType(ThreeColumnGridView), findsOneWidget);
    },
  );

  /// test for search
  testWidgets("Search Test", (WidgetTester tester) async {
    /// load my app page on screen
    await tester.pumpWidget(MyApp());
    await Future.delayed(Duration(seconds: 2));

    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.byType(AppMainPage), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);

    /// tap on search bar
    await tester.tap(find.byType(SearchBarView));
    await tester.pumpAndSettle(Duration(seconds: 2));

    /// search text
    await tester.enterText(find.byType(SearchTextView), "Hello World");
    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.textContaining("Hello"), findsWidgets);
  });

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
    await tester.tap(find.text(YOUR_SHELVES));
    await tester.pumpAndSettle(Duration(seconds: 2));

    /// create new shelf button and navigate to shelf create view
    await tester.tap(find.text(CREATE_NEW));
    await tester.pumpAndSettle(Duration(seconds: 3));

    /// enter text to text field
    await tester.enterText(
        find.byType(ShelfNameTextFieldView), "Book For Later");

    /// done button tap and will be back to shelf list page
    await tester.tap(find.byKey(Key(CREATE_NEW)));
    await tester.pumpAndSettle(Duration(seconds: 3));

    /// check create new shelf is exist or not
    expect(find.text("Book For Later"), findsOneWidget);

    /// shelf detail
    await tester.tap(find.byType(ShelfView));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// rename shelf
    await tester.tap(find.byKey(Key("SHELF_OPTION")));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// tap on rename shelf option and edit shelf name
    /// save and back to shelf list page
    await tester.tap(find.byKey(Key(RENAME_SHELF)));
    await tester.pumpAndSettle(Duration(seconds: 5));
    await tester.enterText(find.byType(ShelfNameTextFieldView), "Edited Shelf");
    await tester.pumpAndSettle(Duration(seconds: 3));
    await tester.tap(find.byKey(Key("EDIT_SHELF")));
    await tester.pumpAndSettle(Duration(seconds: 3));
    await tester.tap(find.byKey(Key("BACK_SHELF")));
    await tester.pumpAndSettle(Duration(seconds: 3));
    await Future.delayed(Duration(seconds: 3));

    /// navigate to shelf detail again
    await tester.tap(find.byType(ShelfView));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// rename shelf
    await tester.tap(find.byKey(Key("SHELF_OPTION")));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// tap on delete shelf option, back and find (result not found)
    await tester.tap(find.byKey(Key(DELETE_SHELF)));
    await tester.pumpAndSettle(Duration(seconds: 5));
    expect(find.text("Book For Later"), findsNothing);
    await Future.delayed(Duration(seconds: 3));
  });

  /// add a book to shelf test
  testWidgets("Add To Shelf Test", (WidgetTester tester) async {
    /// load my app page on screen
    await tester.pumpWidget(MyApp());
    await Future.delayed(Duration(seconds: 2));

    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.byType(AppMainPage), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);

    /// add a book to my book list
    await tester.tap(find.text(TEST_DATA_BOOK_NAME));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// back to main page
    await tester.tap(find.byKey(Key("BACK")));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// navigate to library
    await tester.tap(find.byKey(Key("LIBRARY")));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// go to shelf page and create new shelf
    /// my shelf page
    await tester.tap(find.text(YOUR_SHELVES));
    await tester.pumpAndSettle(Duration(seconds: 2));

    /// create new shelf button and navigate to shelf create view
    await tester.tap(find.text(CREATE_NEW));
    await tester.pumpAndSettle(Duration(seconds: 3));

    /// enter text to text field
    await tester.enterText(
        find.byType(ShelfNameTextFieldView), "Book For Later");

    /// done button tap and will be back to shelf list page
    await tester.tap(find.byKey(Key(CREATE_NEW)));
    await tester.pumpAndSettle(Duration(seconds: 3));

    /// go to book page
    /// my book page
    await tester.tap(find.text(YOUR_BOOKS));
    await tester.pumpAndSettle(Duration(seconds: 2));

    /// tap on book option to add this book to shelf
    await tester.tap(find.byKey(Key("BOOK_OPTION")));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// tap on add to shelf book option
    await tester.tap(find.text(ADD_TO_SHELF));
    await tester.pumpAndSettle(Duration(seconds: 1));
    await Future.delayed(Duration(seconds: 5));
    await tester.tap(find.text("Book For Later"));
    await Future.delayed(Duration(seconds: 5));

    /// navigate to shelf page
    /// check shelf
    await tester.tap(find.text(YOUR_SHELVES));
    await tester.pumpAndSettle(Duration(seconds: 5));
    await Future.delayed(Duration(seconds: 5));
    await tester.tap(find.text("Book For Later"));
    await tester.pumpAndSettle(Duration(seconds: 5));
    await Future.delayed(Duration(seconds: 5));
  });
}
