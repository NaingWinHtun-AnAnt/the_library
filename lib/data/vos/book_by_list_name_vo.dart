import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/data/vos/book_detail_vo.dart';
import 'package:the_library/data/vos/book_review_vo.dart';
import 'package:the_library/data/vos/isbn_vo.dart';
import 'package:the_library/persistence/hive_constants.dart';

part 'book_by_list_name_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_BOOK_BY_LIST_NAME_VO,adapterName: "BookByListNameVOAdapter")
@JsonSerializable()
class BookByListNameVO {
  @HiveField(0)
  @JsonKey(name: "list_name")
  String listName;

  @HiveField(1)
  @JsonKey(name: "display_name")
  String displayName;

  @HiveField(2)
  @JsonKey(name: "bestsellers_date")
  String bestsellersDate;

  @HiveField(3)
  @JsonKey(name: "published_date")
  String publishedDate;

  @HiveField(4)
  @JsonKey(name: "rank")
  int rank;

  @HiveField(5)
  @JsonKey(name: "rank_last_week")
  int rankLastWeek;

  @HiveField(6)
  @JsonKey(name: "weeks_on_list")
  int weeksOnList;

  @HiveField(7)
  @JsonKey(name: "asterisk")
  int asterisk;

  @HiveField(8)
  @JsonKey(name: "dagger")
  int dagger;

  @HiveField(9)
  @JsonKey(name: "amazon_product_url")
  String amazonProductUrl;

  @HiveField(10)
  @JsonKey(name: "isbns")
  List<IsbnVO> isbns;

  @HiveField(11)
  @JsonKey(name: "book_details")
  List<BookDetailVO> bookDetails;

  @HiveField(12)
  @JsonKey(name: "reviews")
  List<BookReviewVO> reviews;

  BookByListNameVO({
    required this.listName,
    required this.displayName,
    required this.bestsellersDate,
    required this.publishedDate,
    required this.rank,
    required this.rankLastWeek,
    required this.weeksOnList,
    required this.asterisk,
    required this.dagger,
    required this.amazonProductUrl,
    required this.isbns,
    required this.bookDetails,
    required this.reviews,
  });

  factory BookByListNameVO.fromJson(Map<String, dynamic> json) =>
      _$BookByListNameVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookByListNameVOToJson(this);
}
