// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_by_list_name_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookByListNameVOAdapter extends TypeAdapter<BookByListNameVO> {
  @override
  final int typeId = 0;

  @override
  BookByListNameVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookByListNameVO(
      listName: fields[0] as String,
      displayName: fields[1] as String,
      bestsellersDate: fields[2] as String,
      publishedDate: fields[3] as String,
      rank: fields[4] as int,
      rankLastWeek: fields[5] as int,
      weeksOnList: fields[6] as int,
      asterisk: fields[7] as int,
      dagger: fields[8] as int,
      amazonProductUrl: fields[9] as String,
      isbns: (fields[10] as List).cast<IsbnVO>(),
      bookDetails: (fields[11] as List).cast<BookDetailVO>(),
      reviews: (fields[12] as List).cast<BookReviewVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, BookByListNameVO obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.listName)
      ..writeByte(1)
      ..write(obj.displayName)
      ..writeByte(2)
      ..write(obj.bestsellersDate)
      ..writeByte(3)
      ..write(obj.publishedDate)
      ..writeByte(4)
      ..write(obj.rank)
      ..writeByte(5)
      ..write(obj.rankLastWeek)
      ..writeByte(6)
      ..write(obj.weeksOnList)
      ..writeByte(7)
      ..write(obj.asterisk)
      ..writeByte(8)
      ..write(obj.dagger)
      ..writeByte(9)
      ..write(obj.amazonProductUrl)
      ..writeByte(10)
      ..write(obj.isbns)
      ..writeByte(11)
      ..write(obj.bookDetails)
      ..writeByte(12)
      ..write(obj.reviews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookByListNameVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookByListNameVO _$BookByListNameVOFromJson(Map<String, dynamic> json) {
  return BookByListNameVO(
    listName: json['list_name'] as String,
    displayName: json['display_name'] as String,
    bestsellersDate: json['bestsellers_date'] as String,
    publishedDate: json['published_date'] as String,
    rank: json['rank'] as int,
    rankLastWeek: json['rank_last_week'] as int,
    weeksOnList: json['weeks_on_list'] as int,
    asterisk: json['asterisk'] as int,
    dagger: json['dagger'] as int,
    amazonProductUrl: json['amazon_product_url'] as String,
    isbns: (json['isbns'] as List<dynamic>)
        .map((e) => IsbnVO.fromJson(e as Map<String, dynamic>))
        .toList(),
    bookDetails: (json['book_details'] as List<dynamic>)
        .map((e) => BookDetailVO.fromJson(e as Map<String, dynamic>))
        .toList(),
    reviews: (json['reviews'] as List<dynamic>)
        .map((e) => BookReviewVO.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BookByListNameVOToJson(BookByListNameVO instance) =>
    <String, dynamic>{
      'list_name': instance.listName,
      'display_name': instance.displayName,
      'bestsellers_date': instance.bestsellersDate,
      'published_date': instance.publishedDate,
      'rank': instance.rank,
      'rank_last_week': instance.rankLastWeek,
      'weeks_on_list': instance.weeksOnList,
      'asterisk': instance.asterisk,
      'dagger': instance.dagger,
      'amazon_product_url': instance.amazonProductUrl,
      'isbns': instance.isbns,
      'book_details': instance.bookDetails,
      'reviews': instance.reviews,
    };
