// To parse this JSON data, do
//
//     final cartItems = cartItemsFromJson(jsonString);

import 'dart:convert';

CartItems cartItemsFromJson(String str) => CartItems.fromJson(json.decode(str));

String cartItemsToJson(CartItems data) => json.encode(data.toJson());

class CartItems {
    CartItems({
        this.data,
        this.status,
    });

    List<Datum>? data;
    bool? status;

    factory CartItems.fromJson(Map<String, dynamic> json) => CartItems(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
    };
}

class Datum {
    Datum({
        this.discountApplications,
        this.paymentTerms,
        this.id,
        this.createdAt,
        this.currency,
        this.customer,
        this.discountCodes,
        this.email,
        this.fulfillments,
        this.datumId,
        this.lineItems,
        this.name,
        this.note,
        this.noteAttributes,
        this.paymentGatewayNames,
        this.refunds,
        this.shippingLines,
        this.subtotalPrice,
        this.tags,
        this.taxLines,
        this.taxesIncluded,
        this.totalPrice,
        this.totalTax,
        this.updatedAt,
        this.completedAt,
        this.completed,
        this.v,
    });

    DiscountApplications? discountApplications;
    PaymentTerms? paymentTerms;
    String? id;
    DateTime? createdAt;
    String? currency;
    String? customer;
    List<dynamic>? discountCodes;
    String? email;
    List<dynamic>? fulfillments;
    int? datumId;
    List<LineItem>? lineItems;
    String? name;
    dynamic note;
    List<dynamic>? noteAttributes;
    List<dynamic>? paymentGatewayNames;
    List<dynamic>? refunds;
    List<dynamic>? shippingLines;
    int? subtotalPrice;
    String? tags;
    List<TaxLine>? taxLines;
    bool? taxesIncluded;
    String? totalPrice;
    String? totalTax;
    DateTime? updatedAt;
    dynamic completedAt;
    bool? completed;
    int? v;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        discountApplications: DiscountApplications.fromJson(json["discount_applications"]),
        paymentTerms: json["payment_terms"]!=null?PaymentTerms.fromJson(json["payment_terms"]):PaymentTerms(),
        id: json["_id"],
        createdAt: DateTime.parse(json["created_at"]),
        currency: json["currency"],
        customer: json["customer"],
        discountCodes: List<dynamic>.from(json["discount_codes"].map((x) => x)),
        email: json["email"],
        fulfillments: List<dynamic>.from(json["fulfillments"].map((x) => x)),
        datumId: json["id"],
        lineItems: List<LineItem>.from(json["line_items"].map((x) => LineItem.fromJson(x))),
        name: json["name"],
        note: json["note"],
        noteAttributes: List<dynamic>.from(json["note_attributes"].map((x) => x)),
        paymentGatewayNames: List<dynamic>.from(json["payment_gateway_names"].map((x) => x)),
        refunds: List<dynamic>.from(json["refunds"].map((x) => x)),
        shippingLines: List<dynamic>.from(json["shipping_lines"].map((x) => x)),
        subtotalPrice: json["subtotal_price"],
        tags: json["tags"],
        taxLines: List<TaxLine>.from(json["tax_lines"].map((x) => TaxLine.fromJson(x))),
        taxesIncluded: json["taxes_included"],
        totalPrice: json["total_price"],
        totalTax: json["total_tax"],
        updatedAt: DateTime.parse(json["updated_at"]),
        completedAt: json["completed_at"],
        completed: json["completed"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "discount_applications": discountApplications!.toJson(),
        "payment_terms": paymentTerms!.toJson(),
        "_id": id,
        "created_at": createdAt!.toIso8601String(),
        "currency": currency,
        "customer": customer,
        "discount_codes": List<dynamic>.from(discountCodes!.map((x) => x)),
        "email": email,
        "fulfillments": List<dynamic>.from(fulfillments!.map((x) => x)),
        "id": datumId,
        "line_items": List<dynamic>.from(lineItems!.map((x) => x.toJson())),
        "name": name,
        "note": note,
        "note_attributes": List<dynamic>.from(noteAttributes!.map((x) => x)),
        "payment_gateway_names": List<dynamic>.from(paymentGatewayNames!.map((x) => x)),
        "refunds": List<dynamic>.from(refunds!.map((x) => x)),
        "shipping_lines": List<dynamic>.from(shippingLines!.map((x) => x)),
        "subtotal_price": subtotalPrice,
        "tags": tags,
        "tax_lines": List<dynamic>.from(taxLines!.map((x) => x.toJson())),
        "taxes_included": taxesIncluded,
        "total_price": totalPrice,
        "total_tax": totalTax,
        "updated_at": updatedAt!.toIso8601String(),
        "completed_at": completedAt,
        "completed": completed,
        "__v": v,
    };
}

