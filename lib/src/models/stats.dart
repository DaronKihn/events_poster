import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stats.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class Stats {
  @HiveField(0)
  final int? listingCount;
  @HiveField(1)
  final int? averagePrice;
  @HiveField(2)
  final int? lowestPrice;
  @HiveField(3)
  final int? highestPrice;

  Stats({
    this.listingCount,
    this.averagePrice,
    this.lowestPrice,
    this.highestPrice,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}
