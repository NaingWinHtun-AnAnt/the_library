import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/persistence/hive_constants.dart';

part 'isbn_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_ISBN_VO, adapterName: "IsbnVOAdapter")
@JsonSerializable()
class IsbnVO {
  @HiveField(0)
  @JsonKey(name: "isbn10")
  String isbn10;

  @HiveField(1)
  @JsonKey(name: "isbn13")
  String isbn13;

  IsbnVO({
    required this.isbn10,
    required this.isbn13,
  });

  factory IsbnVO.fromJson(Map<String, dynamic> json) => _$IsbnVOFromJson(json);

  Map<String, dynamic> toJson() => _$IsbnVOToJson(this);
}
