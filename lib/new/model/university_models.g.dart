// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

University _$UniversityFromJson(Map<String, dynamic> json) => University(
      webPages:
          (json['web_pages'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$UniversityToJson(University instance) =>
    <String, dynamic>{
      'web_pages': instance.webPages,
      'name': instance.name,
      'country': instance.country,
    };
