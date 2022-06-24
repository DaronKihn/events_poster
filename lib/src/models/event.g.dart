// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventAdapter extends TypeAdapter<Event> {
  @override
  final int typeId = 0;

  @override
  Event read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Event(
      id: fields[0] as int?,
      type: fields[1] as String?,
      title: fields[2] as String?,
      shortTitle: fields[3] as String?,
      url: fields[4] as String?,
      datetimeLocal: fields[5] as String?,
      datetimeUtc: fields[6] as String?,
      stats: fields[7] as Stats?,
      performers: (fields[8] as List?)?.cast<Performer>(),
      venue: fields[9] as Venue?,
      score: fields[10] as double?,
      taxonomies: (fields[11] as List?)?.cast<Taxonomy>(),
    );
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.shortTitle)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.datetimeLocal)
      ..writeByte(6)
      ..write(obj.datetimeUtc)
      ..writeByte(7)
      ..write(obj.stats)
      ..writeByte(8)
      ..write(obj.performers)
      ..writeByte(9)
      ..write(obj.venue)
      ..writeByte(10)
      ..write(obj.score)
      ..writeByte(11)
      ..write(obj.taxonomies);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as int?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      shortTitle: json['shortTitle'] as String?,
      url: json['url'] as String?,
      datetimeLocal: json['datetimeLocal'] as String?,
      datetimeUtc: json['datetimeUtc'] as String?,
      stats: json['stats'] == null
          ? null
          : Stats.fromJson(json['stats'] as Map<String, dynamic>),
      performers: (json['performers'] as List<dynamic>?)
          ?.map((e) => Performer.fromJson(e as Map<String, dynamic>))
          .toList(),
      venue: json['venue'] == null
          ? null
          : Venue.fromJson(json['venue'] as Map<String, dynamic>),
      score: (json['score'] as num?)?.toDouble(),
      taxonomies: (json['taxonomies'] as List<dynamic>?)
          ?.map((e) => Taxonomy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'shortTitle': instance.shortTitle,
      'url': instance.url,
      'datetimeLocal': instance.datetimeLocal,
      'datetimeUtc': instance.datetimeUtc,
      'stats': instance.stats,
      'performers': instance.performers,
      'venue': instance.venue,
      'score': instance.score,
      'taxonomies': instance.taxonomies,
    };
