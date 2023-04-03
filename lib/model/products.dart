
import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));


String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    required this.id,
    required this.name,
    required this.regularPrice,
    required this.salePrice,
    required this.price,
    required this.manageStock,
    required this.stockQuantity,
    required this.inStock,
    required this.dateOnSaleFrom,
    required this.dateOnSaleTo,
    required this.lowStock,
    required this.image,
    required this.sku,
    required this.totalSales,
    required this.childes,
  });

  int id;
  String name;
  String regularPrice;
  String salePrice;
  String price;
  bool manageStock;
  String stockQuantity;
  bool inStock;
  String dateOnSaleFrom;
  String dateOnSaleTo;
  String lowStock;
  String image;
  String sku;
  int totalSales;
  List<dynamic> childes;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    id: json["id"],
    name: json["name"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    price: json["price"],
    manageStock: json["manage_stock"],
    stockQuantity: json["stock_quantity"],
    inStock: json["in_stock"],
    dateOnSaleFrom: json["date_on_sale_from"],
    dateOnSaleTo: json["date_on_sale_to"],
    lowStock: json["low_stock"],
    image: json["image"],
    sku: json["sku"],
    totalSales: json["total_sales"],
    childes: List<dynamic>.from(json["childes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "regular_price": regularPrice,
    "sale_price": salePrice,
    "price": price,
    "manage_stock": manageStock,
    "stock_quantity": stockQuantity,
    "in_stock": inStock,
    "date_on_sale_from": dateOnSaleFrom,
    "date_on_sale_to": dateOnSaleTo,
    "low_stock": lowStock,
    "image": image,
    "sku": sku,
    "total_sales": totalSales,
    "childes": List<dynamic>.from(childes.map((x) => x)),
  };
}
