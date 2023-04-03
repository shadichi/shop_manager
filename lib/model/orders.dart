// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

List<Orders> ordersFromJson(String str) => List<Orders>.from(json.decode(str).map((x) => Orders.fromJson(x)));
List<LineItem> lineItemsFromJson(String str) => List<LineItem>.from(json.decode(str).map((x) => LineItem.fromJson(x)));

String ordersToJson(List<Orders> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Orders {
  Orders({
    required this.id,
    required this.parentId,
    required this.status,
    required this.currency,
    required this.version,
    required this.pricesIncludeTax,
    required this.dateCreated,
    required this.dateModified,
    required this.discountTotal,
    required this.discountTax,
    required this.shippingTotal,
    required this.shippingTax,
    required this.cartTax,
    required this.total,
    required this.totalTax,
    required this.customerId,
    required this.orderKey,
    required this.billing,
    required this.shipping,
    required this.paymentMethod,
    required this.paymentMethodTitle,
    required this.transactionId,
    required this.customerIpAddress,
    required this.customerUserAgent,
    required this.createdVia,
    required this.customerNote,
    this.dateCompleted,
    this.datePaid,
    required this.cartHash,
    required this.number,
    required this.metaData,
    required this.lineItems,
    required this.taxLines,
    required this.shippingLines,
    required this.feeLines,
    required this.couponLines,
    required this.refundedItems,
    required this.customerRole,
  });

  int id;
  int parentId;
  String status;
  Currency currency;
  Version version;
  bool pricesIncludeTax;
  DateTime dateCreated;
  DateTime dateModified;
  String discountTotal;
  String discountTax;
  String shippingTotal;
  String shippingTax;
  String cartTax;
  String total;
  String totalTax;
  int customerId;
  String orderKey;
  Ing billing;
  Ing shipping;
  PaymentMethod paymentMethod;
  PaymentMethodTitle paymentMethodTitle;
  String transactionId;
  String customerIpAddress;
  CustomerUserAgent customerUserAgent;
  CreatedVia createdVia;
  String customerNote;
  Date? dateCompleted;
  Date? datePaid;
  String cartHash;
  String number;
  List<MetaDatum> metaData;
  List<LineItem> lineItems;
  List<dynamic> taxLines;
  List<ShippingLine> shippingLines;
  List<dynamic> feeLines;
  List<dynamic> couponLines;
  List<dynamic> refundedItems;
  String customerRole;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
    id: json["id"],
    parentId: json["parent_id"],
    status: json["status"],
    currency: currencyValues.map[json["currency"]]!,
    version: versionValues.map[json["version"]]!,
    pricesIncludeTax: json["prices_include_tax"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateModified: DateTime.parse(json["date_modified"]),
    discountTotal: json["discount_total"],
    discountTax: json["discount_tax"],
    shippingTotal: json["shipping_total"],
    shippingTax: json["shipping_tax"],
    cartTax: json["cart_tax"],
    total: json["total"],
    totalTax: json["total_tax"],
    customerId: json["customer_id"],
    orderKey: json["order_key"],
    billing: Ing.fromJson(json["billing"]),
    shipping: Ing.fromJson(json["shipping"]),
    paymentMethod: paymentMethodValues.map[json["payment_method"]]!,
    paymentMethodTitle: paymentMethodTitleValues.map[json["payment_method_title"]]!,
    transactionId: json["transaction_id"],
    customerIpAddress: json["customer_ip_address"],
    customerUserAgent: customerUserAgentValues.map[json["customer_user_agent"]]!,
    createdVia: createdViaValues.map[json["created_via"]]!,
    customerNote: json["customer_note"],
    dateCompleted: json["date_completed"] == null ? null : Date.fromJson(json["date_completed"]),
    datePaid: json["date_paid"] == null ? null : Date.fromJson(json["date_paid"]),
    cartHash: json["cart_hash"],
    number: json["number"],
    metaData: List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromJson(x))),
    lineItems: List<LineItem>.from(json["line_items"].map((x) => LineItem.fromJson(x))),
    taxLines: List<dynamic>.from(json["tax_lines"].map((x) => x)),
    shippingLines: List<ShippingLine>.from(json["shipping_lines"].map((x) => ShippingLine.fromJson(x))),
    feeLines: List<dynamic>.from(json["fee_lines"].map((x) => x)),
    couponLines: List<dynamic>.from(json["coupon_lines"].map((x) => x)),
    refundedItems: List<dynamic>.from(json["refunded_items"].map((x) => x)),
    customerRole: json["customer_role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "status": status,
    "currency": currencyValues.reverse[currency],
    "version": versionValues.reverse[version],
    "prices_include_tax": pricesIncludeTax,
    "date_created": dateCreated.toIso8601String(),
    "date_modified": dateModified.toIso8601String(),
    "discount_total": discountTotal,
    "discount_tax": discountTax,
    "shipping_total": shippingTotal,
    "shipping_tax": shippingTax,
    "cart_tax": cartTax,
    "total": total,
    "total_tax": totalTax,
    "customer_id": customerId,
    "order_key": orderKey,
    "billing": billing.toJson(),
    "shipping": shipping.toJson(),
    "payment_method": paymentMethodValues.reverse[paymentMethod],
    "payment_method_title": paymentMethodTitleValues.reverse[paymentMethodTitle],
    "transaction_id": transactionId,
    "customer_ip_address": customerIpAddress,
    "customer_user_agent": customerUserAgentValues.reverse[customerUserAgent],
    "created_via": createdViaValues.reverse[createdVia],
    "customer_note": customerNote,
    "date_completed": dateCompleted?.toJson(),
    "date_paid": datePaid?.toJson(),
    "cart_hash": cartHash,
    "number": number,
    "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
    "line_items": List<dynamic>.from(lineItems.map((x) => x.toJson())),
    "tax_lines": List<dynamic>.from(taxLines.map((x) => x)),
    "shipping_lines": List<dynamic>.from(shippingLines.map((x) => x.toJson())),
    "fee_lines": List<dynamic>.from(feeLines.map((x) => x)),
    "coupon_lines": List<dynamic>.from(couponLines.map((x) => x)),
    "refunded_items": List<dynamic>.from(refundedItems.map((x) => x)),
    "customer_role": customerRole,
  };
}

