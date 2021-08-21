// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_by_list_name_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookListByListNameResponse _$BookListByListNameResponseFromJson(
    Map<String, dynamic> json) {
  return BookListByListNameResponse(
    status: json['status'] as String,
    copyright: json['copyright'] as String,
    num_Results: json['num_results'] as int,
    lastModified: json['last_modified'] as String,
    results: (json['results'] as List<dynamic>)
        .map((e) => BookByListNameVO.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BookListByListNameResponseToJson(
        BookListByListNameResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.num_Results,
      'last_modified': instance.lastModified,
      'results': instance.results,
    };
