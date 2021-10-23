// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'the_library_nyt_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TheLibraryNYTApi implements TheLibraryNYTApi {
  _TheLibraryNYTApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.nytimes.com/svc/books/v3/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BookListResponse> getBookList(apiKey, publishedDate) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api-key': apiKey,
      r'published_date': publishedDate
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BookListResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'lists/overview.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BookListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BookListByListNameResponse> getBookListByListName(
      apiKey, date, bookListName) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api-key': apiKey};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BookListByListNameResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'lists/$date/$bookListName.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BookListByListNameResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
