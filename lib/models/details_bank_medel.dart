// To parse this JSON data, do
//
//     final bankRes = bankResFromJson(jsonString);

import 'dart:convert';

BankRes bankResFromJson(String str) => BankRes.fromJson(json.decode(str));

String bankResToJson(BankRes data) => json.encode(data.toJson());

class BankRes {
  BankRes({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory BankRes.fromJson(Map<String, dynamic> json) => BankRes(
    status: json["status"],
    data: json["data"]!=null?Data.fromJson(json["data"]):null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.accountNo,
    this.ifsc,
  });

  String? accountNo;
  String? ifsc;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accountNo: json["account_no"],
    ifsc: json["ifsc"],
  );

  Map<String, dynamic> toJson() => {
    "account_no": accountNo,
    "ifsc": ifsc,
  };
}
