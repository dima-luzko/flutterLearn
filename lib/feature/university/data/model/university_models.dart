import 'package:freezed_annotation/freezed_annotation.dart';
part 'university_models.g.dart';


@JsonSerializable()
class University {
  @JsonKey(name: "web_pages")
  List<String> webPages;
  String name;
  String country;

  University(
      {required this.webPages, required this.name, required this.country});

  factory University.fromJson(Map<String, dynamic> json) =>
      _$UniversityFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityToJson(this);
}