import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/shopHop/models/ShProduct.dart';
import 'package:small_hurry/shopHop/screens/announcementFragment.dart';
import 'package:small_hurry/shopHop/screens/promotionFragment.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShExtension.dart';
import 'package:small_hurry/shopHop/utils/ShStrings.dart';
import 'package:small_hurry/shopHop/utils/ShWidget.dart';

import 'ShProductDetail.dart';

class ShOffersScreen extends StatefulWidget {
  static String tag = '/ShOffersScreen';

  @override
  ShOffersScreenState createState() => ShOffersScreenState();
}

class ShOffersScreenState extends State<ShOffersScreen> {
  List<ShProduct> mProductModel = [];
  int? groupValue = 0;
  var announcementFragment = AnnouncementFragment();
  var promotionalFragment = PromotionFragment();
  late var fragments;

  @override
  void initState() {
    super.initState();
    fragments = [announcementFragment, promotionalFragment];
  }

  @override
  Widget build(BuildContext context) {
    final gridView = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            // height: MediaQuery.of(context).size.height * 0.15,
            child: CupertinoSlidingSegmentedControl<int>(
              backgroundColor:  CupertinoColors.white,
              thumbColor: Theme.of(context).secondaryHeaderColor,
              padding: EdgeInsets.all(12),
              groupValue: groupValue,
              children: {
                0: buildSegment("Promotions"),
                1: buildSegment("Announcements"),
              },
              onValueChanged: (value){
                setState(() {
                  groupValue = value;
                });
              },
            ),
          ),
          fragments[groupValue],
        ],
      ),
    );
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: sh_white,
      //   title: text(sh_lbl_my_offers, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontMedium),
      //   iconTheme: IconThemeData(color: sh_textColorPrimary),
      //   actionsIconTheme: IconThemeData(color: sh_colorPrimary),
      //   actions: <Widget>[cartIcon(context, 3)],
      // ),
      body: gridView,
    );
  }

  Widget buildSegment(String text){
    return Container(
      child: Text(text,style: TextStyle(fontSize: 22,
          color: Colors.black),),
    );
  }

}
