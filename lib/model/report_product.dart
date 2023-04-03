// To parse this JSON data, do
//
//     final reportProducts = reportProductsFromJson(jsonString);

import 'dart:convert';
List<Low> LowFromJson(String str) => List<Low>.from(json.decode(str).map((x) => Low.fromJson(x)));
List<Top> topFromJson(String str) => List<Top>.from(json.decode(str).map((x) => Top.fromJson(x)));

class Low {
  Low({
    required this.name,
    required this.number,
  });

  String name;
  String number;

  factory Low.fromJson(Map<String, dynamic> json) => Low(
    name: json["name"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "number": number,
  };
}
class Top {
  Top({
    required this.name,
    required this.productId,
    required this.number,
  });

  String name;
  String productId;
  String number;

  factory Top.fromJson(Map<String, dynamic> json) => Top(
    name: json["name"],
    productId: json["product_id"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "product_id": productId,
    "number": number,
  };
}