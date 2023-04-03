import 'package:flutter/material.dart';
import 'package:shop_manager/connect/wooConnect.dart';
import 'package:shop_manager/model/shop_detail.dart';
import 'package:shop_manager/ui/mainPage.dart';
import 'package:shop_manager/ui/product.dart';
import 'package:sizer/sizer.dart';
import '../model/products.dart';
import 'mainPage.dart';

class allProduct extends StatefulWidget {
  final ShopDetail shopDetail ;
  const allProduct(this.shopDetail, {super.key});
  @override
  State<allProduct> createState() => _allProductState();
}

class _allProductState extends State<allProduct> {
  late List<Products>? products;
  var isLoad = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    products = await connectToWoo().getProduct();
    if (products != null) {
      setState(() {
        isLoad = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      replacement: Container(height: 100.h,width: 100.w,color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.blueGrey,),
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
                    padding: EdgeInsets.only(left: 8.w, top: 5.h, bottom: 1.5.h),
                    child: Text(
                      widget.shopDetail.name,
                      style: TextStyle(
                          fontFamily: "IRANSansWeb",
                          fontSize: 3.h,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(bottom: 4.h),
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
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                      ),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: 80.h,
                        width: 100.w,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: products?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: 1.h, left: 2.h, top: 1.h),
                                child: Container(
                                  height: 15.h,
                                  width: 80.w,
                                  child: GestureDetector(onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                      return product(products,index);
                                    }));
                                  },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2.h)),
                                      elevation: 1.h,
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 10.h,width: 30.w,
                                            child: products![index].image == ""
                                                ? Image.asset("asset/index.png"):
                                            Image.network(products![index].image),),
                                          SizedBox(width: 40.w,
                                            child: Text(
                                              products![index].name,
                                              style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontSize: 3.w,
                                                fontFamily: "IRANSansWeb",
                                                color: Colors.black38,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
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
    Key? key,
    required this.key1,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: 45.w,
              child: Text(
                key1,
                style: TextStyle(fontFamily: "IRANSansWeb"),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              )),
          Container(
              width: 45.w,
              child: Text(
                value,
                style: TextStyle(fontFamily: "IRANSansWeb"),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              )),
        ],
      ),
    );
  }
}
