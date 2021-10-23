import 'package:json_annotation/json_annotation.dart';

import 'book_by_list_name_vo.dart';

part 'book_by_category_vo.g.dart';

@JsonSerializable()
class BookByCategoryVO {
  @JsonKey(name: "books")
  List<BookByListNameVO>? books;

  BookByCategoryVO({
      this.books,
  });

  factory BookByCategoryVO.fromJson(Map<String, dynamic> json) =>
      _$BookByCategoryVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookByCategoryVOToJson(this);
}
