
import 'dart:convert';

//List<ReportOrders> reportOrdersFromJson(String str) => List<ReportOrders>.from(json.decode(str).map((x) => ReportOrders.fromJson(x)));
ReportOrders reportOrdersFromJson(String str) => ReportOrders.fromJson(json.decode(str));

String reportOrdersToJson(ReportOrders data) => json.encode(data.toJson());

class ReportOrders {
  ReportOrders({
    required this.totalOrders,
    required this.totalItems,
    required this.totalSales,
    required this.netSales,
  });

  var totalOrders;
  var totalItems;
  var totalSales;
  var netSales;

  factory ReportOrders.fromJson(Map<String, dynamic> json) => ReportOrders(
    totalOrders: json["total_orders"],
    totalItems: json["total_items"],
    totalSales: json["total_sales"],
    netSales: json["net_sales"],
  );

  Map<String, dynamic> toJson() => {
    "total_orders": totalOrders,
    "total_items": totalItems,
    "total_sales": totalSales,
    "net_sales": netSales,
  };
}
