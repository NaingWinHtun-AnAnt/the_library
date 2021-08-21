import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/data/vos/buy_link_vo.dart';
import 'package:the_library/persistence/hive_constants.dart';

part 'book_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_BOOK_VO, adapterName: "BookVOAdapter")
@JsonSerializable()
class BookVO {
  @HiveField(0)
  @JsonKey(name: "age_group")
  String ageGroup;

  @HiveField(1)
  @JsonKey(name: "amazon_product_url")
  String amazonProductUrl;

  @HiveField(2)
  @JsonKey(name: "article_chapter_link")
  String articleChapterLink;

  @HiveField(3)
  @JsonKey(name: "author")
  String author;

  @HiveField(4)
  @JsonKey(name: "book_image")
  String bookImage;

  @HiveField(5)
  @JsonKey(name: "book_image_width")
  int bookImageWidth;

  @HiveField(6)
  @JsonKey(name: "book_image_height")
  int bookImageHeight;

  @HiveField(7)
  @JsonKey(name: "book_review_link")
  String bookReviewLink;

  @HiveField(8)
  @JsonKey(name: "contributor")
  String contributor;

  @HiveField(9)
  @JsonKey(name: "contributor_note")
  String contributorNote;

  @HiveField(10)
  @JsonKey(name: "created_date")
  String createdDate;

  @HiveField(11)
  @JsonKey(name: "description")
  String description;

  @HiveField(12)
  @JsonKey(name: "first_chapter_link")
  String firstChapterLink;

  @HiveField(13)
  @JsonKey(name: "price")
  String price;

  @HiveField(14)
  @JsonKey(name: "primary_isbn10")
  String primaryIsbn10;

  @HiveField(15)
  @JsonKey(name: "primary_isbn13")
  String primaryIsbn13;

  @HiveField(16)
  @JsonKey(name: "book_uri")
  String bookUri;

  @HiveField(17)
  @JsonKey(name: "publisher")
  String publisher;

  @HiveField(18)
  @JsonKey(name: "rank")
  int rank;

  @HiveField(19)
  @JsonKey(name: "rank_last_week")
  int rankLastWeek;

  @HiveField(20)
  @JsonKey(name: "sunday_review_link")
  String sundayReviewLink;

  @HiveField(21)
  @JsonKey(name: "title")
  String title;

  @HiveField(22)
  @JsonKey(name: "updated_date")
  String updatedDate;

  @HiveField(23)
  @JsonKey(name: "weeks_on_list")
  int weeksOnList;

  @HiveField(24)
  @JsonKey(name: "buy_links")
  List<BuyLinkVO> buyLinks;

  BookVO({
    required this.ageGroup,
    required this.amazonProductUrl,
    required this.articleChapterLink,
    required this.author,
    required this.bookImage,
    required this.bookImageWidth,
    required this.bookImageHeight,
    required this.bookReviewLink,
    required this.contributor,
    required this.contributorNote,
    required this.createdDate,
    required this.description,
    required this.firstChapterLink,
    required this.price,
    required this.primaryIsbn10,
    required this.primaryIsbn13,
    required this.bookUri,
    required this.publisher,
    required this.rank,
    required this.rankLastWeek,
    required this.sundayReviewLink,
    required this.title,
    required this.updatedDate,
    required this.weeksOnList,
    required this.buyLinks,
  });

  factory BookVO.fromJson(Map<String, dynamic> json) => _$BookVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookVOToJson(this);
}
