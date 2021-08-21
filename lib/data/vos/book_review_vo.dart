import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/persistence/hive_constants.dart';

part 'book_review_vo.g.dart';

@HiveType(
    typeId: HIVE_TYPE_ID_BOOK_REVIEW_VO, adapterName: "BookReviewVOAdapter")
@JsonSerializable()
class BookReviewVO {
  @HiveField(0)
  @JsonKey(name: "book_review_link")
  String bookReviewLink;

  @HiveField(1)
  @JsonKey(name: "first_chapter_link")
  String firstChapterLink;

  @HiveField(2)
  @JsonKey(name: "sunday_review_link")
  String sundayReviewLink;

  @HiveField(3)
  @JsonKey(name: "article_chapter_link")
  String articleChapterLink;

  BookReviewVO({
    required this.bookReviewLink,
    required this.firstChapterLink,
    required this.sundayReviewLink,
    required this.articleChapterLink,
  });

  factory BookReviewVO.fromJson(Map<String, dynamic> json) =>
      _$BookReviewVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookReviewVOToJson(this);
}
