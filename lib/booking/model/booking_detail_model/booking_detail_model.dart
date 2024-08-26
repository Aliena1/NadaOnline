import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'booking_detail_model.g.dart';


@HiveType(typeId: 18)
class BookingDetailModel extends Equatable {
  @HiveField(0)
  String? model;
  @HiveField(1)
  String? modelSlug;
  @HiveField(2)
  String? variant;
  @HiveField(3)
  String? color;
  @HiveField(4)
  String? fullName;
  @HiveField(5)
  String? email;
  @HiveField(6)
  String? address;
  @HiveField(7)
  String? phone;
  @HiveField(8)
  String? alternatePhone;
  @HiveField(9)
  String? purchaseDate;
  @HiveField(10)
  String? occupation;
  @HiveField(11)
  String? bookingType;
  @HiveField(12)
  String? bookingAmt;
  @HiveField(13)
  String? discountAmt;
  @HiveField(14)
  String? dealValue;
  @HiveField(15)
  String? chequeNo;
  @HiveField(16)
  String? bankName;
  @HiveField(17)
  List<PurchaseModeListBooking> purchaseMode;
  @HiveField(18)
  String? createdBy;
  @HiveField(19)
  String? scheme;
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