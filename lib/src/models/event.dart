import 'package:events_poster/src/models/performer.dart';
import 'package:events_poster/src/models/stats.dart';
import 'package:events_poster/src/models/taxonomy.dart';
import 'package:events_poster/src/models/venue.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Event {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? type;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? shortTitle;
  @HiveField(4)
  final String? url;
  @HiveField(5)
  final String? datetimeLocal;
  @HiveField(6)
  final String? datetimeUtc;
  @HiveField(7)
  final Stats? stats;
  @HiveField(8)
  final List<Performer>? performers;
  @HiveField(9)
  final Venue? venue;
  @HiveField(10)
  final double? score;
  @HiveField(11)
  final List<Taxonomy>? taxonomies;

  Event({
    this.id,
    this.type,
    this.title,
    this.shortTitle,
    this.url,
    this.datetimeLocal,
    this.datetimeUtc,
    this.stats,
    this.performers,
    this.venue,
    this.score,
    this.taxonomies,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
