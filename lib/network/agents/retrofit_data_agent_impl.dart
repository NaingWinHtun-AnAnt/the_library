import 'package:dio/dio.dart';
import 'package:the_library/data/vos/book_by_list_name_vo.dart';
import 'package:the_library/data/vos/book_list_result_vo.dart';
import 'package:the_library/data/vos/search_book_vo.dart';
import 'package:the_library/network/agents/library_data_agent.dart';
import 'package:the_library/network/api_constants.dart';
import 'package:the_library/network/the_library_google_api.dart';
import 'package:the_library/network/the_library_nyt_api.dart';

class RetrofitDataAgentImpl extends LibraryDataAgent {
  late TheLibraryNYTApi _mTheLibraryNYTApi;
  late TheLibraryGoogleApi _mTheLibraryGoogleApi;

  static final RetrofitDataAgentImpl _singleton =
      RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() => _singleton;

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    _mTheLibraryNYTApi = TheLibraryNYTApi(dio);
    _mTheLibraryGoogleApi = TheLibraryGoogleApi(dio);
  }

  /// from nyt
  @override
  Future<BookListResultVO> getBookList(String publishedDate) {
    return _mTheLibraryNYTApi
        .getBookList(API_KEY, publishedDate)
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<BookByListNameVO>> getBookListByListName(String bookListName) {
    return _mTheLibraryNYTApi
        .getBookListByListName(API_KEY, bookListName)
        .asStream()
        .map((event) => event.results)
        .first;
  }

  /// from google
  @override
  Future<List<SearchBookVO>> searchBook(String searchText) {
    return _mTheLibraryGoogleApi
        .searchBook(searchText)
        .asStream()
        .map((event) => event.items)
        .first;
  }
}