class LineItem {
  LineItem({
    required this.id,
    required this.orderId,
    required this.name,
    required this.productId,
    required this.variationId,
    required this.quantity,
    required this.taxClass,
    required this.subtotal,
    required this.subtotalTax,
    required this.total,
    required this.totalTax,
    required this.taxes,
    required this.metaData,
    required this.sku,
    required this.storeName,
    required this.shopAddress,
    required this.img,
  });

  int id;
  int orderId;
  String name;
  int productId;
  int variationId;
  int quantity;
  String taxClass;
  String subtotal;
  String subtotalTax;
  String total;
  String totalTax;
  LineItemTaxes taxes;
  List<dynamic> metaData;
  Sku sku;
  StoreName storeName;
  ShopAddress shopAddress;
  String img;

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
    id: json["id"],
    orderId: json["order_id"],
    name: json["name"]!,
    productId: json["product_id"],
    variationId: json["variation_id"],
    quantity: json["quantity"],
    taxClass: json["tax_class"],
    subtotal: json["subtotal"],
    subtotalTax: json["subtotal_tax"],
    total: json["total"],
    totalTax: json["total_tax"],
    taxes: LineItemTaxes.fromJson(json["taxes"]),
    metaData: List<dynamic>.from(json["meta_data"].map((x) => x)),
    sku: skuValues.map[json["sku"]]!,
    storeName: storeNameValues.map[json["store_name"]]!,
    shopAddress: shopAddressValues.map[json["shop_address"]]!,
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "name": name,
    "product_id": productId,
    "variation_id": variationId,
    "quantity": quantity,
    "tax_class": taxClass,
    "subtotal": subtotal,
    "subtotal_tax": subtotalTax,
    "total": total,
    "total_tax": totalTax,
    "taxes": taxes.toJson(),
    "meta_data": List<dynamic>.from(metaData.map((x) => x)),
    "sku": skuValues.reverse[sku],
    "store_name": storeNameValues.reverse[storeName],
    "shop_address": shopAddressValues.reverse[shopAddress],
    "img": img,
  };
}

