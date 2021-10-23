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
    this.kind,
    this.id,
    this.eTag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  factory SearchBookVO.fromJson(Map<String, dynamic> json) =>
      _$SearchBookVOFromJson(json);

  Map<String, dynamic> toJson() => _$SearchBookVOToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchBookVO &&
          runtimeType == other.runtimeType &&
          kind == other.kind &&
          id == other.id &&
          eTag == other.eTag;

  @override
  int get hashCode => kind.hashCode ^ id.hashCode ^ eTag.hashCode;
}
