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
import 'package:the_library/widgets/book_list_section_view.dart';
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
      expect(find.byKey(Key("LIBRARY")), findsOneWidget);
      await tester.tap(find.byKey(Key("LIBRARY")));
      await tester.pumpAndSettle(Duration(seconds: 5));

      /// find library page
      expect(find.byType(LibraryPage), findsOneWidget);

      /// find my book
      expect(find.text(TEST_DATA_BOOK_NAME), findsOneWidget);

      /// tap on change layout
      /// two column to list
      expect(find.byKey(Key("CHANGE_LAYOUT")), findsOneWidget);
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
}
