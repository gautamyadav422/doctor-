// To parse this JSON data, do
//
//     final categoryRes = categoryResFromJson(jsonString);

import 'dart:convert';

CategoryRes categoryResFromJson(String str) => CategoryRes.fromJson(json.decode(str));

String categoryResToJson(CategoryRes data) => json.encode(data.toJson());

class CategoryRes {
  CategoryRes({
    this.data,
    this.status,
  });

  List<CategoryData>? data;
  bool? status;

  factory CategoryRes.fromJson(Map<String, dynamic> json) => CategoryRes(
    data: List<CategoryData>.from(json["data"].map((x) => CategoryData.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class CategoryData {
  CategoryData({
    this.id,
    this.datumId,
    this.title,
  });

  String? id;
  int? datumId;
  String? title;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    id: json["_id"],
    datumId: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": datumId,
    "title": title,
  };
}
