// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

University _$UniversityFromJson(Map<String, dynamic> json) => University(
      web_pages:
          (json['web_pages'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$UniversityToJson(University instance) =>
    <String, dynamic>{
      'web_pages': instance.web_pages,
      'name': instance.name,
      'country': instance.country,
    };
