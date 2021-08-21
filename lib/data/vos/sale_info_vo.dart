import 'package:json_annotation/json_annotation.dart';

part 'sale_info_vo.g.dart';

@JsonSerializable()
class SaleInfoVO {
  @JsonKey(name: "country")
  String country;

  @JsonKey(name: "saleability")
  String saleAbility;

  @JsonKey(name: "isEbook")
  bool isEbook;

  SaleInfoVO({
    required this.country,
    required this.saleAbility,
    required this.isEbook,
  });

  factory SaleInfoVO.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoVOFromJson(json);

  Map<String, dynamic> toJson() => _$SaleInfoVOToJson(this);
}
