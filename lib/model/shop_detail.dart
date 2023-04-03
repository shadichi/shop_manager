// To parse this JSON data, do
//
//     final shopDetail = shopDetailFromJson(jsonString);

import 'dart:convert';

ShopDetail shopDetailFromJson(String str) => ShopDetail.fromJson(json.decode(str));

String shopDetailToJson(ShopDetail data) => json.encode(data.toJson());

class ShopDetail {
  ShopDetail({
    required this.guard,
    required this.iss,
    required this.user,
    required this.id,
    required this.name,
    required this.ver,
    required this.lis,
    required this.count,
  });

  bool guard;
  bool iss;
  String user;
  String id;
  String name;
  String ver;
  String lis;
  int count;

  factory ShopDetail.fromJson(Map<String, dynamic> json) => ShopDetail(
    guard: json["guard"],
    iss: json["iss"],
    user: json["user"],
    id: json["ID"],
    name: json["name"],
    ver: json["ver"],
    lis: json["lis"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "guard": guard,
    "iss": iss,
    "user": user,
    "ID": id,
    "name": name,
    "ver": ver,
    "lis": lis,
    "count": count,
  };
}
