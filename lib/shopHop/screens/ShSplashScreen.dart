import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/shopHop/screens/ShHomeScreen.dart';
import 'package:small_hurry/shopHop/screens/Shonboarding_screen.dart';
import 'package:small_hurry/shopHop/screens/category_product_screen.dart';
import 'package:small_hurry/shopHop/screens/category_subcategory_screen.dart';
import 'package:small_hurry/shopHop/screens/checkout_screen.dart';
import 'package:small_hurry/shopHop/screens/product_detail.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShImages.dart';
import 'package:small_hurry/shopHop/utils/prefs.dart';

class ShSplashScreen extends StatefulWidget {
  static String tag = '/ShophopSplash';

  @override
  ShSplashScreenState createState() => ShSplashScreenState();
}

class ShSplashScreenState extends State<ShSplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();

  }

  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  goOnBoard(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => CheckoutScreen()));
  }

  goHome(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => CheckoutScreen()));
  }

  void navigationPage() async {
    finish(context);
    // const CategorySubScreen().launch(context);
    bool loggedIn = await checkLoggedInUser();
    loggedIn ? goHome() : goOnBoard();
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ShHomeScreen()));

  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.black);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width + width * 0.4,
        child: Stack(
          children: <Widget>[
            Image.asset(splash_bg, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.cover),
            // Positioned(
            //   top: -width * 0.2,
            //   left: -width * 0.2,
            //   child: Container(
            //     width: width * 0.65,
            //     height: width * 0.65,
            //     decoration: BoxDecoration(shape: BoxShape.circle, color: sh_colorPrimary.withOpacity(0.3)),
            //   ),
            // ),

            ],
        ),
      ),
    );
  }
}
