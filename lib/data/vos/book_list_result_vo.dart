import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/data/vos/book_list_vo.dart';
import 'package:the_library/persistence/hive_constants.dart';

part 'book_list_result_vo.g.dart';

@HiveType(
    typeId: HIVE_TYPE_ID_BOOK_LIST_RESULT_VO,
    adapterName: "BookListResultVOAdapter")
@JsonSerializable(ignoreUnannotated: true)
class BookListResultVO {
  @HiveField(0)
  @JsonKey(name: "bestsellers_date")
  String? bestsellersDate;

  @HiveField(1)
  @JsonKey(name: "published_date")
  String? publishedDate;

  @HiveField(2)
  @JsonKey(name: "published_date_description")
  String? publishedDateDescription;

  @HiveField(3)
  @JsonKey(name: "previous_published_date")
  String? previousPublishedDate;

  @HiveField(4)
  @JsonKey(name: "next_published_date")
  String? nextPublishedDate;

  @HiveField(5)
  @JsonKey(name: "lists")
  List<BookListVO>? lists;

  @HiveField(6)
  String? publishedDateByAndroid;

  BookListResultVO({
    this.bestsellersDate,
    this.publishedDate,
    this.publishedDateDescription,
    this.previousPublishedDate,
    this.nextPublishedDate,
    this.lists,
    this.publishedDateByAndroid,
  });

  factory BookListResultVO.fromJson(Map<String, dynamic> json) =>
      _$BookListResultVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookListResultVOToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookListResultVO &&
          runtimeType == other.runtimeType &&
          bestsellersDate == other.bestsellersDate &&
          publishedDate == other.publishedDate &&
          publishedDateDescription == other.publishedDateDescription &&
          previousPublishedDate == other.previousPublishedDate &&
          nextPublishedDate == other.nextPublishedDate &&
          publishedDateByAndroid == other.publishedDateByAndroid;

  @override
  int get hashCode =>
      bestsellersDate.hashCode ^
      publishedDate.hashCode ^
      publishedDateDescription.hashCode ^
      previousPublishedDate.hashCode ^
      nextPublishedDate.hashCode ^
      publishedDateByAndroid.hashCode;
}
