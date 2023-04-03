import 'package:flutter/material.dart';
import 'package:shop_manager/connect/wooConnect.dart';
import 'package:shop_manager/model/shop_detail.dart';
import 'package:shop_manager/ui/allOrders.dart';
import 'package:shop_manager/ui/allProduct.dart';
import 'package:sizer/sizer.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:jdate/jdate.dart';
import '../model/report_orders.dart';
import '../model/report_product.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);
 // static ShopDetail shopDetail = _mainPageState().shopDetail;

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  List<Low>? reportLow;
  List<Top>? reportTop;
  late ReportOrders reportOrders;
  late ShopDetail shopDetail;

  var isLoad = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    reportLow = await connectToWoo().reportLowContent();
    reportTop = await connectToWoo().reportTopContent();
    reportOrders = await connectToWoo().reportOrders();
    shopDetail = await connectToWoo().getLicense(context);
    if (reportLow != null && reportTop != null && reportOrders != null ) {

      setState(() {
        isLoad = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dteNow = DateTime.now().toJalali();
    var jd = JDate(dteNow.year, dteNow.month, dteNow.day);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Visibility(
          visible: isLoad,
          replacement: Container(height: 100.h,width: 100.w,color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.blueGrey,),
            ),
          ),
          child: Sizer(builder: (context, orientation, deviceType) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Stack(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipPath(
                      clipper: CurveClipper(),
                      child: Container(
                        height: 37.h,
                        width: 100.w,
                        decoration:
                            const BoxDecoration(color: Colors.blueGrey),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 4.h, top: 5.h),
                            alignment: Alignment.topLeft,
                            child: Text(
                              shopDetail.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2.8.h,
                                  decoration: TextDecoration.none,
                                  fontFamily: "IRANSansWeb"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 4.h, bottom: 3.h),
                            alignment: Alignment.topLeft,
                            child: Text(
                              jd.echo('l، d F'),
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 2.h,
                                  decoration: TextDecoration.none,
                                  fontFamily: "IRANSansWeb"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 3.h),
                            width: 90.w,
                            height: 27.h,
                            child: Card(
                              color: const Color(0xFFffffff),
                              elevation: 1.h,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.h)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                              height: 7.h,
                                              child: Image.asset(
                                                  "asset/total_orders.png")),
                                          Text(
                                            "تعداد سفارشات",
                                            style: TextStyle(
                                                fontFamily: "IRANSansWeb",
                                                fontSize: 2.5.w),
                                          ),
                                          Text(reportOrders.totalOrders.toString(),
                                              style: TextStyle(
                                                  fontFamily: "IRANSansWeb",
                                                  fontSize: 2.5.w))
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                              height: 7.h,
                                              child: Image.asset(
                                                  "asset/total_items.png")),
                                          Text("تعداد آیتم ها",
                                              style: TextStyle(
                                                  fontFamily: "IRANSansWeb",
                                                  fontSize: 2.5.w)),
                                          Text(reportOrders.totalItems.toString(),
                                              style: TextStyle(
                                                  fontFamily: "IRANSansWeb",
                                                  fontSize: 2.5.w))
                                        ],
                                      ),
                                      Column(
                                        children: [

                                          Container(
                                              height: 7.h,
                                              child: Image.asset(
                                                  "asset/total_sale.png")),
                                          Text("تعداد فروش کلی",
                                              style: TextStyle(
                                                  fontFamily: "IRANSansWeb",
                                                  fontSize: 2.5.w)),
                                          Text(reportOrders.totalSales.toString(),
                                              style: TextStyle(
                                                  fontFamily: "IRANSansWeb",
                                                  fontSize: 2.5.w))
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                              height: 7.h,
                                              child: Image.asset(
                                                  "asset/net_sale.png")),
                                          Text("تعداد فروش خالص",
                                              style: TextStyle(
                                                  fontFamily: "IRANSansWeb",
                                                  fontSize: 2.5.w)),
                                          Text(reportOrders.netSales.toString(),
                                              style: TextStyle(
                                                  fontFamily: "IRANSansWeb",
                                                  fontSize: 2.5.w))
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                         /* Container(
                            padding: EdgeInsets.only(left: 4.h),
                            alignment: Alignment.topLeft,
                            child: Text(
                              jd.echo('دسته بندی ها'),
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 2.h,
                                  decoration: TextDecoration.none,
                                  fontFamily: "IRANSansWeb"),
                            ),
                          ),*/
                          Container(
                            padding: EdgeInsets.all(1.h),
                            height: 19.h, //color: Colors.red,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    width: 45.w,
                                    height: 17.h,
                                    child: Card(
                                        color: Colors.blueGrey.shade100,//const Color(0xFFbdd6ff),
                                        elevation: 0.5.h,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(1.h)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                height: 7.h,
                                                //margin: EdgeInsets.only(left: 2.w),
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Colors.white,
                                                ),
                                                child: Image.asset(
                                                    "asset/orders.png")),
                                            Text("سفارش ها",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontFamily: "IRANSansWeb",
                                                    fontSize: 3.5.w)),
                                          ],
                                        )),
                                  ),onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return allOrders(shopDetail);
                                    }));
                                },
                                ),
                                Container(
                                  width: 45.w,
                                  height: 17.h,
                                  child: Card(
                                      color: const Color(0xFFffc9c9),
                                      elevation: 0.5.h,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.h)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                              height: 7.h,
                                              //margin: EdgeInsets.only(left: 2.w),
                                              decoration: const BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(10)),
                                                color: Colors.white,
                                              ),
                                              child: Image.asset(
                                                  "asset/products.png")),
                                          GestureDetector(onTap: (){
                                            print("tapped");
                                             Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                              return allProduct(shopDetail);
                                            }));
                                          },
                                            child: Text("محصولات",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontFamily: "IRANSansWeb",
                                                    fontSize: 3.5.w)),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 4.h),
                            alignment: Alignment.topLeft,
                            child: Text(
                              jd.echo('پرفروش ترین ها'),
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 2.h,
                                  decoration: TextDecoration.none,
                                  fontFamily: "IRANSansWeb"),
                            ),
                          ),
                          Container(
                            height: 12.h,
                            child: ListView.builder(scrollDirection:Axis.horizontal,itemCount: reportTop?.length,itemBuilder: (context,index){
                              return Padding(
                                padding:  EdgeInsets.only(right: 1.h,left: 2.h,top: 1.h),
                                child: Container(width: 40.w,
                                  child: Column(
                                    children: [
                                      Text(reportTop![index].name, style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 3.w,
                                        fontFamily: "IRANSansWeb",
                                        color: Colors.black38,),textAlign: TextAlign.center,),
                                      Text("تعداد فروش : " + reportTop![index].number, style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 3.w,
                                        fontFamily: "IRANSansWeb",
                                        color: Colors.green,),textAlign: TextAlign.center),

                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 4.h),
                            alignment: Alignment.topLeft,
                            child: Text(
                              jd.echo('کم فروش ترین ها'),
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 2.h,
                                  decoration: TextDecoration.none,
                                  fontFamily: "IRANSansWeb"),
                            ),
                          ),
                          Container(//color: Colors.red,
                            height: 15.h,
                            child: ListView.builder(scrollDirection:Axis.horizontal,itemCount: reportLow?.length,itemBuilder: (context,index){
                              return Padding(
                                padding:  EdgeInsets.only(right: 1.h,left: 2.h,top: 1.h),
                                child: Container(width: 40.w,
                                  child: Column(
                                    children: [
                                      Text(reportLow![index].name, style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 3.w,
                                        fontFamily: "IRANSansWeb",
                                        color: Colors.black38,),textAlign: TextAlign.center,),
                                      Text("تعداد فروش : " + reportLow![index].number, style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 3.w,
                                        fontFamily: "IRANSansWeb",
                                        color: Colors.red,),textAlign: TextAlign.center),

                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ));
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 40;
    Offset controlPoint = Offset(size.width / 3, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
