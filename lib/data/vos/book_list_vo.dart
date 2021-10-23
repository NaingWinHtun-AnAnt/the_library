import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/data/vos/book_vo.dart';
import 'package:the_library/persistence/hive_constants.dart';

part 'book_list_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_BOOK_LIST_VO, adapterName: "BookListVOAdapter")
@JsonSerializable()
class BookListVO {
  @HiveField(0)
  @JsonKey(name: "list_id")
  int listId;

  @HiveField(1)
  @JsonKey(name: "list_name")
  String? listName;

  @HiveField(2)
  @JsonKey(name: "list_name_encoded")
  String? listNameEncoded;

  @HiveField(3)
  @JsonKey(name: "display_name")
  String? displayName;

  @HiveField(4)
  @JsonKey(name: "updated")
  String? updated;

  @HiveField(5)
  @JsonKey(name: "list_image")
  String? listImage;

  @HiveField(6)
  @JsonKey(name: "list_image_width")
  String? listImageWidth;

  @HiveField(7)
  @JsonKey(name: "list_image_height")
  String? listImageHeight;

  @HiveField(8)
  @JsonKey(name: "books")
  List<BookVO>? books;

  BookListVO({
    required this.listId,
    this.listName,
    this.listNameEncoded,
    this.displayName,
    this.updated,
    this.listImage,
    this.listImageWidth,
    this.listImageHeight,
    this.books,
  });

  factory BookListVO.fromJson(Map<String, dynamic> json) =>
      _$BookListVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookListVOToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookListVO &&
          runtimeType == other.runtimeType &&
          listId == other.listId &&
          listName == other.listName;

  @override
  int get hashCode => listId.hashCode ^ listName.hashCode;
}
