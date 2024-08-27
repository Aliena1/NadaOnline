import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'booking_detail_model.g.dart';


@HiveType(typeId: 18)
class BookingDetailModel extends Equatable {
  @HiveField(0)
  final String? model;
  @HiveField(1)
  final String? modelSlug;
  @HiveField(2)
  final String? variant;
  @HiveField(3)
  final String? color;
  @HiveField(4)
  final String? fullName;
  @HiveField(5)
  final String? email;
  @HiveField(6)
  final String? address;
  @HiveField(7)
  final String? phone;
  @HiveField(8)
  final String? alternatePhone;
  @HiveField(9)
  final String? purchaseDate;
  @HiveField(10)
  final String? occupation;
  @HiveField(11)
  final String? bookingType;
  @HiveField(12)
  final String? bookingAmt;
  @HiveField(13)
  final String? discountAmt;
  @HiveField(14)
  final String? dealValue;
  @HiveField(15)
  final String? chequeNo;
  @HiveField(16)
  final String? bankName;
  @HiveField(17)
  final List<PurchaseModeListBooking> purchaseMode;
  @HiveField(18)
  final String? createdBy;
  @HiveField(19)
  final String? scheme;
  @HiveField(20)
  bool isSaved;

  BookingDetailModel(
  {
    this.model,
    this.modelSlug,
    this.variant,
    this.color,
    this.fullName,
    this.email,
    this.address,
    this.phone,
    this.alternatePhone,
    this.purchaseDate,
    this.occupation,
    this.bookingType,
    this.bookingAmt,
    this.discountAmt,
    this.dealValue,
    this.chequeNo,
    this.bankName,
    required this.purchaseMode,
    this.createdBy,
    this.scheme,
    this.isSaved=false
});


  Map<String, dynamic> toBookingDetailJson() => {
    "model" : model,
    "model_slug": modelSlug,
    "variant": variant,
    "color": color,
    "fullname": fullName,
    "email": email,
    "address": address,
    "phone": phone,
    "alternate_phone": alternatePhone,
    "purchaseDate": purchaseDate,
    "occupation" : occupation,
    "bookingType": bookingType,
    "bookingAmt": bookingAmt,
    "discountAmt": discountAmt,
    "dealvalue": dealValue,
    "chequeNo": chequeNo,
    "bankName": bankName,
    "purchase_mode": purchaseMode.map((purchaseMode) => purchaseMode.purchaseModeListBooking).toList(),
    "createdBy": createdBy,
    "scheme": scheme,
  };



  @override
  // TODO: implement props
  List<Object?> get props => [
        model,
        modelSlug,
        variant,
        color,
        fullName,
        email,
        address,
        phone,
        alternatePhone,
        purchaseDate,
        occupation,
        bookingType,
        bookingAmt,
        discountAmt,
        dealValue,
        chequeNo,
        bankName,
        purchaseMode,
        createdBy,
        scheme
      ];
}


@HiveType(typeId: 19)
class PurchaseModeListBooking extends Equatable{
  @HiveField(0)
  final String? purchaseModeListBooking;

  PurchaseModeListBooking({required this.purchaseModeListBooking});


  @override
  // TODO: implement props
  List<Object?> get props => [purchaseModeListBooking];

}