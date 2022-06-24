import 'package:events_poster/src/dto/location_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'venue_dto.g.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class VenueDto {
  final String? city;
  final String? name;
  final String? extended_address;
  final String? url;
  final String? country;
  final String? state;
  final double? score;
  final String? postal_code;
  final LocationDto? location;
  final String? address;
  final int? id;

  VenueDto(
    this.city,
    this.name,
    this.extended_address,
    this.url,
    this.country,
    this.state,
    this.score,
    this.postal_code,
    this.location,
    this.address,
    this.id,
  );

  factory VenueDto.fromJson(Map<String, dynamic> json) => _$VenueDtoFromJson(json);
}
