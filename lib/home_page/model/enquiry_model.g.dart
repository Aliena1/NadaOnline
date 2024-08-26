// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enquiry_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnquiryModelClassAdapter extends TypeAdapter<EnquiryModelClass> {
  @override
  final int typeId = 0;

  @override
  EnquiryModelClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnquiryModelClass(
      status: fields[0] as bool?,
      data: fields[1] as Data?,
    );
  }

  @override
  void write(BinaryWriter writer, EnquiryModelClass obj) {
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
      other is EnquiryModelClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 1;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      customerType: (fields[0] as List?)?.cast<CustomerType>(),
      enquiryType: (fields[1] as List?)?.cast<EnquiryType>(),
      purchaseMode: (fields[2] as List?)?.cast<PurchaseMode>(),
      scheme: (fields[3] as List?)?.cast<Scheme>(),
      financingBank: (fields[4] as List?)?.cast<FinancingBank>(),
      occupation: (fields[5] as List?)?.cast<Occupation>(),
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.customerType)
      ..writeByte(1)
      ..write(obj.enquiryType)
      ..writeByte(2)
      ..write(obj.purchaseMode)
      ..writeByte(3)
      ..write(obj.scheme)
      ..writeByte(4)
      ..write(obj.financingBank)
      ..writeByte(5)
      ..write(obj.occupation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CustomerTypeAdapter extends TypeAdapter<CustomerType> {
  @override
  final int typeId = 2;

  @override
  CustomerType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerType(
      type: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerType obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EnquiryTypeAdapter extends TypeAdapter<EnquiryType> {
  @override
  final int typeId = 3;

  @override
  EnquiryType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnquiryType(
      type: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EnquiryType obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnquiryTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PurchaseModeAdapter extends TypeAdapter<PurchaseMode> {
  @override
  final int typeId = 4;

  @override
  PurchaseMode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseMode(
      type: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PurchaseMode obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SchemeAdapter extends TypeAdapter<Scheme> {
  @override
  final int typeId = 5;

  @override
  Scheme read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Scheme(
      id: fields[0] as String?,
      scheme: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Scheme obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.scheme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FinancingBankAdapter extends TypeAdapter<FinancingBank> {
  @override
  final int typeId = 6;

  @override
  FinancingBank read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinancingBank(
      id: fields[0] as String?,
      bankName: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FinancingBank obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.bankName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinancingBankAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OccupationAdapter extends TypeAdapter<Occupation> {
  @override
  final int typeId = 7;

  @override
  Occupation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Occupation(
      occupationId: fields[0] as String?,
      occupation: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Occupation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.occupationId)
      ..writeByte(1)
      ..write(obj.occupation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OccupationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
