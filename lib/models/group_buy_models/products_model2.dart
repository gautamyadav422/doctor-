//some null params commented in this pojo,just update that if you will need to use that

class ProductsModelOld {
  List<Data>? data;
  bool? status;

  ProductsModelOld({this.data, this.status});

  ProductsModelOld.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  Image? image;
  String? sId;
  int? id;
  String? title;
  String? bodyHtml;
  String? vendor;
  String? productType;
  String? createdAt;
  String? handle;
  String? updatedAt;
  String? publishedAt;
  String? templateSuffix;
  String? status;
  String? publishedScope;
  String? tags;
  String? adminGraphqlApiId;
  List<Variants>? variants;
  List<Options>? options;
  List<Images>? images;
  int? iV;
  bool? isAdded = false;
  int? units = 0;

  Data(
      {this.image,
        this.sId,
        this.id,
        this.title,
        this.bodyHtml,
        this.vendor,
        this.productType,
        this.createdAt,
        this.handle,
        this.updatedAt,
        this.publishedAt,
        this.templateSuffix,
        this.status,
        this.publishedScope,
        this.tags,
        this.adminGraphqlApiId,
        this.variants,
        this.options,
        this.images,
        this.iV,
        this.isAdded,
        this.units
      });

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    sId = json['_id'];
    id = json['id'];
    title = json['title'];
    bodyHtml = json['body_html'];
    vendor = json['vendor'];
    productType = json['product_type'];
    createdAt = json['created_at'];
    handle = json['handle'];
    updatedAt = json['updated_at'];
    publishedAt = json['published_at'];
    templateSuffix = json['template_suffix'];
    status = json['status'];
    publishedScope = json['published_scope'];
    tags = json['tags'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body_html'] = this.bodyHtml;
    data['vendor'] = this.vendor;
    data['product_type'] = this.productType;
    data['created_at'] = this.createdAt;
    data['handle'] = this.handle;
    data['updated_at'] = this.updatedAt;
    data['published_at'] = this.publishedAt;
    data['template_suffix'] = this.templateSuffix;
    data['status'] = this.status;
    data['published_scope'] = this.publishedScope;
    data['tags'] = this.tags;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Image {
  int? id;
  int? productId;
  int? position;
  String? createdAt;
  String? updatedAt;
  Null? alt;
  int? width;
  int? height;
  String? src;
  List<Null>? variantIds;
  String? adminGraphqlApiId;

  Image(
      {this.id,
        this.productId,
        this.position,
        this.createdAt,
        this.updatedAt,
        this.alt,
        this.width,
        this.height,
        this.src,
        this.variantIds,
        this.adminGraphqlApiId});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    alt = json['alt'];
    width = json['width'];
    height = json['height'];
    src = json['src'];
    if (json['variant_ids'] != null) {
      variantIds = <Null>[];
      /*json['variant_ids'].forEach((v) {
        variantIds!.add(new Null.fromJson(v));
      });*/
    }
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['position'] = this.position;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['alt'] = this.alt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['src'] = this.src;
/*    if (this.variantIds != null) {
      data['variant_ids'] = this.variantIds!.map((v) => v.toJson()).toList();
    }*/
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    return data;
  }
}

class Variants {
  int? id;
  int? productId;
  String? title;
  String? price;
  String? sku;
  int? position;
  String? inventoryPolicy;
  String? compareAtPrice;
  String? fulfillmentService;
  String? inventoryManagement;
  String? option1;
  Null? option2;
  Null? option3;
  String? createdAt;
  String? updatedAt;
  bool? taxable;
  String? barcode;
  int? grams;
  Null? imageId;
  double? weight;
  String? weightUnit;
  int? inventoryItemId;
  int? inventoryQuantity;
  int? oldInventoryQuantity;
  bool? requiresShipping;
  String? adminGraphqlApiId;
  String? sId;

