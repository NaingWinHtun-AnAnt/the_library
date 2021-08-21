import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:the_library/network/api_constants.dart';
import 'package:the_library/network/responses/book_list_by_list_name_response.dart';
import 'package:the_library/network/responses/book_list_response.dart';

part 'the_library_nyt_api.g.dart';

@RestApi(baseUrl: BASE_URL_NYT)
abstract class TheLibraryNYTApi {
  factory TheLibraryNYTApi(
    Dio dio,
  ) = _TheLibraryNYTApi;

  @GET(END_POINT_GET_BOOK_LIST)
  Future<BookListResponse> getBookList(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_PUBLISHED_DATE) String publishedDate,
  );

  @GET(END_POINT_GET_BOOK_BY_LIST_NAME)
  Future<BookListByListNameResponse> getBookListByListName(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_BOOK_LIST_ENCODED_NAME) String bookListName,
  );
}
