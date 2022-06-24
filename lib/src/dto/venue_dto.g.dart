// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VenueDto _$VenueDtoFromJson(Map<String, dynamic> json) => VenueDto(
      json['city'] as String?,
      json['name'] as String?,
      json['extended_address'] as String?,
      json['url'] as String?,
      json['country'] as String?,
      json['state'] as String?,
      (json['score'] as num?)?.toDouble(),
      json['postal_code'] as String?,
      json['location'] == null
          ? null
          : LocationDto.fromJson(json['location'] as Map<String, dynamic>),
      json['address'] as String?,
      json['id'] as int?,
    );
