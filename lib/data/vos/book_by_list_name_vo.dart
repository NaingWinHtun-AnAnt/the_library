import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/data/vos/isbn_vo.dart';
import 'package:the_library/persistence/hive_constants.dart';

part 'book_by_list_name_vo.g.dart';

@HiveType(
    typeId: HIVE_TYPE_ID_BOOK_BY_LIST_NAME_VO,
    adapterName: "BookByListNameVOAdapter")
@JsonSerializable(ignoreUnannotated: true)
class BookByListNameVO {
  @HiveField(0)
  @JsonKey(name: "book_image")
  String? bookImage;

  @HiveField(1)
  @JsonKey(name: "title")
  String? title;

  @HiveField(2)
  @JsonKey(name: "author")
  String? author;

  @HiveField(3)
  @JsonKey(name: "isbns")
  List<IsbnVO>? isbns;

  String? listName;

  BookByListNameVO({
    this.bookImage,
    this.title,
    this.author,
    this.isbns,
    this.listName,
  });

  factory BookByListNameVO.fromJson(Map<String, dynamic> json) =>
      _$BookByListNameVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookByListNameVOToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookByListNameVO &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          author == other.author &&
          isbns == other.isbns &&
          listName == other.listName;

  @override
  int get hashCode =>
      title.hashCode ^ author.hashCode ^ isbns.hashCode ^ listName.hashCode;
}
