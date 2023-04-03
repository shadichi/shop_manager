import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:shop_manager/connect/wooConnect.dart';
import '../model/products.dart';

var edit = false;
var confirm = false;

class product extends StatefulWidget {
  //final Products products;
  product(List<Products>? products, this.index)
      : this.products = products ?? [];
  final List<Products> products;
  final int index;

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  var isLoad = false;
  final TextEditingController productName = TextEditingController();
  final TextEditingController regularPrice = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController stockQuantity = TextEditingController();
  final TextEditingController dateOnSaleFrom = TextEditingController();
  final TextEditingController dateOnSaleTo = TextEditingController();
  final TextEditingController lowStock = TextEditingController();
  final TextEditingController SKU = TextEditingController();
  final TextEditingController totalSale = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.products != null) {
      setState(() {
        isLoad = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Visibility(
        replacement: Container(
          height: 100.h,
          width: 100.w,
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.blueGrey,
            ),
          ),
        ),
        visible: isLoad,
        child: Sizer(builder: (context, orientation, deviceType) {
          return Stack(
            children: [
              Container(
                height: 45.h,
                child: widget.products![widget.index].image == ""
                    ? Image.asset("asset/index.png")
                    : Image.network(widget.products![widget.index].image),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3.h),
                        topRight: Radius.circular(3.h),
                      )),
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    child: Container(
                      /*color: Colors.red,*/
                      padding: EdgeInsets.only(top: 9.h),
                      child: Column(
                        children: [
                          edit
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        width: 40.w,
                                        height: 4.h,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                edit = false;
                                              });
                                            },
                                            child: Text(
                                              "صرف نظر",
                                              style: TextStyle(
                                                  fontFamily: "IRANSansWeb",
                                                  fontSize: 1.7.h),
                                            ))),
                                    Container(
                                        width: 40.w,
                                        height: 4.h,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                edit = false;
                                                postProduct();

                                                if (productName.text.isEmpty) {
                                                  return;
                                                } else {
                                                  widget.products![widget.index]
                                                      .name = productName.text;
                                                }
                                                if (regularPrice.text.isEmpty) {
                                                  return;
                                                } else {
                                                  widget.products![widget.index]
                                                      .regularPrice = regularPrice.text;
                                                }
                                                if (price.text.isEmpty) {
                                                  return;
                                                } else {
                                                  widget.products![widget.index]
                                                      .price = price.text;
                                                }
                                                if (stockQuantity
                                                    .text.isEmpty) {
                                                  return;
                                                } else {
                                                  widget.products![widget.index]
                                                      .stockQuantity = stockQuantity.text;
                                                }
                                                if (dateOnSaleFrom
                                                    .text.isEmpty) {
                                                  return;
                                                } else {
                                                  widget.products![widget.index]
                                                      .dateOnSaleFrom = dateOnSaleFrom.text;
                                                }
                                                if (dateOnSaleTo.text.isEmpty) {
                                                  return;
                                                } else {
                                                  widget.products![widget.index]
                                                      .dateOnSaleTo = dateOnSaleTo.text;
                                                }
                                                if (lowStock.text.isEmpty) {
                                                  return;
                                                } else {
                                                  widget.products![widget.index]
                                                      .lowStock = lowStock.text;
                                                }
                                                if (SKU.text.isEmpty) {
                                                  return;
                                                } else {
                                                  widget.products![widget.index]
                                                      .sku = SKU.text;
                                                }
                                                if (totalSale.text.isEmpty) {
                                                  return;
                                                } else {
                                                  widget.products![widget.index]
                                                      .totalSales = totalSale.text as int;

                                                }

                                              });
                                            },
                                            child: Text(
                                              "اعمال تغییرات",
                                              style: TextStyle(
                                                  fontFamily: "IRANSansWeb",
                                                  fontSize: 1.7.h),
                                            )))
                                  ],
                                )
                              : Container(
                                  width: 60.w,
                                  height: 4.h,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          edit = true;
                                        });
                                      },
                                      child: Text(
                                        "ویرایش",
                                        style: TextStyle(
                                            fontFamily: "IRANSansWeb",
                                            fontSize: 1.7.h),
                                      ))),
                          Container(
                            //height: 3.h,
                            margin: EdgeInsets.only(
                                top: 2.h, left: 2.h, right: 2.h),
                            child: SingleChildScrollView(
                              child: Container(
                                child: Column(
                                  children: [
                                    makeColumn(
                                      key1: widget.products![widget.index].name,
                                      value: "نام محصول:",
                                      controller: productName,
                                      products: widget.products,
                                      index: widget.index,
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(),
                                        child: Divider()),
                                    makeColumn(
                                        key1: widget.products![widget.index]
                                            .regularPrice,
                                        value: "قیمت عادی:",
                                        controller: regularPrice,
                                        products: widget.products,
                                        index: widget.index),
                                    Container(
                                        padding: EdgeInsets.only(),
                                        child: Divider()),
                                    makeColumn(
                                        key1: widget
                                            .products![widget.index].price,
                                        value: "قیمت با تخفیف:",
                                        controller: price,
                                        products: widget.products,
                                        index: widget.index),
                                    Container(
                                        padding: EdgeInsets.only(),
                                        child: Divider()),
                                    makeColumn(
                                        key1: widget.products![widget.index]
                                            .stockQuantity,
                                        value: "موجودی انبار:",
                                        controller: stockQuantity,
                                        products: widget.products,
                                        index: widget.index),
                                    Container(
                                        padding: EdgeInsets.only(),
                                        child: Divider()),
                                    makeColumn(
                                        key1: widget.products![widget.index]
                                            .dateOnSaleFrom,
                                        value: "تاریخ شروع تخفیف:",
                                        controller: dateOnSaleFrom,
                                        products: widget.products,
                                        index: widget.index),
                                    Container(
                                        padding: EdgeInsets.only(),
                                        child: Divider()),
                                    makeColumn(
                                        key1: widget.products![widget.index]
                                            .dateOnSaleTo,
                                        value: "تاریخ پایان تخفیف:",
                                        controller: dateOnSaleTo,
                                        products: widget.products,
                                        index: widget.index),
                                    Container(
                                        padding: EdgeInsets.only(),
                                        child: Divider()),
                                    makeColumn(
                                        key1: widget
                                            .products![widget.index].lowStock,
                                        value: "تعداد کف انبار:",
                                        controller: lowStock,
                                        products: widget.products,
                                        index: widget.index),
                                    Container(
                                        padding: EdgeInsets.only(),
                                        child: Divider()),
                                    makeColumn(
                                        key1:
                                            widget.products![widget.index].sku,
                                        value: "SKU:",
                                        controller: SKU,
                                        products: widget.products,
                                        index: widget.index),
                                    Container(
                                        padding: EdgeInsets.only(),
                                        child: Divider()),
                                    makeColumn(
                                      key1: widget
                                          .products![widget.index].totalSales
                                          .toString(),
                                      products: widget.products,
                                      index: widget.index,
                                      value: "تعداد فروش کل:",
                                      controller: totalSale,
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(),
                                        child: Divider()),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                //color: Colors.blueGrey,
                margin: EdgeInsets.only(top: 34.h, left: 7.w, right: 2.w),
                height: 12.h,
                width: 85.w,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.5.h)),
                  elevation: 2.w,
                  child: Container(
                    height: 0.05.h,
                    width: 0.02.w,
                    padding: EdgeInsets.all(1.5.h),
                    child: widget.products![widget.index].image == ""
                        ? Image.asset("asset/index.png")
                        : Image.network(widget.products![widget.index].image),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class makeColumn extends StatelessWidget {
  final String key1;
  final String value;
  final List<Products> products;
  final int index;
  final TextEditingController controller;

  const makeColumn({
    Key? key,
    required this.key1,
    required this.value,
    required this.controller,
    required this.products,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(0.5.h),
        child: edit
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 45.w,
                    child: key1 != ""
                        ? Row(
                            children: [
                              Container(
                                  child: Icon(
                                Icons.edit,
                                color: Colors.grey.shade600,
                              )),
                              Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 38.w,
                                  child: Material(
                                      child: TextField(
                                    //initialValue: "i am smart",
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    controller: controller,
                                    decoration: InputDecoration(
                                      hintText: key1,
                                      fillColor: Colors.blueGrey,
                                      hintStyle: TextStyle(
                                        fontFamily: "IRANSansWeb",
                                        fontSize: 1.5.h,
                                        //  color: Colors.blueGrey,
                                        //  decorationColor: Colors.blueGrey,
                                      ),
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Container(
                                  child: Icon(
                                Icons.edit,
                                color: Colors.grey.shade600,
                              )),
                              Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 38.w,
                                  child: const Material(
                                      child: TextField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: "-",
                                      fillColor: Colors.blueGrey,
                                      hintStyle:
                                          TextStyle(fontFamily: "IRANSansWeb"),
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                  ),
                  Container(
                      width: 45.w,
                      child: Text(
                        value,
                        style: TextStyle(
                            fontFamily: "IRANSansWeb",
                            decoration: TextDecoration.none,
                            color: Colors.grey.shade600,
                            fontSize: 2.h),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      )),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 45.w,
                      child: key1 != ""
                          ? Row(
                              children: [
                                //  Container(child: Icon(Icons.edit,color: Colors.grey.shade600,)),
                                Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 38.w,
                                    child: Text(
                                      key1,
                                      style: TextStyle(
                                          fontFamily: "IRANSansWeb",
                                          decoration: TextDecoration.none,
                                          color: Colors.grey.shade600,
                                          fontSize: 1.5.h),
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              "-",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 1.5.h,
                                  color: Colors.grey.shade600),
                              textAlign: TextAlign.center,
                            )),
                  Container(
                      width: 45.w,
                      child: Text(
                        value,
                        style: TextStyle(
                            fontFamily: "IRANSansWeb",
                            decoration: TextDecoration.none,
                            color: Colors.grey.shade600,
                            fontSize: 2.h),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      )),
                ],
              ));
  }
}
/*class Confirm{
   final TextEditingController test;


   const Confirm({
     required this.test,
   });
   print("");
}*/
