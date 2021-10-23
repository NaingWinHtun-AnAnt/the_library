import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/data/vos/book_by_category_vo.dart';

part 'book_list_by_list_name_response.g.dart';

@JsonSerializable()
class BookListByListNameResponse {
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "copyright")
  String? copyright;

  @JsonKey(name: "num_results")
  int? num_Results;

  @JsonKey(name: "last_modified")
  String? lastModified;

  @JsonKey(name: "results")
  BookByCategoryVO? results;

  BookListByListNameResponse({
    this.status,
    this.copyright,
    this.num_Results,
    this.lastModified,
    this.results,
  });

  factory BookListByListNameResponse.fromJson(Map<String, dynamic> json) =>
      _$BookListByListNameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookListByListNameResponseToJson(this);
}
