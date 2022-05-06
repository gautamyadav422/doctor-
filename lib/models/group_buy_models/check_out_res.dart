// To parse this JSON data, do
//
//     final checkOutRes = checkOutResFromJson(jsonString);

import 'dart:convert';

CheckOutRes checkOutResFromJson(String str) => CheckOutRes.fromJson(json.decode(str));

String checkOutResToJson(CheckOutRes data) => json.encode(data.toJson());

class CheckOutRes {
  CheckOutRes({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory CheckOutRes.fromJson(Map<String, dynamic> json) => CheckOutRes(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.appId,
    this.browserIp,
    this.buyerAcceptsMarketing,
    this.cancelReason,
    this.cancelledAt,
    this.cartToken,
    this.checkoutToken,
    this.clientDetails,
    this.closedAt,
    this.createdAt,
    this.currency,
    this.currentTotalDiscounts,
    this.currentTotalPrice,
    this.currentSubtotalPrice,
    this.currentTotalTax,
    this.customer,
    this.customerLocale,
    this.discountCodes,
    this.email,
    this.estimatedTaxes,
    this.financialStatus,
    this.fulfillments,
    this.fulfillmentStatus,
    this.gateway,
    this.dataId,
    this.landingSite,
    this.lineItems,
    this.locationId,
    this.name,
    this.note,
    this.noteAttributes,
    this.number,
    this.orderNumber,
    this.paymentTerms,
    this.paymentGatewayNames,
    this.phone,
    this.presentmentCurrency,
    this.processedAt,
    this.processingMethod,
    this.referringSite,
    this.refunds,
    this.shippingLines,
    this.sourceName,
    this.subtotalPrice,
    this.subtotalPriceSet,
    this.tags,
    this.taxLines,
    this.taxesIncluded,
    this.test,
    this.token,
    this.totalDiscounts,
    this.totalDiscountsSet,
    this.totalLineItemsPrice,
    this.totalLineItemsPriceSet,
    this.totalOutstanding,
    this.totalPrice,
    this.totalPriceSet,
    this.totalShippingPriceSet,
    this.totalTax,
    this.totalTaxSet,
    this.totalTipReceived,
    this.totalWeight,
    this.updatedAt,
    this.userId,
    this.deleted,
    this.id,
    this.v,
  });

  int? appId;
  dynamic browserIp;
  bool? buyerAcceptsMarketing;
  dynamic cancelReason;
  dynamic cancelledAt;
  dynamic cartToken;
  String? checkoutToken;
  ClientDetails? clientDetails;
  dynamic closedAt;
  DateTime? createdAt;
  Currency? currency;
  String? currentTotalDiscounts;
  String? currentTotalPrice;
  String? currentSubtotalPrice;
  String? currentTotalTax;
  String? customer;
  String? customerLocale;
  List<dynamic>? discountCodes;
  String? email;
  bool? estimatedTaxes;
  String? financialStatus;
  List<dynamic>? fulfillments;
  dynamic fulfillmentStatus;
  String? gateway;
  int? dataId;
  dynamic landingSite;
  List<LineItem>? lineItems;
  int? locationId;
  String? name;
  dynamic note;
  List<dynamic>? noteAttributes;
  int? number;
  int? orderNumber;
  PaymentTerms? paymentTerms;
  List<String>? paymentGatewayNames;
  dynamic phone;
  Currency? presentmentCurrency;
  DateTime? processedAt;
  String? processingMethod;
  dynamic referringSite;
  List<dynamic>? refunds;
  List<dynamic>? shippingLines;
  String? sourceName;
  int? subtotalPrice;
  Set? subtotalPriceSet;
  String? tags;
  List<TaxLine>? taxLines;
  bool? taxesIncluded;
  bool? test;
  String? token;
  String? totalDiscounts;
  Set? totalDiscountsSet;
  String? totalLineItemsPrice;
  Set? totalLineItemsPriceSet;
  String? totalOutstanding;
  String? totalPrice;
  Set? totalPriceSet;
  Set? totalShippingPriceSet;
  String? totalTax;
  Set? totalTaxSet;
  String? totalTipReceived;
  int? totalWeight;
  DateTime? updatedAt;
  dynamic userId;
  bool? deleted;
  String? id;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    appId: json["app_id"],
    browserIp: json["browser_ip"],
    buyerAcceptsMarketing: json["buyer_accepts_marketing"],
    cancelReason: json["cancel_reason"],
    cancelledAt: json["cancelled_at"],
    cartToken: json["cart_token"],
    checkoutToken: json["checkout_token"],
    clientDetails: ClientDetails.fromJson(json["client_details"]),
    closedAt: json["closed_at"],
    createdAt: DateTime.parse(json["created_at"]),
    currency: currencyValues.map![json["currency"]],
    currentTotalDiscounts: json["current_total_discounts"],
    currentTotalPrice: json["current_total_price"],
    currentSubtotalPrice: json["current_subtotal_price"],
    currentTotalTax: json["current_total_tax"],
    customer: json["customer"],
    customerLocale: json["customer_locale"],
    discountCodes: List<dynamic>.from(json["discount_codes"].map((x) => x)),
    email: json["email"],
    estimatedTaxes: json["estimated_taxes"],
    financialStatus: json["financial_status"],
    fulfillments: List<dynamic>.from(json["fulfillments"].map((x) => x)),
    fulfillmentStatus: json["fulfillment_status"],
    gateway: json["gateway"],
    dataId: json["id"],
    landingSite: json["landing_site"],
    lineItems: List<LineItem>.from(json["line_items"].map((x) => LineItem.fromJson(x))),
    locationId: json["location_id"],
    name: json["name"],
    note: json["note"],
    noteAttributes: List<dynamic>.from(json["note_attributes"].map((x) => x)),
    number: json["number"],
    orderNumber: json["order_number"],
    paymentTerms: PaymentTerms.fromJson(json["payment_terms"]),
    paymentGatewayNames: List<String>.from(json["payment_gateway_names"].map((x) => x)),
    phone: json["phone"],
    presentmentCurrency: currencyValues.map![json["presentment_currency"]],
    processedAt: DateTime.parse(json["processed_at"]),
    processingMethod: json["processing_method"],
    referringSite: json["referring_site"],
    refunds: List<dynamic>.from(json["refunds"].map((x) => x)),
    shippingLines: List<dynamic>.from(json["shipping_lines"].map((x) => x)),
    sourceName: json["source_name"],
    subtotalPrice: json["subtotal_price"],
    subtotalPriceSet: Set.fromJson(json["subtotal_price_set"]),
    tags: json["tags"],
    taxLines: List<TaxLine>.from(json["tax_lines"].map((x) => TaxLine.fromJson(x))),
    taxesIncluded: json["taxes_included"],
    test: json["test"],
    token: json["token"],
    totalDiscounts: json["total_discounts"],
    totalDiscountsSet: Set.fromJson(json["total_discounts_set"]),
    totalLineItemsPrice: json["total_line_items_price"],
    totalLineItemsPriceSet: Set.fromJson(json["total_line_items_price_set"]),
    totalOutstanding: json["total_outstanding"],
    totalPrice: json["total_price"],
    totalPriceSet: Set.fromJson(json["total_price_set"]),
    totalShippingPriceSet: Set.fromJson(json["total_shipping_price_set"]),
    totalTax: json["total_tax"],
    totalTaxSet: Set.fromJson(json["total_tax_set"]),
    totalTipReceived: json["total_tip_received"],
    totalWeight: json["total_weight"],
    updatedAt: DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    deleted: json["deleted"],
    id: json["_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "app_id": appId,
    "browser_ip": browserIp,
    "buyer_accepts_marketing": buyerAcceptsMarketing,
    "cancel_reason": cancelReason,
    "cancelled_at": cancelledAt,
    "cart_token": cartToken,
    "checkout_token": checkoutToken,
    "client_details": clientDetails!.toJson(),
    "closed_at": closedAt,
    "created_at": createdAt!.toIso8601String(),
    "currency": currencyValues.reverse[currency],
    "current_total_discounts": currentTotalDiscounts,
    "current_total_price": currentTotalPrice,
    "current_subtotal_price": currentSubtotalPrice,
    "current_total_tax": currentTotalTax,
    "customer": customer,
    "customer_locale": customerLocale,
    "discount_codes": List<dynamic>.from(discountCodes!.map((x) => x)),
    "email": email,
    "estimated_taxes": estimatedTaxes,
    "financial_status": financialStatus,
    "fulfillments": List<dynamic>.from(fulfillments!.map((x) => x)),
    "fulfillment_status": fulfillmentStatus,
    "gateway": gateway,
    "id": dataId,
    "landing_site": landingSite,
    "line_items": List<dynamic>.from(lineItems!.map((x) => x.toJson())),
    "location_id": locationId,
    "name": name,
    "note": note,
    "note_attributes": List<dynamic>.from(noteAttributes!.map((x) => x)),
    "number": number,
    "order_number": orderNumber,
    "payment_terms": paymentTerms!.toJson(),
    "payment_gateway_names": List<dynamic>.from(paymentGatewayNames!.map((x) => x)),
    "phone": phone,
    "presentment_currency": currencyValues.reverse[presentmentCurrency],
    "processed_at": processedAt!.toIso8601String(),
    "processing_method": processingMethod,
    "referring_site": referringSite,
    "refunds": List<dynamic>.from(refunds!.map((x) => x)),
    "shipping_lines": List<dynamic>.from(shippingLines!.map((x) => x)),
    "source_name": sourceName,
    "subtotal_price": subtotalPrice,
    "subtotal_price_set": subtotalPriceSet!.toJson(),
    "tags": tags,
    "tax_lines": List<dynamic>.from(taxLines!.map((x) => x.toJson())),
    "taxes_included": taxesIncluded,
    "test": test,
    "token": token,
    "total_discounts": totalDiscounts,
    "total_discounts_set": totalDiscountsSet!.toJson(),
    "total_line_items_price": totalLineItemsPrice,
    "total_line_items_price_set": totalLineItemsPriceSet!.toJson(),
    "total_outstanding": totalOutstanding,
    "total_price": totalPrice,
    "total_price_set": totalPriceSet!.toJson(),
    "total_shipping_price_set": totalShippingPriceSet!.toJson(),
    "total_tax": totalTax,
    "total_tax_set": totalTaxSet!.toJson(),
    "total_tip_received": totalTipReceived,
    "total_weight": totalWeight,
    "updated_at": updatedAt!.toIso8601String(),
    "user_id": userId,
    "deleted": deleted,
    "_id": id,
    "__v": v,
  };
}

class ClientDetails {
  ClientDetails({
    this.browserIp,
    this.userAgent,
    this.sessionHash,
    this.browserWidth,
    this.browserHeight,
    this.acceptLanguage,
  });

