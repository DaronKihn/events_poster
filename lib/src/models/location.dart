import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Location {
  @HiveField(0)
  final double? lat;
  @HiveField(1)
  final double? lon;

  Location({this.lat, this.lon});

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}
