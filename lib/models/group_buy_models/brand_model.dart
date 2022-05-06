// To parse this JSON data, do
//
//     final brandRes = brandResFromJson(jsonString);

import 'dart:convert';

BrandRes brandResFromJson(String str) => BrandRes.fromJson(json.decode(str));

String brandResToJson(BrandRes data) => json.encode(data.toJson());

class BrandRes {
  BrandRes({
    this.data,
    this.status,
  });

  List<BrandDatum>? data;
  bool? status;

  factory BrandRes.fromJson(Map<String, dynamic> json) => BrandRes(
    data: List<BrandDatum>.from(json["data"].map((x) => BrandDatum.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class BrandDatum {
  BrandDatum({
    this.id,
    this.count,
  });

  String? id;
  int? count;

  factory BrandDatum.fromJson(Map<String, dynamic> json) => BrandDatum(
    id: json["_id"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "count": count,
  };
}
