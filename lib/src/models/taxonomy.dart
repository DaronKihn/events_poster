import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'taxonomy.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class Taxonomy {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;

  Taxonomy({
    this.id,
    this.name,
  });

  factory Taxonomy.fromJson(Map<String, dynamic> json) => _$TaxonomyFromJson(json);
}
