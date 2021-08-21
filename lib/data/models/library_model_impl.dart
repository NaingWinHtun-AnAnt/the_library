import 'package:stream_transform/stream_transform.dart';
import 'package:the_library/data/models/library_model.dart';
import 'package:the_library/data/vos/book_by_list_name_vo.dart';
import 'package:the_library/data/vos/book_list_result_vo.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/data/vos/search_book_vo.dart';
import 'package:the_library/network/agents/library_data_agent.dart';
import 'package:the_library/network/agents/retrofit_data_agent_impl.dart';
import 'package:the_library/persistence/daos/book_by_list_name_dao.dart';
import 'package:the_library/persistence/daos/book_list_dao.dart';
import 'package:the_library/persistence/daos/my_book_dao.dart';

class LibraryModelImpl extends LibraryModel {
  final LibraryDataAgent _mDataAgent = RetrofitDataAgentImpl();

  static final LibraryModelImpl _singleton = LibraryModelImpl._internal();

  factory LibraryModelImpl() => _singleton;

  LibraryModelImpl._internal();

  /// dao
  final _mBookListDao = BookListDao();
  final _mBookByListNameDao = BookByListNameDao();
  final _mMyBookDao = MyBookDao();

  /// from network
  /// from nyt
  @override
  void getBookList(String publishedDate) {
    _mDataAgent.getBookList(publishedDate).then((value) {
      value.publishedDateByAndroid = publishedDate;
      _mBookListDao.saveBookResult(value);
    });
  }

  @override
  void getBookListByListName(String bookListName) {
    _mDataAgent.getBookListByListName(bookListName).then((value) {
      _mBookByListNameDao.saveBookListByListName(value);
    });
  }

  /// from google
  @override
  Future<List<SearchBookVO>> searchBook(String searchText) {
    return _mDataAgent.searchBook(searchText);
  }

  /// save book
  @override
  void saveMyBook(BookVO book) {
    _mMyBookDao.saveMyBook(book);
  }

  /// from database
  @override
  Stream<BookListResultVO?> getBookListFromDatabase(String publishedDate) {
    this.getBookList(publishedDate);
    return _mBookListDao
        .getBookListEventStream()
        .startWith(_mBookListDao.getBookResultStream(publishedDate))
        .combineLatest(_mBookListDao.getBookResultStream(publishedDate),
            (event, bookListResult) => bookListResult as BookListResultVO);

    /// TODO("ASK WHY??")
    // .map(
    //   (event) => _mBookListDao.getBookResultFirstTime(publishedDate),
    // );
  }

  @override
  Stream<List<BookByListNameVO>> getBookListByListNameFromDatabase(
      String bookListName) {
    this.getBookListByListName(bookListName);
    return _mBookByListNameDao
        .getBookByListNameEventStream()
        .startWith(_mBookByListNameDao.getBookByListNameStream())
        .map((event) => _mBookByListNameDao.getBookByListNameFirstTime());
    // .combineLatest(
    //     _mBookByListNameDao.getBookByListNameStream(),
    //     (event, bookListResult) =>
    //         bookListResult as List<BookByListNameVO>);
  }

  @override
  Stream<List<BookVO>> getMyBookFromDatabase() {
    return _mMyBookDao
        .getMyBookStreamEvent()
        .startWith(_mMyBookDao.getMyBookListStream())
        .map((event) => _mMyBookDao.getMyBookListFirstTime());
  }
}
