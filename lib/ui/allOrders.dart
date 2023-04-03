import 'package:flutter/material.dart';
import 'package:shop_manager/connect/wooConnect.dart';
import 'package:shop_manager/model/orders.dart';
import 'package:shop_manager/model/shop_detail.dart';
import 'package:shop_manager/ui/mainPage.dart';
import 'package:shop_manager/ui/order.dart';
import 'package:shop_manager/ui/product.dart';
import 'package:sizer/sizer.dart';
import '../model/products.dart';
import '../model/report_orders.dart';
import 'mainPage.dart';

class allOrders extends StatefulWidget {
  final ShopDetail shopDetail;

  const allOrders(this.shopDetail, {super.key});

  @override
  State<allOrders> createState() => _allOrdersState();
}

class _allOrdersState extends State<allOrders> {
  late List<Orders>? orders;
  late List<LineItem>? lineItem;
  var isLoad = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    orders = (await connectToWoo().getOrders())?.cast<Orders>();
  //  lineItem = (await connectToWoo().getLineItem())?.cast<LineItem>();
    if (orders != null/* && lineItem != null*/) {
      setState(() {
        print("orders is now ready");
        isLoad = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
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
        return Scaffold(
          backgroundColor: Colors.blueGrey,
          body: Visibility(
            visible: isLoad,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: 8.w,
                      top: 5.h,
                    ),
                    child: Text(
                      "سفارشات",
                      style: TextStyle(
                          fontFamily: "IRANSansWeb",
                          fontSize: 2.7.h,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.only(left: 8.w, top: 1.h, bottom: 1.5.h),
                    child: Text(
                   widget.shopDetail.name,
                      style: TextStyle(
                          fontFamily: "IRANSansWeb",
                          fontSize: 2.h,
                          color: Colors.white54),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(bottom: 3.h),
                    height: 8.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.h),
                        color: Colors.blueGrey.shade200),
                    child: Container(
                        padding: EdgeInsets.only(left: 2.w),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 1.h),
                              width: 65.w,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'جستجو',
                                    hintStyle: TextStyle(
                                        fontFamily: "IRANSansWeb",
                                        color: Colors.white,
                                        fontSize: 1.7.h)),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),

                      ),

                    ),
                    child: Container(
                    //  color: Colors.red,
                      margin: EdgeInsets.only(top: 1.h),
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: 80.h,
                          width: 100.w,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: orders?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: 2.h, left: 2.h, ),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                          return order(orders, index);
                                        }));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height:20.h,
                                        //width: 70.w,
                                        child: Card(

                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.h)),
                                          elevation: 1.h,
                                          child: Container(
                                            child: Column(
                                              children: [
                                                SizedBox(height: 1.h,),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      "سفارش شماره ${orders![index].id}",
                                                      style: TextStyle(
                                                        decoration: TextDecoration.none,
                                                        fontSize: 3.w,
                                                        fontFamily: "IRANSansWeb",
                                                        color: Colors.black54,
                                                      ),
                                                      textAlign: TextAlign.right,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 0.5.h,),
                                                makeColumn(key1: "خریدار", value: orders![index].billing.firstName+" "+orders![index].billing.lastName,),
                                                makeColumn(key1: "شهر", value: orders![index].billing.state+" "+orders![index].billing.city,),
                                               // makeColumn(key1: "آدرس", value: orders![index].billing.state+" "+orders![index].billing.address1.toString(),),
                                                makeColumn(key1: "موبایل", value: orders![index].billing.phone),
                                              //  makeColumn(key1: "روش پرداخت", value: orders![index].paymentMethodTitle.toString()),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class makeColumn extends StatelessWidget {
  final String key1;
  final String value;

  const makeColumn({

    required this.key1,
    required this.value,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          width: 45.w,
          child: Text(
            key1+" : "+ value,
            style: TextStyle(fontFamily: "IRANSansWeb",color: Colors.black38),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          )),
    );
  }
}
