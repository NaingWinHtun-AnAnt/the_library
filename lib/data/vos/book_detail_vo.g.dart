// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_detail_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookDetailVOAdapter extends TypeAdapter<BookDetailVO> {
  @override
  final int typeId = 2;

  @override
  BookDetailVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookDetailVO(
      title: fields[0] as String,
      description: fields[1] as String,
      contributor: fields[2] as String,
      author: fields[3] as String,
      contributorNote: fields[4] as String,
      price: fields[5] as String,
      ageGroup: fields[6] as String,
      publisher: fields[7] as String,
      primaryIsbn13: fields[8] as String,
      primaryIsbn10: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookDetailVO obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.contributor)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.contributorNote)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.ageGroup)
      ..writeByte(7)
      ..write(obj.publisher)
      ..writeByte(8)
      ..write(obj.primaryIsbn13)
      ..writeByte(9)
      ..write(obj.primaryIsbn10);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookDetailVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDetailVO _$BookDetailVOFromJson(Map<String, dynamic> json) {
  return BookDetailVO(
    title: json['title'] as String,
    description: json['description'] as String,
    contributor: json['contributor'] as String,
    author: json['author'] as String,
    contributorNote: json['contributor_note'] as String,
    price: json['price'] as String,
    ageGroup: json['age_group'] as String,
    publisher: json['publisher'] as String,
    primaryIsbn13: json['primary_isbn13'] as String,
    primaryIsbn10: json['primary_isbn10'] as String,
  );
}

Map<String, dynamic> _$BookDetailVOToJson(BookDetailVO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'contributor': instance.contributor,
      'author': instance.author,
      'contributor_note': instance.contributorNote,
      'price': instance.price,
      'age_group': instance.ageGroup,
      'publisher': instance.publisher,
      'primary_isbn13': instance.primaryIsbn13,
      'primary_isbn10': instance.primaryIsbn10,
    };
