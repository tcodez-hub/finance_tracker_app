// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 0;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction(
      id: (fields[6] as num).toInt(),
      amount: (fields[1] as num).toDouble(),
      type: fields[2] as String,
      category: fields[3] as String,
      subcategory: fields[7] as String,
      datetime: fields[8] as String,
      notes: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.notes)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.subcategory)
      ..writeByte(8)
      ..write(obj.datetime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SettingModelAdapter extends TypeAdapter<SettingModel> {
  @override
  final int typeId = 1;

  @override
  SettingModel read(BinaryReader reader) {
    return SettingModel();
  }

  @override
  void write(BinaryWriter writer, SettingModel obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
