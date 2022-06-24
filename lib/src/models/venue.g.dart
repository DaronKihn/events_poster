// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VenueAdapter extends TypeAdapter<Venue> {
  @override
  final int typeId = 5;

  @override
  Venue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Venue(
      city: fields[0] as String?,
      name: fields[1] as String?,
      extendedAddress: fields[2] as String?,
      url: fields[3] as String?,
      country: fields[4] as String?,
      state: fields[5] as String?,
      score: fields[6] as double?,
      postalCode: fields[7] as String?,
      location: fields[8] as Location?,
      address: fields[9] as String?,
      id: fields[10] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Venue obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.city)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.extendedAddress)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.country)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.score)
      ..writeByte(7)
      ..write(obj.postalCode)
      ..writeByte(8)
      ..write(obj.location)
      ..writeByte(9)
      ..write(obj.address)
      ..writeByte(10)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VenueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Venue _$VenueFromJson(Map<String, dynamic> json) => Venue(
      city: json['city'] as String?,
      name: json['name'] as String?,
      extendedAddress: json['extendedAddress'] as String?,
      url: json['url'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      postalCode: json['postalCode'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      address: json['address'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$VenueToJson(Venue instance) => <String, dynamic>{
      'city': instance.city,
      'name': instance.name,
      'extendedAddress': instance.extendedAddress,
      'url': instance.url,
      'country': instance.country,
      'state': instance.state,
      'score': instance.score,
      'postalCode': instance.postalCode,
      'location': instance.location,
      'address': instance.address,
      'id': instance.id,
    };
