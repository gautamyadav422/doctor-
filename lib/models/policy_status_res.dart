// To parse this JSON data, do
//
//     final policyStatusRes = policyStatusResFromJson(jsonString);

import 'dart:convert';

PolicyStatusRes policyStatusResFromJson(String str) => PolicyStatusRes.fromJson(json.decode(str));

String policyStatusResToJson(PolicyStatusRes data) => json.encode(data.toJson());

class PolicyStatusRes {
  PolicyStatusRes({
    this.status,
    this.data,
  });

  bool? status;
  List<Datum>? data;

  factory PolicyStatusRes.fromJson(Map<String, dynamic> json) => PolicyStatusRes(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.customer,
    this.estimateAmount,
    this.approvedAmount,
    this.approvalDate,
    this.insurer,
    this.status,
    this.remarks,
    this.createdOn,
  });

  String? id;
  Customer? customer;
  int? estimateAmount;
  int? approvedAmount;
  DateTime? approvalDate;
  String? insurer;
  String? status;
  List<Remark>? remarks;
  DateTime? createdOn;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    customer: Customer.fromJson(json["customer"]),
    estimateAmount: json["estimateAmount"],
    approvedAmount: json["approvedAmount"],
    approvalDate: json["approvalDate"] == null ? null : DateTime.parse(json["approvalDate"]),
    insurer: json["insurer"] == null ? null : json["insurer"],
    status: json["status"],
    remarks: List<Remark>.from(json["remarks"].map((x) => Remark.fromJson(x))),
    createdOn: DateTime.parse(json["created_on"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "customer": customer!.toJson(),
    "estimateAmount": estimateAmount,
    "approvedAmount": approvedAmount,
    "approvalDate": approvalDate == null ? null : approvalDate!.toIso8601String(),
    "insurer": insurer == null ? null : insurer,
    "status": status,
    "remarks": List<dynamic>.from(remarks!.map((x) => x.toJson())),
    "created_on": createdOn!.toIso8601String(),
  };
}

class Customer {
  Customer({
    this.identity,
    this.id,
    this.mobile,
  });

  Identity? identity;
  Id? id;
  int? mobile;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    identity: Identity.fromJson(json["identity"]),
    id: idValues.map![json["_id"]],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "identity": identity!.toJson(),
    "_id": idValues.reverse[id],
    "mobile": mobile,
  };
}

enum Id { THE_62207_BA164_F763090275_C496 }

final idValues = EnumValues({
  "62207ba164f763090275c496": Id.THE_62207_BA164_F763090275_C496
});

class Identity {
  Identity({
    this.name,
  });

  String? name;

  factory Identity.fromJson(Map<String, dynamic> json) => Identity(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
  };
}

enum Name { KRUTIKA_SHANKAR_SANGALE }

final nameValues = EnumValues({
  "KRUTIKA SHANKAR SANGALE": Name.KRUTIKA_SHANKAR_SANGALE
});

class Remark {
  Remark({
    this.addedBy,
    this.remark,
    this.dateTime,
    this.id,
  });

  String? addedBy;
  dynamic remark;
  DateTime? dateTime;
  String? id;

  factory Remark.fromJson(Map<String, dynamic> json) => Remark(
    addedBy: json["addedBy"],
    remark: json["remark"],
    dateTime: DateTime.parse(json["dateTime"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "addedBy": addedBy,
    "remark": remark,
    "dateTime": dateTime!.toIso8601String(),
    "_id": id,
  };
}

enum Status { PENDING, APPROVED }

final statusValues = EnumValues({
  "Approved": Status.APPROVED,
  "Pending": Status.PENDING
});

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
