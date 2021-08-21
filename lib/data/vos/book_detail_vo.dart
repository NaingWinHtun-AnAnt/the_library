import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/persistence/hive_constants.dart';

part 'book_detail_vo.g.dart';

@HiveType(
    typeId: HIVE_TYPE_ID_BOOK_DETAIL_VO, adapterName: "BookDetailVOAdapter")
@JsonSerializable()
class BookDetailVO {
  @HiveField(0)
  @JsonKey(name: "title")
  String title;

  @HiveField(1)
  @JsonKey(name: "description")
  String description;

  @HiveField(2)
  @JsonKey(name: "contributor")
  String contributor;

  @HiveField(3)
  @JsonKey(name: "author")
  String author;

  @HiveField(4)
  @JsonKey(name: "contributor_note")
  String contributorNote;

  @HiveField(5)
  @JsonKey(name: "price")
  String price;

  @HiveField(6)
  @JsonKey(name: "age_group")
  String ageGroup;

  @HiveField(7)
  @JsonKey(name: "publisher")
  String publisher;

  @HiveField(8)
  @JsonKey(name: "primary_isbn13")
  String primaryIsbn13;

  @HiveField(9)
  @JsonKey(name: "primary_isbn10")
  String primaryIsbn10;

  BookDetailVO({
    required this.title,
    required this.description,
    required this.contributor,
    required this.author,
    required this.contributorNote,
    required this.price,
    required this.ageGroup,
    required this.publisher,
    required this.primaryIsbn13,
    required this.primaryIsbn10,
  });

  factory BookDetailVO.fromJson(Map<String, dynamic> json) =>
      _$BookDetailVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookDetailVOToJson(this);
}
