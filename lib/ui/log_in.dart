import 'package:flutter/material.dart';
import 'package:shop_manager/connect/wooConnect.dart';
import 'package:shop_manager/ui/allProduct.dart';
import 'package:shop_manager/ui/mainPage.dart';
import 'package:sizer/sizer.dart';

class log_in extends StatelessWidget {
  final TextEditingController urlController = TextEditingController();
  final TextEditingController consumerKeyController = TextEditingController();
  final TextEditingController consumerSecretController =
      TextEditingController();

  log_in({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                color: Colors.blueGrey,
                child: Padding(
                  padding: EdgeInsets.only(top: 11.h),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "ورود به مدیریت فروشگاه",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontSize: 3.h),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 23.h),
                child: Center(
                  child: Container(
                    child: Container(
                      width: 85.w,
                      decoration: BoxDecoration(
                          // color: Colors.green,

                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Colors.grey.shade200.withOpacity(0.5)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: Container(
                  width: 100.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          ":لطفا اطلاعات زیر را تکمیل نمایید",
                          style: TextStyle(
                              decoration: TextDecoration.none, fontSize: 2.3.h),
                        ),
                        TextFormField(
                          cursorColor: Colors.blueGrey,

                          controller: urlController,
                          decoration: InputDecoration(
                            fillColor: Colors.blueGrey,
                            hintStyle: TextStyle(color: Colors.blueGrey,decorationColor: Colors.blueGrey,backgroundColor: Colors.blueGrey),
                            //   fillColor: Colors.white,colo,
                            labelText: "آدرس وب سرویس",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),
                        ),
                        TextFormField(
                          style: TextStyle(decorationColor: Colors.blueGrey),
                          cursorColor: Colors.blueGrey,
                          controller: consumerKeyController,
                          decoration: InputDecoration(
                            labelText: "کلید مصرف کننده",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),
                        ),
                        TextFormField(
                          cursorColor: Colors.blueGrey,

                          controller: consumerSecretController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            labelText: "رمز مصرف کننده",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),
                        ),
                        enterButton(
                            urlController.text,
                            consumerKeyController.text,
                            consumerSecretController.text)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class enterButton extends StatelessWidget {
  late String url;
  late String consumerKey;
  late String consumerSecret;

  enterButton(this.url, this.consumerKey, this.consumerSecret);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            connectToWoo().getLicense(context);

            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return mainPage();
            }));
            //connectToWoo().reportOrders();
          },
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 1 / 10,
              width: MediaQuery.of(context).size.width * 3 / 5,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blueGrey,
                      Colors.grey,
                    ]),
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(""),
                  const Text(
                    "ورود",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Icon(
                        Icons.arrow_right_alt_outlined,
                        size: 25.0,
                        color: Colors.blueGrey,
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
