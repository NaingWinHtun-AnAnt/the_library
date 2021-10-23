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
import 'package:the_library/persistence/daos/impls/book_by_list_name_dao_impl.dart';
import 'package:the_library/persistence/daos/impls/book_list_dao_impl.dart';
import 'package:the_library/persistence/daos/impls/my_book_dao_impl.dart';
import 'package:the_library/persistence/daos/my_book_dao.dart';

class LibraryModelImpl extends LibraryModel {
  LibraryDataAgent _mDataAgent = RetrofitDataAgentImpl();

  static final LibraryModelImpl _singleton = LibraryModelImpl._internal();

  factory LibraryModelImpl() => _singleton;

  LibraryModelImpl._internal();

  /// dao
  BookListDao _mBookListDao = BookListDaoImpl();
  BookByListNameDao _mBookByListNameDao = BookByListNameDaoImpl();
  MyBookDao _mMyBookDao = MyBookDaoImpl();

  void setDaoAndDataAgent(
    LibraryDataAgent libraryDataAgent,
    BookListDao bookListDao,
    BookByListNameDao bookByListNameDao,
    MyBookDao myBookDao,
  ) {
    _mDataAgent = libraryDataAgent;
    _mBookListDao = bookListDao;
    _mBookByListNameDao = bookByListNameDao;
    _mMyBookDao = myBookDao;
  }

  /// from network
  /// from nyt
  @override
  void getBookList(String publishedDate) {
    _mDataAgent.getBookList(publishedDate)?.then((value) {
      value?.publishedDateByAndroid = publishedDate;
      _mBookListDao.saveBookResult(value);
    });
  }

  @override
  void getBookListByListName(String date, String bookListName) {
    _mDataAgent.getBookListByListName(date, bookListName)?.then((value) {
      final List<BookByListNameVO> _bookList = value?.map((e) {
            e.listName = bookListName;
            return e;
          }).toList() ??
          [];
      _mBookByListNameDao.saveBookListByListName(_bookList);
    });
  }

  /// from google
  @override
  Future<List<SearchBookVO>?>? searchBook(String searchText) {
    return _mDataAgent.searchBook(searchText);
  }

  /// save book
  @override
  void saveMyBook(BookVO? book) {
    _mMyBookDao.saveMyBook(book);
  }

  /// from database
  @override
  Stream<BookListResultVO?> getBookListFromDatabase(String publishedDate) {
    this.getBookList(publishedDate);
    return _mBookListDao
        .getBookListEventStream()
        .startWith(_mBookListDao.getBookResultStream(publishedDate))
        .map(
          (event) => _mBookListDao.getBookResult(publishedDate),
        );
  }

  @override
  Stream<List<BookByListNameVO>> getBookListByListNameFromDatabase(
      String date, String bookListName) {
    this.getBookListByListName(date, bookListName);
    return _mBookByListNameDao
        .getBookByListNameEventStream()
        .startWith(_mBookByListNameDao.getBookByListNameStream(bookListName))
        .map((event) =>
            _mBookByListNameDao.getBookByListNameFirstTime(bookListName));
  }

  @override
  Stream<List<BookVO>> getMyBookFromDatabase() {
    return _mMyBookDao
        .getMyBookStreamEvent()
        .startWith(_mMyBookDao.getMyBookListStream())
        .map((event) => _mMyBookDao.getMyBookListFirstTime());
  }

  @override
  Future<BookVO?>? getBookDetailFromDatabase(String primaryIsbn13) {
    return Future.value(_mMyBookDao.getSingleBook(primaryIsbn13));
  }
}
