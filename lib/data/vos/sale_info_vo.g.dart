// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_info_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleInfoVO _$SaleInfoVOFromJson(Map<String, dynamic> json) {
  return SaleInfoVO(
    country: json['country'] as String,
    saleAbility: json['saleability'] as String,
    isEbook: json['isEbook'] as bool,
  );
}

Map<String, dynamic> _$SaleInfoVOToJson(SaleInfoVO instance) =>
    <String, dynamic>{
      'country': instance.country,
      'saleability': instance.saleAbility,
      'isEbook': instance.isEbook,
    };
