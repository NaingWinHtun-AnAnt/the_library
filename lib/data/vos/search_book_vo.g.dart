// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_book_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBookVO _$SearchBookVOFromJson(Map<String, dynamic> json) {
  return SearchBookVO(
    kind: json['kind'] as String?,
    id: json['id'] as String?,
    eTag: json['etag'] as String?,
    selfLink: json['selfLink'] as String?,
    volumeInfo: json['volumeInfo'] == null
        ? null
        : VolumeInfoVO.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    saleInfo: json['saleInfo'] == null
        ? null
        : SaleInfoVO.fromJson(json['saleInfo'] as Map<String, dynamic>),
    accessInfo: json['accessInfo'] == null
        ? null
        : AccessInfoVO.fromJson(json['accessInfo'] as Map<String, dynamic>),
    searchInfo: json['searchInfo'] == null
        ? null
        : SearchBookVO.fromJson(json['searchInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SearchBookVOToJson(SearchBookVO instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'etag': instance.eTag,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo,
      'saleInfo': instance.saleInfo,
      'accessInfo': instance.accessInfo,
      'searchInfo': instance.searchInfo,
    };
