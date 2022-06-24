// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerformerDto _$PerformerDtoFromJson(Map<String, dynamic> json) => PerformerDto(
      json['name'] as String?,
      json['short_name'] as String?,
      json['url'] as String?,
      json['image'] as String?,
      json['id'] as int?,
      (json['taxonomies'] as List<dynamic>?)
          ?.map((e) => TaxonomyDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
