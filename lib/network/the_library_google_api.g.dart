// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'the_library_google_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TheLibraryGoogleApi implements TheLibraryGoogleApi {
  _TheLibraryGoogleApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com/books/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SearchResultResponse> searchBook(searchText) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': searchText};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SearchResultResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'volumes',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SearchResultResponse.fromJson(_result.data!);
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
