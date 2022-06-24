import 'package:json_annotation/json_annotation.dart';

part 'stats_dto.g.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class StatsDto {
  final int? listing_count;
  final int? average_price;
  final int? lowest_price;
  final int? highest_price;

  StatsDto(
    this.listing_count,
    this.average_price,
    this.lowest_price,
    this.highest_price,
  );

  factory StatsDto.fromJson(Map<String, dynamic> json) => _$StatsDtoFromJson(json);
}
