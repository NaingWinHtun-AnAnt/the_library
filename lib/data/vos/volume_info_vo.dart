import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/data/vos/image_link_vo.dart';
import 'package:the_library/data/vos/industry_identifier_vo.dart';
import 'package:the_library/data/vos/panelization_summary_vo.dart';
import 'package:the_library/data/vos/reading_mode_vo.dart';

part 'volume_info_vo.g.dart';

@JsonSerializable()
class VolumeInfoVO {
  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "subtitle")
  String? subtitle;

  @JsonKey(name: "authors")
  List<String>? authors;

  @JsonKey(name: "publisher")
  String? publisher;

  @JsonKey(name: "publishedDate")
  String? publishedDate;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "industryIdentifiers")
  List<IndustryIdentifierVO>? industryIdentifiers;

  @JsonKey(name: "readingModes")
  ReadingModeVO? readingModes;

  @JsonKey(name: "pageCount")
  int? pageCount;

  @JsonKey(name: "printType")
  String? printType;

  @JsonKey(name: "maturityRating")
  String? maturityRating;

  @JsonKey(name: "allowAnonLogging")
  bool? allowAnonLogging;

  @JsonKey(name: "contentVersion")
  String? contentVersion;

  @JsonKey(name: "panelizationSummary")
  PanelizationSummaryVO? panelizationSummary;

  @JsonKey(name: "imageLinks")
  ImageLinkVO? imageLinks;

  @JsonKey(name: "language")
  String? language;

  @JsonKey(name: "previewLink")
  String? previewLink;

  @JsonKey(name: "infoLink")
  String? infoLink;

  @JsonKey(name: "canonicalVolumeLink")
  String? canonicalVolumeLink;

  VolumeInfoVO({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.industryIdentifiers,
    required this.readingModes,
    required this.pageCount,
    required this.printType,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.panelizationSummary,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  factory VolumeInfoVO.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoVOFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeInfoVOToJson(this);
}
