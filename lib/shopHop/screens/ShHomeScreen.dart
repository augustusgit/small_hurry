import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/main.dart';
import 'package:small_hurry/main/utils/AppColors.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/shopHop/models/ShCategory.dart';
import 'package:small_hurry/shopHop/screens/ShCartScreen.dart';
import 'package:small_hurry/shopHop/screens/ShHomeFragment.dart';
import 'package:small_hurry/shopHop/screens/ShOffersScreen.dart';
import 'package:small_hurry/shopHop/screens/ShProfileFragment.dart';
import 'package:small_hurry/shopHop/screens/ShSearchScreen.dart';
import 'package:small_hurry/shopHop/screens/ShSettingsScreen.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShExtension.dart';
import 'package:small_hurry/shopHop/utils/ShImages.dart';
import 'package:small_hurry/shopHop/utils/ShStrings.dart';
import 'package:small_hurry/shopHop/utils/ShWidget.dart';

import 'ShSubCategory.dart';

class ShHomeScreen extends StatefulWidget {
  static String tag = '/ShHomeScreen';

  @override
  ShHomeScreenState createState() => ShHomeScreenState();
}

class ShHomeScreenState extends State<ShHomeScreen> {
  List<ShCategory> list = [];
  var homeFragment = ShHomeFragment();
  var searchFragment = ShSearchScreen(); // ShCartFragment();
 // var wishlistFragment = ShWishlistFragment();
  var promoFragment = ShOffersScreen();
  var profileFragment = ShProfileFragment();
  late var fragments;
  var selectedTab = 0;

  @override
  void initState() {
    super.initState();
    fragments = [homeFragment, searchFragment, promoFragment, profileFragment,];
    fetchData();
  }

  fetchData() async {
    loadCategory().then((categories) {
      setState(() {
        list.clear();
        list.addAll(categories);
      });
    }).catchError((error) {
      toast(error);
    });
  }

