import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/data/vos/book_list_result_vo.dart';

part 'book_list_response.g.dart';

@JsonSerializable()
class BookListResponse {
  @JsonKey(name: "status")
  String status;

  @JsonKey(name: "copyright")
  String copyRight;

  @JsonKey(name: "num_results")
  int numResults;

  @JsonKey(name: "results")
  BookListResultVO results;

  BookListResponse({
    required this.status,
    required this.copyRight,
    required this.numResults,
    required this.results,
  });

  factory BookListResponse.fromJson(Map<String, dynamic> json) =>
      _$BookListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookListResponseToJson(this);
}
