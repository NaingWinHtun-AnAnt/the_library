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
import 'package:the_library/persistence/hive_constants.dart';
import 'package:the_library/resources/strings.dart';
import 'package:the_library/widgets/shelf_name_text_field_view.dart';

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

  /// add a book to shelf test
  testWidgets("Add To Shelf Test", (WidgetTester tester) async {
    /// load my app page on screen
    await tester.pumpWidget(MyApp());
    await Future.delayed(Duration(seconds: 2));

    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.byType(AppMainPage), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);

    /// add a book to my book list
    expect(find.text(TEST_DATA_BOOK_NAME), findsOneWidget);

    await tester.tap(find.text(TEST_DATA_BOOK_NAME));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// book detail
    expect(find.text(TEST_DATA_BOOK_NAME), findsOneWidget);
    expect(find.text(TEST_DATA_AUTHOR), findsOneWidget);

    /// back to main page
    await tester.tap(find.byKey(Key("BACK")));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// verify book by key
    expect(find.byKey(Key("9780063142930")), findsOneWidget);

    /// verify library tab and navigate to library
    expect(find.byKey(Key("LIBRARY")), findsOneWidget);
    await tester.tap(find.byKey(Key("LIBRARY")));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// go to shelf page and create new shelf
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

    /// go to book page
    /// my book page
    expect(find.text(YOUR_BOOKS), findsOneWidget);
    await tester.tap(find.text(YOUR_BOOKS));
    await tester.pumpAndSettle(Duration(seconds: 2));

    /// tap on book option to add this book to shelf
    expect(find.byKey(Key("BOOK_OPTION")), findsOneWidget);
    await tester.tap(find.byKey(Key("BOOK_OPTION")));
    await tester.pumpAndSettle(Duration(seconds: 5));

    /// tap on add to shelf book option
    expect(find.text(ADD_TO_SHELF), findsOneWidget);
    await tester.tap(find.text(ADD_TO_SHELF));
    await tester.pumpAndSettle(Duration(seconds: 1));
    await Future.delayed(Duration(seconds: 5));
    expect(find.text("Book For Later"), findsOneWidget);
    await tester.tap(find.text("Book For Later"));
    await Future.delayed(Duration(seconds: 5));

    /// navigate to shelf page
    /// check shelf
    await tester.tap(find.text(YOUR_SHELVES));
    await tester.pumpAndSettle(Duration(seconds: 5));
    await Future.delayed(Duration(seconds: 5));
    await tester.tap(find.text("Book For Later"));
    await tester.pumpAndSettle(Duration(seconds: 5));
    expect(find.text("Book For Later"), findsOneWidget);
    await Future.delayed(Duration(seconds: 5));
  });
}
