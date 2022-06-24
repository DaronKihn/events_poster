import 'package:json_annotation/json_annotation.dart';

part 'location_dto.g.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class LocationDto {
  final double? lat;
  final double? lon;

  LocationDto(this.lat, this.lon);

  factory LocationDto.fromJson(Map<String, dynamic> json) => _$LocationDtoFromJson(json);
}
