import 'package:freezed_annotation/freezed_annotation.dart';

part 'university_model.g.dart';

@JsonSerializable()
class University {
  List<String> web_pages;
  String name;
  String country;

  University(
      {required this.web_pages,
        required this.name,
        required this.country,});

  factory University.fromJson(Map<String, dynamic> json) => _$UniversityFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityToJson(this);
}
