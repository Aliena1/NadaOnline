// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookingDetailModelAdapter extends TypeAdapter<BookingDetailModel> {
  @override
  final int typeId = 18;

  @override
  BookingDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookingDetailModel(
      model: fields[0] as String?,
      modelSlug: fields[1] as String?,
      variant: fields[2] as String?,
      color: fields[3] as String?,
      fullName: fields[4] as String?,
      email: fields[5] as String?,
      address: fields[6] as String?,
      phone: fields[7] as String?,
      alternatePhone: fields[8] as String?,
      purchaseDate: fields[9] as String?,
      occupation: fields[10] as String?,
      bookingType: fields[11] as String?,
      bookingAmt: fields[12] as String?,
      discountAmt: fields[13] as String?,
      dealValue: fields[14] as String?,
      chequeNo: fields[15] as String?,
      bankName: fields[16] as String?,
      purchaseMode: (fields[17] as List).cast<PurchaseModeListBooking>(),
      createdBy: fields[18] as String?,
      scheme: fields[19] as String?,
      isSaved: fields[20] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, BookingDetailModel obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.model)
      ..writeByte(1)
      ..write(obj.modelSlug)
      ..writeByte(2)
      ..write(obj.variant)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.fullName)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.alternatePhone)
      ..writeByte(9)
      ..write(obj.purchaseDate)
      ..writeByte(10)
      ..write(obj.occupation)
      ..writeByte(11)
      ..write(obj.bookingType)
      ..writeByte(12)
      ..write(obj.bookingAmt)
      ..writeByte(13)
      ..write(obj.discountAmt)
      ..writeByte(14)
      ..write(obj.dealValue)
      ..writeByte(15)
      ..write(obj.chequeNo)
      ..writeByte(16)
      ..write(obj.bankName)
      ..writeByte(17)
      ..write(obj.purchaseMode)
      ..writeByte(18)
      ..write(obj.createdBy)
      ..writeByte(19)
      ..write(obj.scheme)
      ..writeByte(20)
      ..write(obj.isSaved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookingDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PurchaseModeListBookingAdapter
    extends TypeAdapter<PurchaseModeListBooking> {
  @override
  final int typeId = 19;

  @override
  PurchaseModeListBooking read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseModeListBooking(
      purchaseModeListBooking: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PurchaseModeListBooking obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.purchaseModeListBooking);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseModeListBookingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
