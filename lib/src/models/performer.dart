import 'package:events_poster/src/models/taxonomy.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'performer.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Performer {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? shortName;
  @HiveField(2)
  final String? url;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final int? id;
  @HiveField(5)
  final List<Taxonomy>? taxonomies;

  Performer({
    this.name,
    this.shortName,
    this.url,
    this.image,
    this.id,
    this.taxonomies,
  });

  factory Performer.fromJson(Map<String, dynamic> json) => _$PerformerFromJson(json);
}