  dynamic browserIp;
  dynamic userAgent;
  dynamic sessionHash;
  dynamic browserWidth;
  dynamic browserHeight;
  dynamic acceptLanguage;

  factory ClientDetails.fromJson(Map<String, dynamic> json) => ClientDetails(
    browserIp: json["browser_ip"],
    userAgent: json["user_agent"],
    sessionHash: json["session_hash"],
    browserWidth: json["browser_width"],
    browserHeight: json["browser_height"],
    acceptLanguage: json["accept_language"],
  );

  Map<String, dynamic> toJson() => {
    "browser_ip": browserIp,
    "user_agent": userAgent,
    "session_hash": sessionHash,
    "browser_width": browserWidth,
    "browser_height": browserHeight,
    "accept_language": acceptLanguage,
  };
}

enum Currency { INR }

final currencyValues = EnumValues({
  "INR": Currency.INR
});

class LineItem {
  LineItem({
    this.id,
    this.adminGraphqlApiId,
    this.fulfillableQuantity,
    this.fulfillmentService,
    this.fulfillmentStatus,
    this.giftCard,
    this.grams,
    this.name,
    this.originLocation,
    this.price,
    this.priceSet,
    this.productExists,
    this.productId,
    this.properties,
    this.quantity,
    this.requiresShipping,
    this.sku,
    this.taxable,
    this.title,
    this.totalDiscount,
    this.totalDiscountSet,
    this.variantId,
    this.variantInventoryManagement,
    this.variantTitle,
    this.vendor,
    this.taxLines,
    this.duties,
    this.discountAllocations,
  });

