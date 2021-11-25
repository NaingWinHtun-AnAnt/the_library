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
import 'package:the_library/pages/search_page.dart';
import 'package:the_library/persistence/hive_constants.dart';
import 'package:the_library/widgets/search_bar_view.dart';

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

  /// test for search
  testWidgets("Search Test", (WidgetTester tester) async {
    /// load my app page on screen
    await tester.pumpWidget(MyApp());
    await Future.delayed(Duration(seconds: 2));

    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.byType(AppMainPage), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);

    /// tap on search bar
    expect(find.byType(SearchBarView), findsOneWidget);
    await tester.tap(find.byType(SearchBarView));
    await tester.pumpAndSettle(Duration(seconds: 2));

    /// search text
    expect(find.byType(SearchTextView), findsOneWidget);
    await tester.enterText(find.byType(SearchTextView), "Hello World");
    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.textContaining("Hello"), findsWidgets);
  });
}
