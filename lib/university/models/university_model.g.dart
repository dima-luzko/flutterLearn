// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniversityData _$UniversityDataFromJson(Map<String, dynamic> json) =>
    UniversityData(
      webPages:
          (json['web_pages'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$UniversityDataToJson(UniversityData instance) =>
    <String, dynamic>{
      'web_pages': instance.webPages,
      'name': instance.name,
      'country': instance.country,
    };
