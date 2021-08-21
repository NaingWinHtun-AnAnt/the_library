import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/persistence/hive_constants.dart';

part 'buy_link_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_BUY_LINK_VO, adapterName: "BuyLinkVOAdapter")
@JsonSerializable()
class BuyLinkVO {
  @HiveField(0)
  @JsonKey(name: "name")
  String name;

  @HiveField(1)
  @JsonKey(name: "url")
  String url;

  BuyLinkVO({
    required this.name,
    required this.url,
  });

  factory BuyLinkVO.fromJson(Map<String, dynamic> json) =>
      _$BuyLinkVOFromJson(json);

  Map<String, dynamic> toJson() => _$BuyLinkVOToJson(this);
}
