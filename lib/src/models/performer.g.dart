// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PerformerAdapter extends TypeAdapter<Performer> {
  @override
  final int typeId = 2;

  @override
  Performer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Performer(
      name: fields[0] as String?,
      shortName: fields[1] as String?,
      url: fields[2] as String?,
      image: fields[3] as String?,
      id: fields[4] as int?,
      taxonomies: (fields[5] as List?)?.cast<Taxonomy>(),
    );
  }

  @override
  void write(BinaryWriter writer, Performer obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.shortName)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.taxonomies);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PerformerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Performer _$PerformerFromJson(Map<String, dynamic> json) => Performer(
      name: json['name'] as String?,
      shortName: json['shortName'] as String?,
      url: json['url'] as String?,
      image: json['image'] as String?,
      id: json['id'] as int?,
      taxonomies: (json['taxonomies'] as List<dynamic>?)
          ?.map((e) => Taxonomy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PerformerToJson(Performer instance) => <String, dynamic>{
      'name': instance.name,
      'shortName': instance.shortName,
      'url': instance.url,
      'image': instance.image,
      'id': instance.id,
      'taxonomies': instance.taxonomies,
    };
