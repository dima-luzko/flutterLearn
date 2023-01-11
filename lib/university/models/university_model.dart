import 'package:freezed_annotation/freezed_annotation.dart';

part 'university_model.g.dart';

@JsonSerializable()
class UniversityData {
  @JsonKey(name: "web_pages")
  List<String> webPages;
  String name;
  String country;

  UniversityData(
      {required this.webPages, required this.name, required this.country});

  factory UniversityData.fromJson(Map<String, dynamic> json) =>
      _$UniversityDataFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityDataToJson(this);
}

class University {
  List<UniversityData>? university;
  String? error;

  University({required this.university, required this.error});

  University.withError(String errorMessage) {
    error = errorMessage;
  }
}
