// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleModelAdapter extends TypeAdapter<VehicleModel> {
  @override
  final int typeId = 8;

  @override
  VehicleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VehicleModel(
      status: fields[0] as bool?,
      data: (fields[1] as List?)?.cast<VehicleData>(),
    );
  }

  @override
  void write(BinaryWriter writer, VehicleModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VehicleDataAdapter extends TypeAdapter<VehicleData> {
  @override
  final int typeId = 9;

  @override
  VehicleData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VehicleData(
      id: fields[0] as int?,
      name: fields[1] as String?,
      displayName: fields[2] as String?,
      logo: fields[3] as String?,
      slug: fields[4] as String?,
      variant: (fields[5] as List?)?.cast<Variant>(),
      modelColor: (fields[6] as List?)?.cast<ModelColor>(),
    );
  }

  @override
  void write(BinaryWriter writer, VehicleData obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.displayName)
      ..writeByte(3)
      ..write(obj.logo)
      ..writeByte(4)
      ..write(obj.slug)
      ..writeByte(5)
      ..write(obj.variant)
      ..writeByte(6)
      ..write(obj.modelColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VariantAdapter extends TypeAdapter<Variant> {
  @override
  final int typeId = 10;

  @override
  Variant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Variant(
      id: fields[0] as int?,
      modelId: fields[1] as int?,
      name: fields[2] as String?,
      specification: fields[3] as Specification?,
    );
  }

  @override
  void write(BinaryWriter writer, Variant obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.modelId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.specification);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpecificationAdapter extends TypeAdapter<Specification> {
  @override
  final int typeId = 11;

  @override
  Specification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Specification(
      id: fields[0] as int?,
      variantId: fields[1] as int?,
      price: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Specification obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.variantId)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpecificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ModelColorAdapter extends TypeAdapter<ModelColor> {
  @override
  final int typeId = 12;

  @override
  ModelColor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelColor(
      id: fields[0] as int?,
      modelId: fields[1] as int?,
      colorName: fields[2] as String?,
      colorImage: fields[3] as String?,
      colorShortCode: fields[4] as String?,
      colorHashvalue: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ModelColor obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.modelId)
      ..writeByte(2)
      ..write(obj.colorName)
      ..writeByte(3)
      ..write(obj.colorImage)
      ..writeByte(4)
      ..write(obj.colorShortCode)
      ..writeByte(5)
      ..write(obj.colorHashvalue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
