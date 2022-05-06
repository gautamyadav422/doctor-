// To parse this JSON data, do
//
//     final processingFeeRes = processingFeeResFromJson(jsonString);

import 'dart:convert';

ProcessingFeeRes processingFeeResFromJson(String str) => ProcessingFeeRes.fromJson(json.decode(str));

String processingFeeResToJson(ProcessingFeeRes data) => json.encode(data.toJson());

class ProcessingFeeRes {
  ProcessingFeeRes({
    this.status,
    this.data,
  });

  bool? status;
  List<ProcessDatum>? data;

  factory ProcessingFeeRes.fromJson(Map<String, dynamic> json) => ProcessingFeeRes(
    status: json["status"],
    data: List<ProcessDatum>.from(json["data"].map((x) => ProcessDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ProcessDatum {
  ProcessDatum({
    this.id,
    this.merchant,
    this.offer,
    this.loanCalculation,
    this.updatedOn,
    this.procedure,
    this.category,
    this.scheme,
  });

  String? id;
  Merchant? merchant;
  Offer? offer;
  LoanCalculation? loanCalculation;
  DateTime? updatedOn;
  Category? procedure;
  Category? category;
  Scheme? scheme;

  factory ProcessDatum.fromJson(Map<String, dynamic> json) => ProcessDatum(
    id: json["_id"],
    merchant: Merchant.fromJson(json["merchant"]),
    offer: Offer.fromJson(json["offer"]),
    loanCalculation: LoanCalculation.fromJson(json["loanCalculation"]),
    updatedOn: DateTime.parse(json["updated_on"]),
    procedure: Category.fromJson(json["procedure"]),
    category: Category.fromJson(json["category"]),
    scheme: Scheme.fromJson(json["scheme"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "merchant": merchant!.toJson(),
    "offer": offer!.toJson(),
    "loanCalculation": loanCalculation!.toJson(),
    "updated_on": updatedOn!.toIso8601String(),
    "procedure": procedure!.toJson(),
    "category": category!.toJson(),
    "scheme": scheme!.toJson(),
  };
}

class Category {
  Category({
    this.name,
  });

  String? name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class LoanCalculation {
  LoanCalculation({
    this.advanceEmiCount,
    this.advanceEmiAmt,
    this.emiAmount,
    this.balanceEmiAmt,
    this.totalEmiCount,
    this.processingFee,
    this.emiTable,
  });

  int? advanceEmiCount;
  double? advanceEmiAmt;
  double? emiAmount;
  double? balanceEmiAmt;
  int? totalEmiCount;
  int? processingFee;
  List<EmiTable>? emiTable;

  factory LoanCalculation.fromJson(Map<String, dynamic> json) => LoanCalculation(
    advanceEmiCount: json["advance_emi_Count"],
    advanceEmiAmt: json["advance_emi_Amt"].toDouble(),
    emiAmount: json["emiAmount"].toDouble(),
    balanceEmiAmt: json["balanceEmiAmt"].toDouble(),
    totalEmiCount: json["totalEmiCount"],
    processingFee: json["processing_fee"],
    emiTable: List<EmiTable>.from(json["emiTable"].map((x) => EmiTable.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "advance_emi_Count": advanceEmiCount,
    "advance_emi_Amt": advanceEmiAmt,
    "emiAmount": emiAmount,
    "balanceEmiAmt": balanceEmiAmt,
    "totalEmiCount": totalEmiCount,
    "processing_fee": processingFee,
    "emiTable": List<dynamic>.from(emiTable!.map((x) => x.toJson())),
  };
}

class EmiTable {
  EmiTable({
    this.emiAmount,
    this.emiDate,
    this.id,
  });

  double? emiAmount;
  String? emiDate;
  String? id;

  factory EmiTable.fromJson(Map<String, dynamic> json) => EmiTable(
    emiAmount: json["emiAmount"].toDouble(),
    emiDate: json["emiDate"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "emiAmount": emiAmount,
    "emiDate": emiDate,
    "_id": id,
  };
}

class Merchant {
  Merchant({
    this.bankDetails,
    this.name,
  });

  BankDetails? bankDetails;
  String? name;

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
    bankDetails: BankDetails.fromJson(json["bank_details"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "bank_details": bankDetails!.toJson(),
    "name": name,
  };
}

class BankDetails {
  BankDetails({
    this.ifsc,
    this.accountNo,
    this.bankVerified,
    this.bankName,
    this.chequeLink,
  });

  String? ifsc;
  String? accountNo;
  bool? bankVerified;
  String? bankName;
  String? chequeLink;

  factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
    ifsc: json["ifsc"],
    accountNo: json["account_no"],
    bankVerified: json["bank_verified"],
    bankName: json["bank_name"],
    chequeLink: json["cheque_link"],
  );

  Map<String, dynamic> toJson() => {
    "ifsc": ifsc,
    "account_no": accountNo,
    "bank_verified": bankVerified,
    "bank_name": bankName,
    "cheque_link": chequeLink,
  };
}

class Offer {
  Offer({
    this.scheme,
    this.category,
    this.procedure,
    this.description,
    this.loanAmount,
  });

  String? scheme;
  String? category;
  String? procedure;
  dynamic description;
  int? loanAmount;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    scheme: json["scheme"],
    category: json["category"],
    procedure: json["procedure"],
    description: json["description"],
    loanAmount: json["loanAmount"],
  );

  Map<String, dynamic> toJson() => {
    "scheme": scheme,
    "category": category,
    "procedure": procedure,
    "description": description,
    "loanAmount": loanAmount,
  };
}

class Scheme {
  Scheme({
    this.desc,
    this.policy,
  });

  String? desc;
  int? policy;

  factory Scheme.fromJson(Map<String, dynamic> json) => Scheme(
    desc: json["desc"],
    policy: json["policy"],
  );

  Map<String, dynamic> toJson() => {
    "desc": desc,
    "policy": policy,
  };
}
