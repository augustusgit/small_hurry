import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/main/utils/AppColors.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/shopHop/models/ShProduct.dart';
import 'package:small_hurry/shopHop/screens/ShOrderSummaryScreen.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShExtension.dart';
import 'package:small_hurry/shopHop/utils/ShStrings.dart';
import 'package:small_hurry/shopHop/utils/ShWidget.dart';

class ShCartFragment extends StatefulWidget {
  static String tag = '/ShProfileFragment';

  @override
  ShCartFragmentState createState() => ShCartFragmentState();
}

class ShCartFragmentState extends State<ShCartFragment> {
  List<ShProduct> list = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var products = await loadCartProducts();
    setState(() {
      list.clear();
      list.addAll(products);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var cartList = ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: spacing_standard_new),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            color: sh_itemText_background,
            margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        "images/shophop/img/products" + list[index].images![0].src!,
                        width: width * 0.22,
                        height: width * 0.24,
                        fit: BoxFit.fill,
                      ).cornerRadiusWithClipRRect(16),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: spacing_standard,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: text(list[index].name, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0, top: spacing_control),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[

                                      Card(
                                        semanticContainer: true,
                                        child: IconButton(
                                          highlightColor: appLayout_background,
                                          focusColor: appLayout_background,
                                          icon: Icon(
                                            Icons.add,
                                          ),
                                          onPressed: () {
                                            //statements
                                            print('IconButton is pressed');
                                          },
                                        ),
                                      ),
                                      Container(
                                        color: appColorPrimary,
                                        child: Card(
                                          color: appColorPrimary,
                                          child: Text('2', style: TextStyle(color: Colors.white)),
                                        ),
                                      ),
                                      Card(
                                        semanticContainer: true,
                                        child: IconButton(
                                          highlightColor: appLayout_background,
                                          focusColor: appLayout_background,
                                          icon: Icon(
                                            Icons.remove,
                                          ),
                                          onPressed: () {
                                            //statements
                                            print('IconButton is pressed');
                                          },
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 16.0),
                                //   child: Row(
                                //     crossAxisAlignment: CrossAxisAlignment.end,
                                //     children: <Widget>[
                                //       text(list[index].on_sale! ? list[index].sale_price.toString().toCurrencyFormat() : list[index].price.toString().toCurrencyFormat(),
                                //           textColor: sh_colorPrimary, fontSize: textSizeNormal, fontFamily: fontMedium),
                                //       SizedBox(
                                //         width: spacing_control,
                                //       ),
                                //       Padding(
                                //         padding: const EdgeInsets.only(bottom: 3.0),
                                //         child: Text(
                                //           list[index].regular_price.toString().toCurrencyFormat()!,
                                //           style: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeSMedium, decoration: TextDecoration.lineThrough),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget> [
                                  itemTitle(context, "₦867", textColor: Theme.of(context).highlightColor, fontSize: 14.0, lineThrough: true),
                                  itemTitle(context, "₦456"),
                                ],
                              ),),
                              Container(
                                width: 1,
                                color: sh_view_color,
                                height: 35,
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.delete_outline,
                                      color: sh_textColorPrimary,
                                      size: 16,
                                    ),
                                    text(sh_lbl_remove, textColor: sh_textColorPrimary, fontSize: textSizeSmall)
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
          // return Chats(mListings[index], index);
        });
    var paymentDetail = Container(
      margin: EdgeInsets.fromLTRB(spacing_standard_new, spacing_standard_new, spacing_standard_new, 80),
      decoration: BoxDecoration(border: Border.all(color: sh_view_color, width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(spacing_standard_new, spacing_middle, spacing_standard_new, spacing_middle),
            child: text(sh_lbl_payment_details, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
          ),
          Divider(
            height: 1,
            color: sh_view_color,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(spacing_standard_new, spacing_middle, spacing_standard_new, spacing_middle),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    text(sh_lbl_offer),
                    text(sh_text_offer_not_available, textColor: sh_textColorPrimary, fontFamily: fontMedium),
                  ],
                ),
                SizedBox(
                  height: spacing_standard,
                ),
                Row(
                  children: <Widget>[
                    text(sh_lbl_shipping_charge),
                    text(sh_lbl_free, textColor: Colors.green, fontFamily: fontMedium),
                  ],
                ),
                SizedBox(
                  height: spacing_standard,
                ),
                Row(
                  children: <Widget>[
                    text(sh_lbl_total_amount),
                    text("\$70", textColor: sh_colorPrimary, fontFamily: fontBold, fontSize: textSizeLargeMedium),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );

    var bottomButtons = Container(
      height: 65,
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: sh_shadow_color, blurRadius: 10, spreadRadius: 2, offset: Offset(0, 3))], color: sh_white),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              child: Container(
                child: text(sh_lbl_continue, textColor: sh_white, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                color: sh_colorPrimary,
                alignment: Alignment.center,
                height: double.infinity,
              ),
              onTap: () {
                // ShOrderSummaryScreen().launch(context);
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                text("\$70", textColor: sh_textColorPrimary, fontFamily: fontBold, fontSize: textSizeLargeMedium),
                text(sh_lbl_see_price_detail, fontSize: 14.0),
              ],
            ),
          ),

        ],
      ),
    );
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: Column(
                  children: <Widget>[cartList],
                ),
              ),
            ),
            Container(
              color: sh_white,
              // padding: const EdgeInsets.only(bottom: 60),
              child: bottomButtons,
            )
          ],
        ),
      ),
    );
  }
}