  int? id;
  String? adminGraphqlApiId;
  int? fulfillableQuantity;
  String? fulfillmentService;
  dynamic fulfillmentStatus;
  bool? giftCard;
  int? grams;
  String? name;
  OriginLocation? originLocation;
  String? price;
  Set? priceSet;
  bool? productExists;
  int? productId;
  List<dynamic>? properties;
  int? quantity;
  bool? requiresShipping;
  String? sku;
  bool? taxable;
  String? title;
  String? totalDiscount;
  Set? totalDiscountSet;
  int? variantId;
  String? variantInventoryManagement;
  String? variantTitle;
  String? vendor;
  List<TaxLine>? taxLines;
  List<dynamic>? duties;
  List<dynamic>? discountAllocations;

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
    id: json["id"],
    adminGraphqlApiId: json["admin_graphql_api_id"],
    fulfillableQuantity: json["fulfillable_quantity"],
    fulfillmentService: json["fulfillment_service"],
    fulfillmentStatus: json["fulfillment_status"],
    giftCard: json["gift_card"],
    grams: json["grams"],
    name: json["name"],
    originLocation: OriginLocation.fromJson(json["origin_location"]),
    price: json["price"],
    priceSet: Set.fromJson(json["price_set"]),
    productExists: json["product_exists"],
    productId: json["product_id"],
    properties: List<dynamic>.from(json["properties"].map((x) => x)),
    quantity: json["quantity"],
    requiresShipping: json["requires_shipping"],
    sku: json["sku"],
    taxable: json["taxable"],
    title: json["title"],
    totalDiscount: json["total_discount"],
    totalDiscountSet: Set.fromJson(json["total_discount_set"]),
    variantId: json["variant_id"],
    variantInventoryManagement: json["variant_inventory_management"],
    variantTitle: json["variant_title"],
    vendor: json["vendor"],
    taxLines: List<TaxLine>.from(json["tax_lines"].map((x) => TaxLine.fromJson(x))),
    duties: List<dynamic>.from(json["duties"].map((x) => x)),
    discountAllocations: List<dynamic>.from(json["discount_allocations"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_graphql_api_id": adminGraphqlApiId,
    "fulfillable_quantity": fulfillableQuantity,
    "fulfillment_service": fulfillmentService,
    "fulfillment_status": fulfillmentStatus,
    "gift_card": giftCard,
    "grams": grams,
    "name": name,
    "origin_location": originLocation!.toJson(),
    "price": price,
    "price_set": priceSet!.toJson(),
    "product_exists": productExists,
    "product_id": productId,
    "properties": List<dynamic>.from(properties!.map((x) => x)),
    "quantity": quantity,
    "requires_shipping": requiresShipping,
    "sku": sku,
    "taxable": taxable,
    "title": title,
    "total_discount": totalDiscount,
    "total_discount_set": totalDiscountSet!.toJson(),
    "variant_id": variantId,
    "variant_inventory_management": variantInventoryManagement,
    "variant_title": variantTitle,
    "vendor": vendor,
    "tax_lines": List<dynamic>.from(taxLines!.map((x) => x.toJson())),
    "duties": List<dynamic>.from(duties!.map((x) => x)),
    "discount_allocations": List<dynamic>.from(discountAllocations!.map((x) => x)),
  };
}

class OriginLocation {
  OriginLocation({
    this.id,
    this.countryCode,
    this.provinceCode,
    this.name,
    this.address1,
    this.address2,
    this.city,
    this.zip,
  });

