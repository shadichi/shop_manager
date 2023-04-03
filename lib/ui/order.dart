import 'package:flutter/material.dart';
import 'package:shop_manager/model/orders.dart';
import 'package:sizer/sizer.dart';
import 'package:shop_manager/connect/wooConnect.dart';
import '../model/products.dart';

var edit = false;
var confirm = false;

class order extends StatefulWidget {
  order(List<Orders>? orders,
      /*List<LineItem>? lineItems*/ this.index,) : this.orders = orders ?? [];
  final List<Orders> orders;

  //final List<LineItem> lineItems = [];
  final int index;

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
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
    if (widget.orders != null) {
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
          return SafeArea(
            child: Scaffold(
              body: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "سفارش شماره ${widget.orders![widget.index].id}",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 4.w,
                            fontFamily: "IRANSansWeb",
                            color: Colors.black,
                          ),
                        )),
                    Card(
                      color: const Color(0XFFFFECE5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.h)),
                      elevation: 1.h,
                      child: Container(
                        margin: EdgeInsets.all(2.w),
                        //  color: Colors.red,
                        height: 10.h,
                        width: 85.w,
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                ": آدرس ارسال",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 3.w,
                                  fontFamily: "IRANSansWeb",
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      widget.orders![widget.index].shipping
                                          .address1 == ""
                                          ? "! آدرسی درج نشده است":
                            widget.orders![widget.index].shipping
                                .address1,
                                      style: TextStyle(fontSize: 3.w,
                                        fontFamily: "IRANSansWeb",),
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 2.6.w),
                      // color: Colors.red,
                      height: 50.h,
                      width: 85.w,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                          widget.orders![widget.index].lineItems.length,
                          itemBuilder: (context, index) {
                            return Container(
                              // padding: EdgeInsets.only(left: 4.7.w),

                              alignment: Alignment.centerRight,
                              height: 30.h,
                              width: 80.w,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.h)),
                                elevation: 1.h,
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.all(2.w),
                                  //color: Colors.blueAccent,
                                  height: 40.h,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Container(
                                        child: Image.asset("asset/index.png"),
                                        height: 20.h,
                                        width: 40.w,
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          widget.orders[index].lineItems[index]
                                              .name,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 3.w,
                                            fontFamily: "IRANSansWeb",
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "تعداد خریداری شده : ${widget
                                                .orders[index].lineItems[index]
                                                .quantity}",
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 3.w,
                                              fontFamily: "IRANSansWeb",
                                              color: Colors.black54,
                                            ),
                                          )),
                                      Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "مالیات : ${widget.orders[index]
                                                .lineItems[index].totalTax}",
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 3.w,
                                              fontFamily: "IRANSansWeb",
                                              color: Colors.black54,
                                            ),
                                          )),
                                      Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "قیمت کلی : ${widget.orders[index]
                                                .lineItems[index].total}",
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 3.w,
                                              fontFamily: "IRANSansWeb",
                                              color: Colors.black54,
                                            ),
                                          ))

                                      //  makeColumn(key1: "روش پرداخت", value: orders![index].paymentMethodTitle.toString()),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Text(
                      "مجموع سفارشات : " + widget.orders![widget.index].total,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 3.w,
                        fontFamily: "IRANSansWeb",
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      "تخفیف : " + widget.orders![widget.index].discountTotal,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 3.w,
                        fontFamily: "IRANSansWeb",
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Container(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.w),
                            color: Colors.black87),
                        height: 12.h,
                        width: 80.w,
                        child: Container(
                          margin: EdgeInsets.all(2.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            textDirection: TextDirection.rtl,
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                child: const Text(
                                  'مجموع سفارشات',
                                  style: TextStyle(
                                      fontFamily: "IRANSansWeb",
                                      color: Colors.white),
                                ),
                              ),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(widget.orders![widget.index].total,
                                      style: TextStyle(
                                          fontFamily: "IRANSansWeb",
                                          fontSize: 7.w,
                                          color: Colors.white)),
                                  Text(" ریال ",
                                      style: TextStyle(
                                          fontFamily: "IRANSansWeb",
                                          fontSize: 5.w,
                                          color: Colors.white))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class makeColumn extends StatelessWidget {
  final String key1;
  final String value;
  final List<Orders> orders;
  final int index;
  final TextEditingController controller;

  const makeColumn({
    required this.key1,
    required this.value,
    required this.controller,
    required this.orders,
    required this.index,
  });

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
/*
Container(
child: ElevatedButton(
onPressed: () {},
style: ButtonStyle(
backgroundColor:
MaterialStateProperty.all(Colors.black54),
overlayColor: MaterialStateProperty.all(Colors.red),
fixedSize:
MaterialStateProperty.all(Size(85.w, 12.h)),
shape: MaterialStateProperty.all(
RoundedRectangleBorder(
borderRadius: BorderRadius.circular(7.w),
))),
child: Container(
margin: EdgeInsets.all(2.w),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
textDirection: TextDirection.rtl,
children: [
Container(
alignment: Alignment.centerRight,
child: const Text(
'مجموع سفارشات',
style: TextStyle(
fontFamily: "IRANSansWeb",
),
),
),
Row(
textDirection: TextDirection.rtl,
children: [
Text(widget.orders![widget.index].total,
style: TextStyle(
fontFamily: "IRANSansWeb",
fontSize: 7.w,
)),
Text(" ریال ",
style: TextStyle(
fontFamily: "IRANSansWeb",
fontSize: 5.w,
))
],
),
],
),
),
),
),*/
