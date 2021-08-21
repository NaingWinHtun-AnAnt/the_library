import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/data/vos/search_book_vo.dart';

part 'search_result_response.g.dart';

@JsonSerializable()
class SearchResultResponse {
  @JsonKey(name: "kind")
  String kind;

  @JsonKey(name: "totalItems")
  int totalItems;

  @JsonKey(name: "items")
  List<SearchBookVO> items;

  SearchResultResponse({
    required this.kind,
    required this.totalItems,
    required this.items,
  });

  factory SearchResultResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultResponseToJson(this);
}
