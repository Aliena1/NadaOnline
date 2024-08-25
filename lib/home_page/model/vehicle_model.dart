import 'package:hive/hive.dart';
part 'vehicle_model.g.dart';
@HiveType(typeId: 8)
class VehicleModel {
  @HiveField(0)
  bool? status;
  @HiveField(1)
  List<VehicleData>? data;

  VehicleModel({this.status, this.data});

  VehicleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <VehicleData>[];
      json['data'].forEach((v) {
        data!.add(new VehicleData.fromJson(v));
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

@HiveType(typeId: 9)
class VehicleData {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? displayName;
  @HiveField(3)
  String? logo;
  @HiveField(4)
  String? slug;
  @HiveField(5)
  List<Variant>? variant;
  @HiveField(6)
  List<ModelColor>? modelColor;

  VehicleData(
      {this.id,
        this.name,
        this.displayName,
        this.logo,
        this.slug,
        this.variant,
      this.modelColor
      });

  VehicleData.fromJson(Map<String, dynamic> json) {
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
        modelColor!.add(ModelColor.fromJson(v));
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

@HiveType(typeId: 10)
class Variant {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? modelId;
  @HiveField(2)
  String? name;
  @HiveField(3)
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

@HiveType(typeId: 11)
class Specification {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? variantId;
  @HiveField(2)
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

@HiveType(typeId: 12)
class ModelColor {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? modelId;
  @HiveField(2)
  String? colorName;
  @HiveField(3)
  String? colorImage;
  @HiveField(4)
  String? colorShortCode;
  @HiveField(5)
  String? colorHashvalue;
  @HiveField(6)

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