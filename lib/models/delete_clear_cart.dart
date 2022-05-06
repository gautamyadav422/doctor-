// To parse this JSON data, do
//
//     final clearCart = clearCartFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ClearCart {
    ClearCart({
        required this.data,
        required this.status,
        required this.message,
    });

    List<dynamic>? data;
    bool status;
    String message;

    factory ClearCart.fromJson(String str) => ClearCart.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ClearCart.fromMap(Map<String, dynamic> json) => ClearCart(
        data: json["data"] == null ? null : List<dynamic>.from(json["data"].map((x) => x)),
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toMap() => {
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x)),
        "status": status == null ? null : status,
        "message": message == null ? null : message,
    };
}
