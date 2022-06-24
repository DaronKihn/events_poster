// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDto _$EventDtoFromJson(Map<String, dynamic> json) => EventDto(
      json['id'] as int?,
      json['type'] as String?,
      json['title'] as String?,
      json['short_title'] as String?,
      json['url'] as String?,
      json['datetime_local'] as String?,
      json['datetime_utc'] as String?,
      json['stats'] == null
          ? null
          : StatsDto.fromJson(json['stats'] as Map<String, dynamic>),
      (json['performers'] as List<dynamic>?)
          ?.map((e) => PerformerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['venue'] == null
          ? null
          : VenueDto.fromJson(json['venue'] as Map<String, dynamic>),
      (json['score'] as num?)?.toDouble(),
      (json['taxonomies'] as List<dynamic>?)
          ?.map((e) => TaxonomyDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