class DiscountApplications {
    DiscountApplications({
        this.discountApplications,
    });

    List<dynamic>? discountApplications;

    factory DiscountApplications.fromJson(Map<String, dynamic> json) => DiscountApplications(
        discountApplications: List<dynamic>.from(json["discount_applications"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "discount_applications": List<dynamic>.from(discountApplications!.map((x) => x)),
    };
}

class LineItem {
    LineItem({
        this.id,
        this.variantId,
        this.productId,
        this.title,
        this.variantTitle,
        this.sku,
        this.vendor,
        this.quantity,
        this.requiresShipping,
        this.taxable,
        this.giftCard,
        this.fulfillmentService,
        this.grams,
        this.taxLines,
        this.appliedDiscount,
        this.name,
        this.properties,
        this.custom,
        this.price,
        this.adminGraphqlApiId,
        this.isAvailable,
        this.availableQuantity,
    });

    int? id;
    int? variantId;
    int? productId;
    String? title;
    dynamic variantTitle;
    String? sku;
    String? vendor;
    int? quantity;
    bool? requiresShipping;
    bool? taxable;
    bool? giftCard;
    String? fulfillmentService;
    int? grams;
    List<TaxLine>? taxLines;
    dynamic appliedDiscount;
    String? name;
    List<dynamic>? properties;
    bool? custom;
    String? price;
    String? adminGraphqlApiId;
    bool? isAvailable;
    int? availableQuantity;

    factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
        id: json["id"],
        variantId: json["variant_id"],
        productId: json["product_id"],
        title: json["title"],
        variantTitle: json["variant_title"],
        sku: json["sku"],
        vendor: json["vendor"],
        quantity: json["quantity"],
        requiresShipping: json["requires_shipping"],
        taxable: json["taxable"],
        giftCard: json["gift_card"],
        fulfillmentService: json["fulfillment_service"],
        grams: json["grams"],
        taxLines: List<TaxLine>.from(json["tax_lines"].map((x) => TaxLine.fromJson(x))),
        appliedDiscount: json["applied_discount"],
        name: json["name"],
        properties: List<dynamic>.from(json["properties"].map((x) => x)),
        custom: json["custom"],
        price: json["price"],
        adminGraphqlApiId: json["admin_graphql_api_id"],
        isAvailable: json["isAvailable"],
        availableQuantity: json["availableQuantity"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "variant_id": variantId,
        "product_id": productId,
        "title": title,
        "variant_title": variantTitle,
        "sku": sku,
        "vendor": vendor,
        "quantity": quantity,
        "requires_shipping": requiresShipping,
        "taxable": taxable,
        "gift_card": giftCard,
        "fulfillment_service": fulfillmentService,
        "grams": grams,
        "tax_lines": List<dynamic>.from(taxLines!.map((x) => x.toJson())),
        "applied_discount": appliedDiscount,
        "name": name,
        "properties": List<dynamic>.from(properties!.map((x) => x)),
        "custom": custom,
        "price": price,
        "admin_graphql_api_id": adminGraphqlApiId,
        "isAvailable": isAvailable,
        "availableQuantity": availableQuantity,
    };
}

class TaxLine {
    TaxLine({
        this.rate,
        this.title,
        this.price,
    });

    double? rate;
    String? title;
    String? price;

    factory TaxLine.fromJson(Map<String, dynamic> json) => TaxLine(
        rate: json["rate"].toDouble(),
        title: json["title"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "title": title,
        "price": price,
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