  Variants(
      {this.id,
        this.productId,
        this.title,
        this.price,
        this.sku,
        this.position,
        this.inventoryPolicy,
        this.compareAtPrice,
        this.fulfillmentService,
        this.inventoryManagement,
        this.option1,
        this.option2,
        this.option3,
        this.createdAt,
        this.updatedAt,
        this.taxable,
        this.barcode,
        this.grams,
        this.imageId,
        this.weight,
        this.weightUnit,
        this.inventoryItemId,
        this.inventoryQuantity,
        this.oldInventoryQuantity,
        this.requiresShipping,
        this.adminGraphqlApiId,
        this.sId});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    title = json['title'];
    price = json['price'];
    sku = json['sku'];
    position = json['position'];
    inventoryPolicy = json['inventory_policy'];
    compareAtPrice = json['compare_at_price'];
    fulfillmentService = json['fulfillment_service'];
    inventoryManagement = json['inventory_management'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxable = json['taxable'];
    barcode = json['barcode'];
    grams = json['grams'];
    imageId = json['image_id'];
    weight != null ? checkDouble(json['weight']) : null;
    weightUnit = json['weight_unit'];
    inventoryItemId = json['inventory_item_id'];
    inventoryQuantity = json['inventory_quantity'];
    oldInventoryQuantity = json['old_inventory_quantity'];
    requiresShipping = json['requires_shipping'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['sku'] = this.sku;
    data['position'] = this.position;
    data['inventory_policy'] = this.inventoryPolicy;
    data['compare_at_price'] = this.compareAtPrice;
    data['fulfillment_service'] = this.fulfillmentService;
    data['inventory_management'] = this.inventoryManagement;
    data['option1'] = this.option1;
    data['option2'] = this.option2;
    data['option3'] = this.option3;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['taxable'] = this.taxable;
    data['barcode'] = this.barcode;
    data['grams'] = this.grams;
    data['image_id'] = this.imageId;
    data['weight'] = this.weight;
    data['weight_unit'] = this.weightUnit;
    data['inventory_item_id'] = this.inventoryItemId;
    data['inventory_quantity'] = this.inventoryQuantity;
    data['old_inventory_quantity'] = this.oldInventoryQuantity;
    data['requires_shipping'] = this.requiresShipping;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    data['_id'] = this.sId;
    return data;
  }
}

class Options {
  int? id;
  int? productId;
  String? name;
  int? position;
  List<String>? values;
  String? sId;

  Options(
      {this.id,
        this.productId,
        this.name,
        this.position,
        this.values,
        this.sId});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    position = json['position'];
    values = json['values'].cast<String>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['position'] = this.position;
    data['values'] = this.values;
    data['_id'] = this.sId;
    return data;
  }
}

class Images {
  int? id;
  int? productId;
  int? position;
  String? createdAt;
  String? updatedAt;
  Null? alt;
  int? width;
  int? height;
  String? src;
  List<Null>? variantIds;
  String? adminGraphqlApiId;
  String? sId;

  Images(
      {this.id,
        this.productId,
        this.position,
        this.createdAt,
        this.updatedAt,
        this.alt,
        this.width,
        this.height,
        this.src,
        this.variantIds,
        this.adminGraphqlApiId,
        this.sId});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    alt = json['alt'];
    width = json['width'];
    height = json['height'];
    src = json['src'];
    if (json['variant_ids'] != null) {
      variantIds = <Null>[];
      /*json['variant_ids'].forEach((v) {
        variantIds!.add(new Null.fromJson(v));
      });*/
    }
    adminGraphqlApiId = json['admin_graphql_api_id'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['position'] = this.position;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['alt'] = this.alt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['src'] = this.src;
/*    if (this.variantIds != null) {
      data['variant_ids'] = this.variantIds!.map((v) => v.toJson()).toList();
    }*/
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    data['_id'] = this.sId;
    return data;
  }
}
double checkDouble(dynamic value) {
  if (value is String) {
    return double.parse(value);
  } else {
    return value.toDouble();
  }
}