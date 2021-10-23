// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookListResponse _$BookListResponseFromJson(Map<String, dynamic> json) =>
    BookListResponse(
      status: json['status'] as String?,
      copyRight: json['copyright'] as String?,
      numResults: json['num_results'] as int?,
      results: json['results'] == null
          ? null
          : BookListResultVO.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookListResponseToJson(BookListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyRight,
      'num_results': instance.numResults,
      'results': instance.results,
    };
