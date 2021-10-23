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
      bookImage: fields[0] as String?,
      title: fields[1] as String?,
      author: fields[2] as String?,
      isbns: (fields[3] as List?)?.cast<IsbnVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, BookByListNameVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.bookImage)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.isbns);
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

BookByListNameVO _$BookByListNameVOFromJson(Map<String, dynamic> json) =>
    BookByListNameVO(
      bookImage: json['book_image'] as String?,
      title: json['title'] as String?,
      author: json['author'] as String?,
      isbns: (json['isbns'] as List<dynamic>?)
          ?.map((e) => IsbnVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookByListNameVOToJson(BookByListNameVO instance) =>
    <String, dynamic>{
      'book_image': instance.bookImage,
      'title': instance.title,
      'author': instance.author,
      'isbns': instance.isbns,
    };
