// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enquiry_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnquiryDetailModelAdapter extends TypeAdapter<EnquiryDetailModel> {
  @override
  final int typeId = 13;

  @override
  EnquiryDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnquiryDetailModel(
      enquiredModel: (fields[0] as List).cast<EnquiryModelList>(),
      fullName: fields[1] as String?,
      email: fields[2] as String?,
      address: fields[3] as String?,
      phone: fields[4] as String?,
      alternatePhone: fields[5] as String?,
      customerType: fields[6] as String?,
      enquiryType: fields[7] as String?,
      scheme: fields[8] as String?,
      occupation: fields[9] as String?,
      purchaseMode: (fields[10] as List).cast<PurchaseModeList>(),
      message: fields[11] as String?,
      createdBy: fields[12] as String?,
      isSended: fields[13] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, EnquiryDetailModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.enquiredModel)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.alternatePhone)
      ..writeByte(6)
      ..write(obj.customerType)
      ..writeByte(7)
      ..write(obj.enquiryType)
      ..writeByte(8)
      ..write(obj.scheme)
      ..writeByte(9)
      ..write(obj.occupation)
      ..writeByte(10)
      ..write(obj.purchaseMode)
      ..writeByte(11)
      ..write(obj.message)
      ..writeByte(12)
      ..write(obj.createdBy)
      ..writeByte(13)
      ..write(obj.isSended);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnquiryDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EnquiryModelListAdapter extends TypeAdapter<EnquiryModelList> {
  @override
  final int typeId = 14;

  @override
  EnquiryModelList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnquiryModelList(
      enquiryModel: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EnquiryModelList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.enquiryModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnquiryModelListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PurchaseModeListAdapter extends TypeAdapter<PurchaseModeList> {
  @override
  final int typeId = 15;

  @override
  PurchaseModeList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseModeList(
      purchaseModeList: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PurchaseModeList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.purchaseModeList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseModeListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