class Ing {
  Ing({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
    this.email,
    required this.phone,
  });

  String firstName;
  String lastName;
  Company company;
  String address1;
  Address2 address2;
  String city;
  String state;
  String postcode;
  Country country;
  String? email;
  String phone;

  factory Ing.fromJson(Map<String, dynamic> json) => Ing(
    firstName: json["first_name"],
    lastName: json["last_name"],
    company: companyValues.map[json["company"]]!,
    address1: json["address_1"],
    address2: address2Values.map[json["address_2"]]!,
    city: json["city"],
    state: json["state"],
    postcode: json["postcode"],
    country: countryValues.map[json["country"]]!,
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "company": companyValues.reverse[company],
    "address_1":address1,
    "address_2": address2Values.reverse[address2],
    "city": city,
    "state": state,
    "postcode": postcode,
    "country": countryValues.reverse[country],
    "email": email,
    "phone": phone,
  };
}

enum Address1 { EMPTY, ADDRESS_1, PURPLE, FLUFFY }

final address1Values = EnumValues({
  "تالببلات": Address1.ADDRESS_1,
  "": Address1.EMPTY,
  "تست": Address1.FLUFFY,
  "پذاتت": Address1.PURPLE
});

enum Address2 { EMPTY, ADDRESS_2, PURPLE }

final address2Values = EnumValues({
  "وتت": Address2.ADDRESS_2,
  "": Address2.EMPTY,
  "تست": Address2.PURPLE
});

enum Company { EMPTY, COMPANY, PURPLE, FLUFFY }

final companyValues = EnumValues({
  "اقاقیا ": Company.COMPANY,
  "": Company.EMPTY,
  "تست": Company.FLUFFY,
  "اااا": Company.PURPLE
});

enum Country { EMPTY }

final countryValues = EnumValues({
  "ایران": Country.EMPTY
});

enum CreatedVia { VIRA_API }

final createdViaValues = EnumValues({
  "viraApi": CreatedVia.VIRA_API
});

enum Currency { IRR }

final currencyValues = EnumValues({
  "IRR": Currency.IRR
});

enum CustomerUserAgent { OKHTTP_3149 }

final customerUserAgentValues = EnumValues({
  "okhttp/3.14.9": CustomerUserAgent.OKHTTP_3149
});

class Date {
  Date({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  Timezone timezone;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    date: DateTime.parse(json["date"]),
    timezoneType: json["timezone_type"],
    timezone: timezoneValues.map[json["timezone"]]!,
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "timezone_type": timezoneType,
    "timezone": timezoneValues.reverse[timezone],
  };
}

enum Timezone { ASIA_TEHRAN }

final timezoneValues = EnumValues({
  "Asia/Tehran": Timezone.ASIA_TEHRAN
});



enum Name { I_PHONE_13, I_PHONE_12_PRO_MAX_A2412, SAMSUNG_GALAXY_Z_FOLD2 }

final nameValues = EnumValues({
  "گوشی موبایل اپل مدل iPhone 12 Pro Max A2412": Name.I_PHONE_12_PRO_MAX_A2412,
  "گوشی موبایل اپل مدل iPhone 13": Name.I_PHONE_13,
  "Samsung Galaxy Z Fold2": Name.SAMSUNG_GALAXY_Z_FOLD2
});

enum ShopAddress { THE_09150002323_STATE_CITY_ADDRESS1_ADDRESS2, EMPTY, THE_9150001111 }

final shopAddressValues = EnumValues({
  "": ShopAddress.EMPTY,
  "09150002323,state city address1 address2": ShopAddress.THE_09150002323_STATE_CITY_ADDRESS1_ADDRESS2,
  "9150001111": ShopAddress.THE_9150001111
});

enum Sku { EMPTY, I13, SAM }

final skuValues = EnumValues({
  "": Sku.EMPTY,
  "i13": Sku.I13,
  "sam": Sku.SAM
});

enum StoreName { DOKAN_SELLER_09150002323_STATE_CITY_ADDRESS1_ADDRESS2, EMPTY, DOKAN_STORE_9150001111 }

final storeNameValues = EnumValues({
  "dokan_seller , 09150002323,state city address1 address2": StoreName.DOKAN_SELLER_09150002323_STATE_CITY_ADDRESS1_ADDRESS2,
  "dokan_store , 9150001111": StoreName.DOKAN_STORE_9150001111,
  " , ": StoreName.EMPTY
});

class LineItemTaxes {
  LineItemTaxes({
    required this.total,
    required this.subtotal,
  });

