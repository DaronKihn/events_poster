import 'package:events_poster/src/models/location.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'venue.g.dart';

@JsonSerializable()
@HiveType(typeId: 5)
class Venue {
  @HiveField(0)
  final String? city;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? extendedAddress;
  @HiveField(3)
  final String? url;
  @HiveField(4)
  final String? country;
  @HiveField(5)
  final String? state;
  @HiveField(6)
  final double? score;
  @HiveField(7)
  final String? postalCode;
  @HiveField(8)
  final Location? location;
  @HiveField(9)
  final String? address;
  @HiveField(10)
  final int? id;

  Venue({
    this.city,
    this.name,
    this.extendedAddress,
    this.url,
    this.country,
    this.state,
    this.score,
    this.postalCode,
    this.location,
    this.address,
    this.id,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
}
