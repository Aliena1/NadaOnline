class EnquiryModelClass {
  bool? status;
  Data? data;

  EnquiryModelClass({this.status, this.data});

  EnquiryModelClass.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<CustomerType>? customerType;
  List<EnquiryType>? enquiryType;
  List<PurchaseMode>? purchaseMode;
  List<Scheme>? scheme;
  List<FinancingBank>? financingBank;
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

class CustomerType {
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

class EnquiryType {
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

class PurchaseMode {
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

class Scheme {
  String? id;
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

class FinancingBank {
  String? id;
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

class Occupation {
  String? occupationId;
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
