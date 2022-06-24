// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatsAdapter extends TypeAdapter<Stats> {
  @override
  final int typeId = 3;

  @override
  Stats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stats(
      listingCount: fields[0] as int?,
      averagePrice: fields[1] as int?,
      lowestPrice: fields[2] as int?,
      highestPrice: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Stats obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.listingCount)
      ..writeByte(1)
      ..write(obj.averagePrice)
      ..writeByte(2)
      ..write(obj.lowestPrice)
      ..writeByte(3)
      ..write(obj.highestPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      listingCount: json['listingCount'] as int?,
      averagePrice: json['averagePrice'] as int?,
      lowestPrice: json['lowestPrice'] as int?,
      highestPrice: json['highestPrice'] as int?,
    );

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'listingCount': instance.listingCount,
      'averagePrice': instance.averagePrice,
      'lowestPrice': instance.lowestPrice,
      'highestPrice': instance.highestPrice,
    };
