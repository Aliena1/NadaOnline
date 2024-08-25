class VehicleModel {
  bool? status;
  List<Data>? data;

  VehicleModel({this.status, this.data});

  VehicleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? displayName;
  String? logo;
  String? slug;
  List<Variant>? variant;
  List<ModelColor>? modelColor;

  Data(
      {this.id,
        this.name,
        this.displayName,
        this.logo,
        this.slug,
        this.variant,
        this.modelColor});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['display_name'];
    logo = json['logo'];
    slug = json['slug'];
    if (json['variant'] != null) {
      variant = <Variant>[];
      json['variant'].forEach((v) {
        variant!.add(new Variant.fromJson(v));
      });
    }
    if (json['model_color'] != null) {
      modelColor = <ModelColor>[];
      json['model_color'].forEach((v) {
        modelColor!.add(new ModelColor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['display_name'] = this.displayName;
    data['logo'] = this.logo;
    data['slug'] = this.slug;
    if (this.variant != null) {
      data['variant'] = this.variant!.map((v) => v.toJson()).toList();
    }
    if (this.modelColor != null) {
      data['model_color'] = this.modelColor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variant {
  int? id;
  int? modelId;
  String? name;
  Specification? specification;

  Variant({this.id, this.modelId, this.name, this.specification});

  Variant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelId = json['model_id'];
    name = json['name'];
    specification = json['specification'] != null
        ? new Specification.fromJson(json['specification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['model_id'] = this.modelId;
    data['name'] = this.name;
    if (this.specification != null) {
      data['specification'] = this.specification!.toJson();
    }
    return data;
  }
}

class Specification {
  int? id;
  int? variantId;
  String? price;

  Specification({this.id, this.variantId, this.price});

  Specification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    variantId = json['variant_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['variant_id'] = this.variantId;
    data['price'] = this.price;
    return data;
  }
}

class ModelColor {
  int? id;
  int? modelId;
  String? colorName;
  String? colorImage;
  Null? colorShortCode;
  Null? colorHashvalue;

  ModelColor(
      {this.id,
        this.modelId,
        this.colorName,
        this.colorImage,
        this.colorShortCode,
        this.colorHashvalue});

  ModelColor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelId = json['model_id'];
    colorName = json['color_name'];
    colorImage = json['color_image'];
    colorShortCode = json['color_short_code'];
    colorHashvalue = json['color_hashvalue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['model_id'] = this.modelId;
    data['color_name'] = this.colorName;
    data['color_image'] = this.colorImage;
    data['color_short_code'] = this.colorShortCode;
    data['color_hashvalue'] = this.colorHashvalue;
    return data;
  }
}
