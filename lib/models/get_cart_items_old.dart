class CartItems {
    List<Data>? data;
    bool? status;

    CartItems({this.data, this.status});

    CartItems.fromJson(Map<String, dynamic> json) {
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
    Null? billingAddress;
    DiscountApplications? discountApplications;
    Null? paymentTerms;
    Null? shippingAddress;
    String? sId;
    String? createdAt;
    String? currency;
    String? customer;
    List<int>? discountCodes;
    String? email;
    List<int>? fulfillments;
    int? id;
    List<LineItems>? lineItems;
    String? name;
    Null? note;
    List<int>? noteAttributes;
    List<int>? paymentGatewayNames;
    List<int>? refunds;
    List<int>? shippingLines;
    int? subtotalPrice;
    String? tags;
    List<TaxLines>? taxLines;
    bool? taxesIncluded;
    String? totalPrice;
    String? totalTax;
    String? updatedAt;
    Null? completedAt;
    bool? completed;
    int? iV;

    Data(
        {this.billingAddress,
            this.discountApplications,
            this.paymentTerms,
            this.shippingAddress,
            this.sId,
            this.createdAt,
            this.currency,
            this.customer,
            this.discountCodes,
            this.email,
            this.fulfillments,
            this.id,
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
            this.iV});

    Data.fromJson(Map<String, dynamic> json) {
        billingAddress = json['billing_address'];
        discountApplications = json['discount_applications'] != null
            ? new DiscountApplications.fromJson(json['discount_applications'])
            : null;
        paymentTerms = json['payment_terms'];
        shippingAddress = json['shipping_address'];
        sId = json['_id'];
        createdAt = json['created_at'];
        currency = json['currency'];
        customer = json['customer'];
        discountCodes = json['discount_codes'].cast<int>();
        email = json['email'];
        fulfillments = json['fulfillments'].cast<int>();
        id = json['id'];
        if (json['line_items'] != null) {
            lineItems = <LineItems>[];
            json['line_items'].forEach((v) {
                lineItems!.add(new LineItems.fromJson(v));
            });
        }
        name = json['name'];
        note = json['note'];
        noteAttributes = json['note_attributes'].cast<int>();
        paymentGatewayNames = json['payment_gateway_names'].cast<int>();
        refunds = json['refunds'].cast<int>();
        shippingLines = json['shipping_lines'].cast<int>();
        subtotalPrice = json['subtotal_price'];
        tags = json['tags'];
        if (json['tax_lines'] != null) {
            taxLines = <TaxLines>[];
            json['tax_lines'].forEach((v) {
                taxLines!.add(new TaxLines.fromJson(v));
            });
        }
        taxesIncluded = json['taxes_included'];
        totalPrice = json['total_price'];
        totalTax = json['total_tax'];
        updatedAt = json['updated_at'];
        completedAt = json['completed_at'];
        completed = json['completed'];
        iV = json['__v'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['billing_address'] = this.billingAddress;
        if (this.discountApplications != null) {
            data['discount_applications'] = this.discountApplications!.toJson();
        }
        data['payment_terms'] = this.paymentTerms;
        data['shipping_address'] = this.shippingAddress;
        data['_id'] = this.sId;
        data['created_at'] = this.createdAt;
        data['currency'] = this.currency;
        data['customer'] = this.customer;
        data['discount_codes'] = this.discountCodes;
        data['email'] = this.email;
        data['fulfillments'] = this.fulfillments;
        data['id'] = this.id;
        if (this.lineItems != null) {
            data['line_items'] = this.lineItems!.map((v) => v.toJson()).toList();
        }
        data['name'] = this.name;
        data['note'] = this.note;
        data['note_attributes'] = this.noteAttributes;
        data['payment_gateway_names'] = this.paymentGatewayNames;
        data['refunds'] = this.refunds;
        data['shipping_lines'] = this.shippingLines;
        data['subtotal_price'] = this.subtotalPrice;
        data['tags'] = this.tags;
        if (this.taxLines != null) {
            data['tax_lines'] = this.taxLines!.map((v) => v.toJson()).toList();
        }
        data['taxes_included'] = this.taxesIncluded;
        data['total_price'] = this.totalPrice;
        data['total_tax'] = this.totalTax;
        data['updated_at'] = this.updatedAt;
        data['completed_at'] = this.completedAt;
        data['completed'] = this.completed;
        data['__v'] = this.iV;
        return data;
    }
}

class DiscountApplications {
    List<int>? discountApplications;

    DiscountApplications({this.discountApplications});

    DiscountApplications.fromJson(Map<String, dynamic> json) {
        discountApplications = json['discount_applications'].cast<int>();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['discount_applications'] = this.discountApplications;
        return data;
    }
}

class LineItems {
    int? id;
    int? variantId;
    int? productId;
    String? title;
    String? variantTitle;
    String? sku;
    String? vendor;
    int? quantity;
    bool? requiresShipping;
    bool? taxable;
    bool? giftCard;
    String? fulfillmentService;
    int? grams;
    List<TaxLines>? taxLines;
    Null? appliedDiscount;
    String? name;
    List<int>? properties;
    bool? custom;
    String? price;
    String? adminGraphqlApiId;
    bool? isAvailable;
    int? availableQuantity;

    LineItems(
        {this.id,
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
            this.availableQuantity});

    LineItems.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        variantId = json['variant_id'];
        productId = json['product_id'];
        title = json['title'];
        variantTitle = json['variant_title'];
        sku = json['sku'];
        vendor = json['vendor'];
        quantity = json['quantity'];
        requiresShipping = json['requires_shipping'];
        taxable = json['taxable'];
        giftCard = json['gift_card'];
        fulfillmentService = json['fulfillment_service'];
        grams = json['grams'];
        if (json['tax_lines'] != null) {
            taxLines = <TaxLines>[];
            json['tax_lines'].forEach((v) {
                taxLines!.add(new TaxLines.fromJson(v));
            });
        }
        appliedDiscount = json['applied_discount'];
        name = json['name'];
        properties = json['properties'].cast<int>();
        custom = json['custom'];
        price = json['price'];
        adminGraphqlApiId = json['admin_graphql_api_id'];
        isAvailable = json['isAvailable'];
        availableQuantity = json['availableQuantity'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['variant_id'] = this.variantId;
        data['product_id'] = this.productId;
        data['title'] = this.title;
        data['variant_title'] = this.variantTitle;
        data['sku'] = this.sku;
        data['vendor'] = this.vendor;
        data['quantity'] = this.quantity;
        data['requires_shipping'] = this.requiresShipping;
        data['taxable'] = this.taxable;
        data['gift_card'] = this.giftCard;
        data['fulfillment_service'] = this.fulfillmentService;
        data['grams'] = this.grams;
        if (this.taxLines != null) {
            data['tax_lines'] = this.taxLines!.map((v) => v.toJson()).toList();
        }
        data['applied_discount'] = this.appliedDiscount;
        data['name'] = this.name;
        data['properties'] = this.properties;
        data['custom'] = this.custom;
        data['price'] = this.price;
        data['admin_graphql_api_id'] = this.adminGraphqlApiId;
        data['isAvailable'] = this.isAvailable;
        data['availableQuantity'] = this.availableQuantity;
        return data;
    }
}

class TaxLines {
    double? rate;
    String? title;
    String? price;

    TaxLines({this.rate, this.title, this.price});

    TaxLines.fromJson(Map<String, dynamic> json) {
        rate = json['rate'];
        title = json['title'];
        price = json['price'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['rate'] = this.rate;
        data['title'] = this.title;
        data['price'] = this.price;
        return data;
    }
}
