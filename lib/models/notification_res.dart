// To parse this JSON data, do
//
//     final notificationRes = notificationResFromJson(jsonString);

import 'dart:convert';

NotificationRes notificationResFromJson(String str) => NotificationRes.fromJson(json.decode(str));

String notificationResToJson(NotificationRes data) => json.encode(data.toJson());

class NotificationRes {
  NotificationRes({
    this.status,
    this.notifications,
  });

  bool? status;
  List<NotificationData>? notifications;

  factory NotificationRes.fromJson(Map<String, dynamic> json) => NotificationRes(
    status: json["status"],
    notifications: json["notifications"]!=null?List<NotificationData>.from(json["notifications"].map((x) => NotificationData.fromJson(x))):null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "notifications": List<dynamic>.from(notifications!.map((x) => x.toJson())),
  };
}

class NotificationData {
  NotificationData({
    this.id,
    this.isRead,
    this.createdOn,
    this.notification,
  });

  String? id;
  bool? isRead;
  DateTime? createdOn;
  String? notification;

  factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
    id: json["_id"],
    isRead: json["isRead"],
    createdOn:json["createdOn"]!=null? DateTime.parse(json["createdOn"]):null,
    notification: json["notification"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "isRead": isRead,
    "createdOn": createdOn!.toIso8601String(),
    "notification": notification,
  };
}
