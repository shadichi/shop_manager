import 'package:flutter/material.dart';
import 'package:shop_manager/model/orders.dart';
import 'package:shop_manager/model/products.dart';
import 'package:shop_manager/ui/allProduct.dart';
import 'package:woocommerce_api/woocommerce_error.dart';
import 'package:woocommerce_api/woocommerce_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import '';
import '../model/report_orders.dart';
import '../model/report_product.dart';
import '../model/shop_detail.dart';
import '../ui/alertDialog.dart';
import '../ui/mainPage.dart';

class connectToWoo {
  Future connectToWooo(url, consumerKey, consumerSecret, type) async {
    try {
      WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
          url: url, consumerKey: consumerKey, consumerSecret: consumerSecret);
      var data = await wooCommerceAPI.getAsync(type);
      print(data);
      return data;
    } on WooCommerceError catch (e) {
      print(e);
    }
  }

  Future<List<Products>?> getProduct() async {
    try {
      const url =
          "http://virastoremanagement.ir/wordpress/wp-json/manage-store/v3/products?cat=allPr"; // final url
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "c2b5b967bfda6376fb1c2c8b0a34878a997ddf55"
      });
      if (response.statusCode == 200) {
        var json = response.body;
        print(productsFromJson(json));
        return productsFromJson(json);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Orders>?> getOrders() async {
    try {
      const url =
          "http://virastoremanagement.ir/wordpress/wp-json/manage-store/v3/get-orders"; // final url
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "c2b5b967bfda6376fb1c2c8b0a34878a997ddf55"
      });
      if (response.statusCode == 200) {
        var json = response.body;
        print(ordersFromJson(json));
        return ordersFromJson(json);
      }
    } catch (e) {
      log(e.toString());
    }
  }
  Future getLineItem() async {
    try {
      const url =
          "http://virastoremanagement.ir/wordpress/wp-json/manage-store/v3/get-orders"; // final url
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "c2b5b967bfda6376fb1c2c8b0a34878a997ddf55"
      });
      if (response.statusCode == 200) {
        var json = response.body;
        var lineItems = jsonDecode(json)["id"];
       // var lineItems1 = jsonDecode(lineItems)["line_items"];
       // var jsonlineItems = jsonEncode(lineItems);
        //var lineItems1 = jsonDecode(jsonlineItems)["line_items"];

        print(lineItems.toString());
      //  return lineItemsFromJson (jsonlineItems);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Low>?> reportLowContent() async {
    try {
      const url =
          "http://virastoremanagement.ir/wordpress/wp-json/manage-store/v3/report-product"; // final url
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "c2b5b967bfda6376fb1c2c8b0a34878a997ddf55"
      });
      if (response.statusCode == 200) {
        print("yup 200");
        var json = response.body;
        var lowContent = jsonDecode(json)["low"];
        var jsonLowContent = jsonEncode(lowContent);
        //print(LowFromJson (jsonLowContent));
        return LowFromJson (jsonLowContent);

      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Top>?> reportTopContent() async {
    try {
      const url =
          "http://virastoremanagement.ir/wordpress/wp-json/manage-store/v3/report-product"; // final url
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "c2b5b967bfda6376fb1c2c8b0a34878a997ddf55"
      });
      if (response.statusCode == 200) {
        print("yup 200");
        var json = response.body;
        var topContent = jsonDecode(json)["top"];
        var jsontopContent = jsonEncode(topContent);
        //print(LowFromJson (jsonLowContent));
        return topFromJson (jsontopContent);

      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future reportOrders() async {
    try {
      const url =
          "http://virastoremanagement.ir/wordpress/wp-json/manage-store/v3/report-order"; // final url
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "c2b5b967bfda6376fb1c2c8b0a34878a997ddf55"
      });
      if (response.statusCode == 200) {
        var json = response.body;
        Map<String, dynamic> userMap = jsonDecode(json);
        var user = ReportOrders.fromJson(userMap);
        print(reportOrdersFromJson(json));
       return user;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future getLicense(context) async {
    try {
      const url =
          "http://virastoremanagement.ir/wordpress/wp-json/manage-store/v3/login";
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "c2b5b967bfda6376fb1c2c8b0a34878a997ddf55"
      });
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {

        //print(LowFromJson (jsonLowContent));
        if (json["guard"].toString() == "true") {
          var json = response.body;
          Map<String, dynamic> userMap = jsonDecode(json);
          var user = ShopDetail.fromJson(userMap);
        //  print(shopDetailFromJson(json));
          return user;
      
        } else {
          alertDialog(context);
        }
      }
    } catch (e) {
      log(e.toString());
    }

  }


}

Future postProduct() async {
  try {
    const url =
        "http://virastoremanagement.ir/wordpress/wp-json/manage-store/v3/products?cat=allPr"; // final url
    final response = await http.post(Uri.parse(url), headers: {
      "Authorization": "c2b5b967bfda6376fb1c2c8b0a34878a997ddf55"
    }, body: (jsonEncode(<String, String>{
      'name': "title",
    })));
   // print(productsToJson.toString());
    if (response.statusCode == 200) {
      var json = response.body;
      print("success");
    //  return productsFromJson(json);
    }
  } catch (e) {
    log(e.toString());
  }
}
