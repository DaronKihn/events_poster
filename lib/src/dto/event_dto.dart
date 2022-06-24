import 'package:events_poster/src/dto/performer_dto.dart';
import 'package:events_poster/src/dto/stats_dto.dart';
import 'package:events_poster/src/dto/taxonomy_dto.dart';
import 'package:events_poster/src/dto/venue_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_dto.g.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class EventDto {
  final int? id;
  final String? type;
  final String? title;
  final String? short_title;
  final String? url;
  final String? datetime_local;
  final String? datetime_utc;
  final StatsDto? stats;
  final List<PerformerDto>? performers;
  final VenueDto? venue;
  final double? score;
  final List<TaxonomyDto>? taxonomies;

  EventDto(
    this.id,
    this.type,
    this.title,
    this.short_title,
    this.url,
    this.datetime_local,
    this.datetime_utc,
    this.stats,
    this.performers,
    this.venue,
    this.score,
    this.taxonomies,
  );

  factory EventDto.fromJson(Map<String, dynamic> json) => _$EventDtoFromJson(json);
}
