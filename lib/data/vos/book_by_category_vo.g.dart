// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_by_category_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookByCategoryVO _$BookByCategoryVOFromJson(Map<String, dynamic> json) =>
    BookByCategoryVO(
      books: (json['books'] as List<dynamic>?)
          ?.map((e) => BookByListNameVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookByCategoryVOToJson(BookByCategoryVO instance) =>
    <String, dynamic>{
      'books': instance.books,
    };
