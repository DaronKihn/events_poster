import 'package:events_poster/src/dto/taxonomy_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'performer_dto.g.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class PerformerDto {
  final String? name;
  final String? short_name;
  final String? url;
  final String? image;
  final int? id;
  final List<TaxonomyDto>? taxonomies;

  PerformerDto(
    this.name,
    this.short_name,
    this.url,
    this.image,
    this.id,
    this.taxonomies,
  );

  factory PerformerDto.fromJson(Map<String, dynamic> json) => _$PerformerDtoFromJson(json);
}
