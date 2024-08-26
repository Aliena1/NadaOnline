import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'enquiry_detail_model.g.dart';

@HiveType(typeId: 13)
class EnquiryDetailModel extends Equatable {
  @HiveField(0)
  final List<EnquiryModelList> enquiredModel;
  @HiveField(1)
  final String? fullName;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? address;
  @HiveField(4)
  final String? phone;
  @HiveField(5)
  final String? alternatePhone;
  @HiveField(6)
  final String? customerType;
  @HiveField(7)
  final String? enquiryType;
  @HiveField(8)
  final String? scheme;
  @HiveField(9)
  final String? occupation;
  @HiveField(10)
  final List<PurchaseModeList> purchaseMode;
  @HiveField(11)
  final String? message;
  @HiveField(12)
  final String? createdBy;
  @HiveField(13)
  bool isSended;

  EnquiryDetailModel(
      {required this.enquiredModel,
        this.fullName,
        this.email,
        this.address,
        this.phone,
        this.alternatePhone,
        this.customerType,
        this.enquiryType,
        this.scheme,
        this.occupation,
        required this.purchaseMode,
        this.message,
        this.createdBy,
        this.isSended = false});

  Map<String, dynamic> toEnquiryDetailJson() => {
    "enquired_model" : enquiredModel.map((enquiredModel) => enquiredModel.enquiryModel).toList(),
    "fullname": fullName,
    "email": email,
    "address": address,
    "phone": phone,
    "alternate_phone": alternatePhone,
    "customer_type": customerType,
    "enquiry_type": enquiryType,
    "scheme": scheme,
    "occupation": occupation,
    "purchase_mode" : purchaseMode.map((purchaseMode) => purchaseMode.purchaseModeList).toList(),
    "message": message,
    "createdBy": createdBy,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [
    enquiredModel,
    fullName,
    email,
    address,
    phone,
    alternatePhone,
    customerType,
    enquiryType,
    scheme,
    occupation,
    purchaseMode,
    message,
    createdBy
  ];
}

@HiveType(typeId: 14)
class EnquiryModelList extends Equatable{
  @HiveField(0)
  final String? enquiryModel;

  EnquiryModelList({required this.enquiryModel});


  @override
  // TODO: implement props
  List<Object?> get props => [enquiryModel];

}

@HiveType(typeId: 15)
class PurchaseModeList extends Equatable{
  @HiveField(0)
  final String? purchaseModeList;

  PurchaseModeList({required this.purchaseModeList});


  @override
  // TODO: implement props
  List<Object?> get props => [purchaseModeList];

}