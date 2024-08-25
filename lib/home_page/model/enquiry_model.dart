import 'package:hive/hive.dart';
part 'enquiry_model.g.dart';
@HiveType(typeId: 0)
class EnquiryModelClass {
  @HiveField(0)
  bool? status;
  @HiveField(1)
  Data? data;

  EnquiryModelClass({this.status, this.data});

  EnquiryModelClass.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

@HiveType(typeId: 1)
class Data {
  @HiveField(0)
  List<CustomerType>? customerType;
  @HiveField(1)
  List<EnquiryType>? enquiryType;
  @HiveField(2)
  List<PurchaseMode>? purchaseMode;
  @HiveField(3)
  List<Scheme>? scheme;
  @HiveField(4)
  List<FinancingBank>? financingBank;
  @HiveField(5)
  List<Occupation>? occupation;

  Data(
      {this.customerType,
        this.enquiryType,
        this.purchaseMode,
        this.scheme,
        this.financingBank,
        this.occupation});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['customerType'] != null) {
      customerType = <CustomerType>[];
      json['customerType'].forEach((v) {
        customerType!.add(new CustomerType.fromJson(v));
      });
    }
    if (json['enquiryType'] != null) {
      enquiryType = <EnquiryType>[];
      json['enquiryType'].forEach((v) {
        enquiryType!.add(new EnquiryType.fromJson(v));
      });
    }
    if (json['purchaseMode'] != null) {
      purchaseMode = <PurchaseMode>[];
      json['purchaseMode'].forEach((v) {
        purchaseMode!.add(new PurchaseMode.fromJson(v));
      });
    }
    if (json['scheme'] != null) {
      scheme = <Scheme>[];
      json['scheme'].forEach((v) {
        scheme!.add(new Scheme.fromJson(v));
      });
    }
    if (json['financingBank'] != null) {
      financingBank = <FinancingBank>[];
      json['financingBank'].forEach((v) {
        financingBank!.add(new FinancingBank.fromJson(v));
      });
    }
    if (json['occupation'] != null) {
      occupation = <Occupation>[];
      json['occupation'].forEach((v) {
        occupation!.add(new Occupation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerType != null) {
      data['customerType'] = this.customerType!.map((v) => v.toJson()).toList();
    }
    if (this.enquiryType != null) {
      data['enquiryType'] = this.enquiryType!.map((v) => v.toJson()).toList();
    }
    if (this.purchaseMode != null) {
      data['purchaseMode'] = this.purchaseMode!.map((v) => v.toJson()).toList();
    }
    if (this.scheme != null) {
      data['scheme'] = this.scheme!.map((v) => v.toJson()).toList();
    }
    if (this.financingBank != null) {
      data['financingBank'] =
          this.financingBank!.map((v) => v.toJson()).toList();
    }
    if (this.occupation != null) {
      data['occupation'] = this.occupation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


@HiveType(typeId: 2)
class CustomerType {
  @HiveField(0)
  String? type;

  CustomerType({this.type});

  CustomerType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    return data;
  }
}


@HiveType(typeId: 3)
class EnquiryType {
  @HiveField(0)
  String? type;

  EnquiryType({this.type});

  EnquiryType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    return data;
  }
}

@HiveType(typeId: 4)
class PurchaseMode {
  @HiveField(0)
  String? type;

  PurchaseMode({this.type});

  PurchaseMode.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    return data;
  }
}

@HiveType(typeId: 5)
class Scheme {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? scheme;

  Scheme({this.id, this.scheme});

  Scheme.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scheme = json['scheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scheme'] = this.scheme;
    return data;
  }
}

@HiveType(typeId: 6)
class FinancingBank {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? bankName;

  FinancingBank({this.id, this.bankName});

  FinancingBank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bank_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank_name'] = this.bankName;
    return data;
  }
}

@HiveType(typeId: 7)
class Occupation {
  @HiveField(0)
  String? occupationId;
  @HiveField(1)
  String? occupation;

  Occupation({this.occupationId, this.occupation});

  Occupation.fromJson(Map<String, dynamic> json) {
    occupationId = json['occupation_id'];
    occupation = json['occupation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['occupation_id'] = this.occupationId;
    data['occupation'] = this.occupation;
    return data;
  }
}