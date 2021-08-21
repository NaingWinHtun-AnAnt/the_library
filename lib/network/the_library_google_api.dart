import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:the_library/network/api_constants.dart';
import 'package:the_library/network/responses/search_result_response.dart';

part 'the_library_google_api.g.dart';

@RestApi(baseUrl: BASE_URL_GOOGLE_APIS)
abstract class TheLibraryGoogleApi {
  factory TheLibraryGoogleApi(Dio dio) = _TheLibraryGoogleApi;

  @GET(END_POINT_SEARCH_BOOK)
  Future<SearchResultResponse> searchBook(
    @Query(PARAM_Q) String searchText,
  );
}