  int? id;
  String? countryCode;
  String? provinceCode;
  String? name;
  String? address1;
  String? address2;
  String? city;
  String? zip;

  factory OriginLocation.fromJson(Map<String, dynamic> json) => OriginLocation(
    id: json["id"],
    countryCode: json["country_code"],
    provinceCode: json["province_code"],
    name: json["name"],
    address1: json["address1"],
    address2: json["address2"],
    city: json["city"],
    zip: json["zip"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country_code": countryCode,
    "province_code": provinceCode,
    "name": name,
    "address1": address1,
    "address2": address2,
    "city": city,
    "zip": zip,
  };
}

class Set {
  Set({
    this.shopMoney,
    this.presentmentMoney,
  });

  Money? shopMoney;
  Money? presentmentMoney;

  factory Set.fromJson(Map<String, dynamic> json) => Set(
    shopMoney: Money.fromJson(json["shop_money"]),
    presentmentMoney: Money.fromJson(json["presentment_money"]),
  );

  Map<String, dynamic> toJson() => {
    "shop_money": shopMoney!.toJson(),
    "presentment_money": presentmentMoney!.toJson(),
  };
}

class Money {
  Money({
    this.amount,
    this.currencyCode,
  });

  String? amount;
  Currency? currencyCode;

  factory Money.fromJson(Map<String, dynamic> json) => Money(
    amount: json["amount"],
    currencyCode: currencyValues.map![json["currency_code"]],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currency_code": currencyValues.reverse[currencyCode],
  };
}

class TaxLine {
  TaxLine({
    this.channelLiable,
    this.price,
    this.priceSet,
    this.rate,
    this.title,
  });

  bool? channelLiable;
  String? price;
  Set? priceSet;
  double? rate;
  String? title;

  factory TaxLine.fromJson(Map<String, dynamic> json) => TaxLine(
    channelLiable: json["channel_liable"],
    price: json["price"],
    priceSet: Set.fromJson(json["price_set"]),
    rate: json["rate"].toDouble(),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "channel_liable": channelLiable,
    "price": price,
    "price_set": priceSet!.toJson(),
    "rate": rate,
    "title": title,
  };
}

class PaymentTerms {
  PaymentTerms({
    this.paymentSchedules,
  });

  List<dynamic>? paymentSchedules;

  factory PaymentTerms.fromJson(Map<String, dynamic> json) => PaymentTerms(
    paymentSchedules: List<dynamic>.from(json["payment_schedules"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "payment_schedules": List<dynamic>.from(paymentSchedules!.map((x) => x)),
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
