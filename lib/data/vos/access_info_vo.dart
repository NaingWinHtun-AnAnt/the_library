import 'package:json_annotation/json_annotation.dart';
import 'package:the_library/data/vos/epub_vo.dart';
import 'package:the_library/data/vos/pdf_vo.dart';

part 'access_info_vo.g.dart';

@JsonSerializable()
class AccessInfoVO {
  @JsonKey(name: "country")
  String country;

  @JsonKey(name: "viewability")
  String viewAbility;

  @JsonKey(name: "embeddable")
  bool embeddable;

  @JsonKey(name: "publicDomain")
  bool publicDomain;

  @JsonKey(name: "textToSpeechPermission")
  String textToSpeechPermission;

  @JsonKey(name: "epub")
  EpubVO epub;

  @JsonKey(name: "pdf")
  PdfVO pdf;

  @JsonKey(name: "webReaderLink")
  String webReaderLink;

  @JsonKey(name: "accessViewStatus")
  String accessViewStatus;

  @JsonKey(name: "quoteSharingAllowed")
  bool quoteSharingAllowed;

  AccessInfoVO({
    required this.country,
    required this.viewAbility,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.epub,
    required this.pdf,
    required this.webReaderLink,
    required this.accessViewStatus,
    required this.quoteSharingAllowed,
  });

  factory AccessInfoVO.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoVOFromJson(json);

  Map<String, dynamic> toJson() => _$AccessInfoVOToJson(this);
}
