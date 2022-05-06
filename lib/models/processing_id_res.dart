// To parse this JSON data, do
//
//     final processingIdRes = processingIdResFromJson(jsonString);

import 'dart:convert';

ProcessingIdRes processingIdResFromJson(String str) => ProcessingIdRes.fromJson(json.decode(str));

String processingIdResToJson(ProcessingIdRes data) => json.encode(data.toJson());

class ProcessingIdRes {
  ProcessingIdRes({
    this.status,
    this.data,
  });

  bool? status;
  ProcessingIdData? data;

  factory ProcessingIdRes.fromJson(Map<String, dynamic> json) => ProcessingIdRes(
    status: json["status"],
    data: ProcessingIdData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
  };
}

class ProcessingIdData {
  ProcessingIdData({
    this.token,
    this.orderId,
    this.orderAmount,
    this.customerEmail,
  });

  String? token;
  String? orderId;
  int? orderAmount;
  String? customerEmail;

  factory ProcessingIdData.fromJson(Map<String, dynamic> json) => ProcessingIdData(
    token: json["token"],
    orderId: json["orderId"],
    orderAmount: int.parse(json["orderAmount"]),
    customerEmail: json["customerEmail"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "orderId": orderId,
    "orderAmount": orderAmount,
    "customerEmail": customerEmail,
  };
}
