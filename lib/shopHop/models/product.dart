class Product {
  String? message;
  bool? success;
  Data? data;

  Product({this.message, this.success, this.data});

  Product.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? productName;
  int? productId;
  String? productSlug;
  String? description;
  String? realPrice;
  String? originalPrice;
  String? category;
  String? subCategory;
  String? defaultImage;
  List<Attributes>? attributes;

  Data(
      {this.productName,
        this.productId,
        this.productSlug,
        this.description,
        this.realPrice,
        this.originalPrice,
        this.category,
        this.subCategory,
        this.defaultImage,
        this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    productId = json['product_id'];
    productSlug = json['product_slug'];
    description = json['description'];
    realPrice = json['real_price'];
    originalPrice = json['original_price'];
    category = json['category'];
    subCategory = json['sub_category'];
    defaultImage = json['default_image'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(new Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['product_id'] = this.productId;
    data['product_slug'] = this.productSlug;
    data['description'] = this.description;
    data['real_price'] = this.realPrice;
    data['original_price'] = this.originalPrice;
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    data['default_image'] = this.defaultImage;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  int? id;
  int? valueId;
  String? name;
  String? attributeValName;
  String? imageUrl;

  Attributes(
      {this.id, this.valueId, this.name, this.attributeValName, this.imageUrl});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    valueId = json['value_id'];
    name = json['name'];
    attributeValName = json['attribute_val_name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value_id'] = this.valueId;
    data['name'] = this.name;
    data['attribute_val_name'] = this.attributeValName;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