  List<dynamic> total;
  List<dynamic> subtotal;

  factory LineItemTaxes.fromJson(Map<String, dynamic> json) => LineItemTaxes(
    total: List<dynamic>.from(json["total"].map((x) => x)),
    subtotal: List<dynamic>.from(json["subtotal"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "total": List<dynamic>.from(total.map((x) => x)),
    "subtotal": List<dynamic>.from(subtotal.map((x) => x)),
  };
}

class MetaDatum {
  MetaDatum({
    required this.id,
    required this.key,
    required this.value,
  });

  int id;
  Key key;
  String value;

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
    id: json["id"],
    key: keyValues.map[json["key"]]!,
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": keyValues.reverse[key],
    "value": value,
  };
}

enum Key { BILLING_ID, SHIPPING_ID, SEND_VIRA_NOTIF, NEW_ORDER_EMAIL_SENT }

final keyValues = EnumValues({
  "_billing_id": Key.BILLING_ID,
  "_new_order_email_sent": Key.NEW_ORDER_EMAIL_SENT,
  "_send_vira_notif": Key.SEND_VIRA_NOTIF,
  "_shipping_id": Key.SHIPPING_ID
});

enum PaymentMethod { COD }

final paymentMethodValues = EnumValues({
  "cod": PaymentMethod.COD
});

enum PaymentMethodTitle { EMPTY }

final paymentMethodTitleValues = EnumValues({
  "پرداخت هنگام دریافت": PaymentMethodTitle.EMPTY
});

class ShippingLine {
  ShippingLine({
    required this.id,
    required this.orderId,
    required this.name,
    required this.methodTitle,
    required this.methodId,
    required this.instanceId,
    required this.total,
    required this.totalTax,
    required this.taxes,
    required this.metaData,
  });

  int id;
  int orderId;
  MethodTitle name;
  MethodTitle methodTitle;
  MethodId methodId;
  String instanceId;
  String total;
  String totalTax;
  ShippingLineTaxes taxes;
  List<dynamic> metaData;

  factory ShippingLine.fromJson(Map<String, dynamic> json) => ShippingLine(
    id: json["id"],
    orderId: json["order_id"],
    name: methodTitleValues.map[json["name"]]!,
    methodTitle: methodTitleValues.map[json["method_title"]]!,
    methodId: methodIdValues.map[json["method_id"]]!,
    instanceId: json["instance_id"],
    total: json["total"],
    totalTax: json["total_tax"],
    taxes: ShippingLineTaxes.fromJson(json["taxes"]),
    metaData: List<dynamic>.from(json["meta_data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "name": methodTitleValues.reverse[name],
    "method_title": methodTitleValues.reverse[methodTitle],
    "method_id": methodIdValues.reverse[methodId],
    "instance_id": instanceId,
    "total": total,
    "total_tax": totalTax,
    "taxes": taxes.toJson(),
    "meta_data": List<dynamic>.from(metaData.map((x) => x)),
  };
}

enum MethodId { WC_COURIER_METHOD }

final methodIdValues = EnumValues({
  "WC_Courier_Method": MethodId.WC_COURIER_METHOD
});

enum MethodTitle { EMPTY }

final methodTitleValues = EnumValues({
  "پیک موتوری": MethodTitle.EMPTY
});

class ShippingLineTaxes {
  ShippingLineTaxes({
    required this.total,
  });

  List<dynamic> total;

  factory ShippingLineTaxes.fromJson(Map<String, dynamic> json) => ShippingLineTaxes(
    total: List<dynamic>.from(json["total"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "total": List<dynamic>.from(total.map((x) => x)),
  };
}

enum Version { THE_690 }

final versionValues = EnumValues({
  "6.9.0": Version.THE_690
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