  Future<List<ShCategory>> loadCategory() async {
    String jsonString = await loadContentAsset('assets/shophop_data/category.json');
    final jsonResponse = json.decode(jsonString);
    return (jsonResponse as List).map((i) => ShCategory.fromJson(i)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var title = "Small Hurry";

    return Scaffold(
      appBar: customAppBar(
        context,
        "Small Hurry",
        showBack: false,
        isImage: true,
        // actions: [
        //   Tooltip(
        //     message: 'Dark Mode',
        //     child: Switch(
        //       value: appStore.isDarkModeOn,
        //       activeColor: appColorPrimary,
        //       onChanged: (s) {
        //         appStore.toggleDarkMode(value: s);
        //         setState(() {});
        //       },
        //     ),
        //   ),
        // ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: FloatingActionButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: appColorPrimary,
          onPressed: () { ShCartScreen().launch(context); },
          tooltip: 'Cart',
          // child: SvgPicture.asset(sh_ic_cart, width: 24, height: 24, color: appDark_parrot_green), // Icon(Icons.add, color: appLight_yellow),
          child: Center(child: cartIcon(context, 5, iconColor: appWhite)),
          elevation: 2.0,
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          fragments[selectedTab],
          Container(
            height: 58,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Image.asset(bg_bottom_bar, width: width, height: double.infinity, fit: BoxFit.fill),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      tabItem(0, sh_ic_home),
                      tabItem(1, sh_ic_search),
                      SizedBox(width: 10),
                      tabItem(2, sh_ic_gift),
                      tabItem(3, sh_user),

                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      // drawer: SizedBox(
      //   width: MediaQuery.of(context).size.width * 0.85,
      //   height: MediaQuery.of(context).size.height,
      //   child: Drawer(
      //     elevation: 8,
      //     child: SingleChildScrollView(
      //       child: Container(
      //         width: MediaQuery.of(context).size.width,
      //         color: sh_white,
      //         child: Column(
      //           mainAxisSize: MainAxisSize.max,
      //           children: <Widget>[
      //             Stack(
      //               children: <Widget>[
      //                 Center(
      //                   child: Padding(
      //                       padding: const EdgeInsets.only(top: 60, right: spacing_large),
      //                       child: Column(
      //                         children: <Widget>[
      //                           Card(
      //                             semanticContainer: true,
      //                             clipBehavior: Clip.antiAliasWithSaveLayer,
      //                             elevation: spacing_standard,
      //                             margin: EdgeInsets.all(spacing_control),
      //                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
      //                             child: Padding(
      //                               padding: const EdgeInsets.all(4.0),
      //                               child: CircleAvatar(backgroundImage: AssetImage(ic_user), radius: 55),
      //                             ),
      //                           ),
      //                           SizedBox(height: spacing_middle),
      //                           text("Guest User", textColor: sh_textColorPrimary, fontFamily: fontBold, fontSize: textSizeNormal)
      //                         ],
      //                       )),
      //                 ),
      //                 Align(alignment: Alignment.topLeft, child: Padding(padding: const EdgeInsets.only(left: spacing_standard_new, top: 30), child: Icon(Icons.clear)))
      //               ],
      //             ),
      //             SizedBox(height: 30),
      //             Container(
      //               color: sh_editText_background,
      //               padding: EdgeInsets.fromLTRB(0, spacing_standard, 0, spacing_standard),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: <Widget>[
      //                   Expanded(
      //                     child: InkWell(
      //                       onTap: () {
      //                         ShOrderListScreen().launch(context);
      //                       },
      //                       child: Column(
      //                         children: <Widget>[
      //                           text("08", textColor: sh_colorPrimary, fontFamily: fontMedium),
      //                           SizedBox(height: spacing_control),
      //                           text("My Order", textColor: sh_textColorPrimary, fontFamily: fontMedium),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                   Expanded(
      //                     child: InkWell(
      //                       onTap: () {
      //                         Navigator.of(context).pop();
      //                         setState(() {
      //                           selectedTab = 1;
      //                         });
      //                       },
      //                       child: Column(
      //                         children: <Widget>[
      //                           text("07", textColor: sh_colorPrimary, fontFamily: fontMedium),
      //                           SizedBox(height: spacing_control),
      //                           text("Wishlist", textColor: sh_textColorPrimary, fontFamily: fontMedium),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             ListView.builder(
      //               scrollDirection: Axis.vertical,
      //               itemCount: list.length,
      //               shrinkWrap: true,
      //               physics: ScrollPhysics(),
      //               itemBuilder: (context, index) {
      //                 return getDrawerItem(
      //                   list[index].image,
      //                   list[index].name,
      //                   callback: () {
      //                     ShSubCategory(category: list[index]).launch(context);
      //                   },
      //                 );
      //               },
      //             ),
      //             SizedBox(height: 30),
      //             Divider(color: sh_view_color, height: 1),
      //             SizedBox(height: 20),
      //             getDrawerItem(sh_user_placeholder, sh_lbl_account, callback: () {
      //               ShAccountScreen().launch(context);
      //
      //               /*bool isWishlist = launchScreen(context, ShAccountScreen.tag) ?? false;
      //               if (isWishlist) {
      //                 selectedTab = 1;
      //                 setState(() {});
      //               }*/
      //             }),
      //             getDrawerItem(sh_settings, sh_lbl_settings, callback: () {
      //               ShSettingsScreen().launch(context);
      //             }),
      //             SizedBox(height: 20),
      //             getDrawerItem(null, sh_lbl_faq, callback: () {
      //               ShFAQScreen().launch(context);
      //             }),
      //             getDrawerItem(null, sh_lbl_contact_us, callback: () {
      //               ShContactUsScreen().launch(context);
      //             }),
      //             SizedBox(height: 30),
      //             Container(
      //               decoration: BoxDecoration(shape: BoxShape.circle, color: sh_colorPrimary.withOpacity(0.2)),
      //               padding: EdgeInsets.all(24),
      //               child: Column(
      //                 children: <Widget>[
      //                   Image.asset(ic_app_icon, width: 40),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: <Widget>[
      //                       text("Shop", textColor: sh_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontBold),
      //                       text("hop", textColor: sh_colorPrimary, fontSize: textSizeMedium, fontFamily: fontBold),
      //                     ],
      //                   ),
      //                   text("v 1.0", textColor: sh_textColorPrimary, fontSize: textSizeSmall)
      //                 ],
      //               ),
      //             ),
      //             SizedBox(height: 30),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Widget getDrawerItem(String? icon, String? name, {VoidCallback? callback}) {
    return InkWell(
      onTap: callback,
      child: Container(
        color: sh_white,
        padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
        child: Row(
          children: <Widget>[
            icon != null ? Image.asset(icon, width: 20, height: 20) : Container(width: 20),
            SizedBox(width: 20),
            text(name, textColor: sh_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium)
          ],
        ),
      ),
    );
  }

  Widget tabItem(var pos, var icon) {
    return GestureDetector(
      onTap: () {
        selectedTab = pos;
        setState(() {});
      },
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: selectedTab == pos ? BoxDecoration(shape: BoxShape.circle, color: sh_colorPrimary.withOpacity(0.2)) : BoxDecoration(),
        child: SvgPicture.asset(icon, width: 24, height: 24, color: selectedTab == pos ? sh_colorPrimary : sh_textColorSecondary),
      ),
    );
  }
}
