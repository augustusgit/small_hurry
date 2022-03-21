import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/main/utils/AppColors.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/main/utils/dots_indicator/dots_indicator.dart';
import 'package:small_hurry/shopHop/models/ShCategory.dart';
import 'package:small_hurry/shopHop/models/ShProduct.dart';
import 'package:small_hurry/shopHop/screens/ShSearchScreen.dart';
import 'package:small_hurry/shopHop/screens/ShSubCategory.dart';
import 'package:small_hurry/shopHop/screens/ShViewAllProducts.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShExtension.dart';
import 'package:small_hurry/shopHop/utils/ShStrings.dart';
import 'package:small_hurry/shopHop/utils/ShWidget.dart';

class ShHomeFragment extends StatefulWidget {
  static String tag = '/ShHomeFragment';

  @override
  ShHomeFragmentState createState() => ShHomeFragmentState();
}

class ShHomeFragmentState extends State<ShHomeFragment> {
  List<ShCategory> list = [];
  List<String> banners = [];
  List<ShProduct> newestProducts = [];
  List<ShProduct> featuredProducts = [];
  var position = 0;
  var colors = [sh_cat_1, sh_cat_2, sh_cat_3, sh_cat_4, sh_cat_5, sh_cat_3, sh_cat_1,];

  @override
  void initState() {
    super.initState();
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
    List<ShProduct> products = await loadProducts();
    List<ShProduct> featured = [];
    products.forEach((product) {
      if (product.featured!) {
        featured.add(product);
      }
    });
    List<String> banner = [];
    for (var i = 1; i < 4; i++) {
      banner.add("images/shophop/img/products/banners/b" + i.toString() + ".png");
    }
    setState(() {
      newestProducts.clear();
      featuredProducts.clear();
      banners.clear();
      banners.addAll(banner);
      newestProducts.addAll(products);
      featuredProducts.addAll(featured);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;

    return Scaffold(
      body: list.isNotEmpty ? 
      SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      color: appLight_yellow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MaterialButton(
                            padding: EdgeInsets.all(spacing_standard),
                            child: text(sh_lbl_delivery_address, fontSize: textSizeSmall, fontFamily: fontMedium, textColor: sh_colorPrimary),
                            textColor: sh_colorPrimary,
                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.only(topRight: Radius.circular(40.0), bottomRight: Radius.circular(40.0) )),
                            color: sh_white,
                            onPressed: () => {ShSearchScreen().launch(context)},
                            minWidth: width * 0.77,
                            height: height * 0.1,
                          ),
                          Container(
                            height: height * 0.1,
                            width: width * 0.23,
                            decoration: new BoxDecoration(
                                color: appLight_yellow
                            ),
                            child: Center(child: text("ETA \n 10mins.", textColor: appColorPrimaryDark, maxLine: 6, fontSize: textSizeSMedium, isLongText: true)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.55,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          PageView.builder(
                            itemCount: banners.length,
                            itemBuilder: (context, index) {
                              return Image.asset(banners[index], width: width, height: height * 0.55, fit: BoxFit.cover);
                            },
                            onPageChanged: (index) {
                              setState(() {
                                position = index;
                              });
                            },
                          ),
                          banners.isNotEmpty ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DotsIndicator(
                              dotsCount: banners.length,
                              position: position,
                              decorator: DotsDecorator(
                                color: sh_view_color,
                                activeColor: sh_colorPrimary,
                                size: const Size.square(7.0),
                                activeSize: const Size.square(10.0),
                                spacing: EdgeInsets.all(3),
                              ),
                            ),
                          ) : Container(),
                        ],
                      ),
                    ),

                  Container(
                    child: GridView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 11, right: 11, top: spacing_standard_new),
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 9 / 9),
                      scrollDirection: Axis.vertical,
                      controller: ScrollController(keepScrollOffset: false),
                      itemBuilder: (context, index) {

                        return InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(title: "Action")));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: networkImage(list[index].image!, aWidth: double.infinity, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                              ),
                              itemTitle(context, list[index].name),
                              // itemSubTitle(context, "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", isLongText: false),
                            ],
                          ),
                        ).paddingOnly(left: 5, right: 5, bottom: spacing_standard_new);
                      },
                    ),
                  ),

                    // Container(
                    //   height: 80,
                    //   margin: EdgeInsets.only(top: spacing_standard_new),
                    //   alignment: Alignment.topLeft,
                    //   child: ListView.builder(
                    //     itemCount: list.length,
                    //     shrinkWrap: true,
                    //     scrollDirection: Axis.horizontal,
                    //     padding: EdgeInsets.only(left: spacing_standard, right: spacing_standard),
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return InkWell(
                    //         onTap: () {
                    //           Navigator.push(context, MaterialPageRoute(builder: (context) => ShSubCategory(category: list[index])));
                    //         },
                    //         child: Container(
                    //           margin: EdgeInsets.only(left: spacing_standard, right: spacing_standard),
                    //           child: Column(
                    //             children: <Widget>[
                    //               Container(
                    //                 padding: EdgeInsets.all(spacing_middle),
                    //                 decoration: BoxDecoration(shape: BoxShape.circle, color: colors[index % colors.length]),
                    //                 child: Image.asset(list[index].image!, width: 15, color: sh_white),
                    //               ),
                    //               SizedBox(height: spacing_control),
                    //               text(list[index].name, textColor: colors[index % colors.length], fontFamily: fontMedium)
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // horizontalHeading(sh_lbl_newest_product, callback: () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => ShViewAllProductScreen(prodcuts: newestProducts, title: sh_lbl_newest_product)));
                    // }),
                    // ProductHorizontalList(newestProducts),
                    // SizedBox(height: spacing_standard_new),
                    // horizontalHeading(sh_lbl_Featured, callback: () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => ShViewAllProductScreen(prodcuts: featuredProducts, title: sh_lbl_Featured)));
                    // }),
                    // ProductHorizontalList(featuredProducts),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }
}
