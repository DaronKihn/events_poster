import 'package:json_annotation/json_annotation.dart';

part 'taxonomy_dto.g.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class TaxonomyDto {
  final int? id;
  final String? name;

  TaxonomyDto(
    this.id,
    this.name,
  );

  factory TaxonomyDto.fromJson(Map<String, dynamic> json) => _$TaxonomyDtoFromJson(json);
}
