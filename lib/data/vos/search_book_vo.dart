import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/data/vos/access_info_vo.dart';
import 'package:the_library/data/vos/sale_info_vo.dart';
import 'package:the_library/data/vos/volume_info_vo.dart';

part 'search_book_vo.g.dart';

@JsonSerializable()
class SearchBookVO {
  @JsonKey(name: "kind")
  String? kind;

  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "etag")
  String? eTag;

  @JsonKey(name: "selfLink")
  String? selfLink;

  @JsonKey(name: "volumeInfo")
  VolumeInfoVO? volumeInfo;

  @JsonKey(name: "saleInfo")
  SaleInfoVO? saleInfo;

  @JsonKey(name: "accessInfo")
  AccessInfoVO? accessInfo;

  @JsonKey(name: "searchInfo")
  SearchBookVO? searchInfo;

  SearchBookVO({
    required this.kind,
    required this.id,
    required this.eTag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
    required this.searchInfo,
  });

  factory SearchBookVO.fromJson(Map<String, dynamic> json) =>
      _$SearchBookVOFromJson(json);

  Map<String, dynamic> toJson() => _$SearchBookVOToJson(this);
}
