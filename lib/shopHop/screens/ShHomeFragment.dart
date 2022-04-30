import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/integrations/network/rest_apis.dart';
import 'package:small_hurry/main/utils/AppColors.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/shopHop/models/ShCategory.dart';
import 'package:small_hurry/shopHop/models/ShProduct.dart';
import 'package:small_hurry/shopHop/models/category_sub_category.dart';
import 'package:small_hurry/shopHop/screens/ShSearchScreen.dart';
import 'package:small_hurry/shopHop/screens/category_subcategory_screen.dart';
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
  // List<ShCategory> list = [];
  List<String> banners = [];
  CategorySubCategory? categories;
  bool isLoading = true;
  var position = 0;
  var colors = [sh_cat_1, sh_cat_2, sh_cat_3, sh_cat_4, sh_cat_5, sh_cat_3, sh_cat_1,];
  final PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    fetchData();
    loadCategories();
  }

  fetchData() async {
    List<String> banner = [];
    for (var i = 1; i < 4; i++) {
      banner.add("images/shophop/img/products/banners/b" + i.toString() + ".png");
    }
    setState(() {
      banners.clear();
      banners.addAll(banner);
    });
  }

  loadCategories() async {
    CategorySubCategory category = await getCategories();

    setState(() {
      categories = category;
      if(categories != null) {
        isLoading = false;
      }
    });
    print(category);

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
      backgroundColor: Colors.white,
      body: categories != null ?
      SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      color: appLight_bitter_lemon,
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
                            height: height * 0.12,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            height: height * 0.15,
                            width: width * 0.23,
                            decoration: new BoxDecoration(
                                color: appLight_bitter_lemon
                            ),
                            child: Center(child: Column(
                              children: [
                                text("ETA", textColor: appColorPrimaryDark, maxLine: 1, fontSize: textSizeSmall),
                                text("15mins.", textColor: appColorPrimaryDark, maxLine: 1, isBoldText: true, fontSize: textSizeMedium),
                              ],
                            )),
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
                            controller: _controller,
                            itemBuilder: (context, index) {
                              return Image.asset(banners[index], width: width, height: height * 0.55, fit: BoxFit.cover);
                            },
                            onPageChanged: (index) {
                              setState(() {
                                position = index;
                              });
                            },
                          ),
                          // banners.isNotEmpty ? Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: DotsIndicator(
                          //     dotsCount: banners.length,
                          //     position: position,
                          //     decorator: DotsDecorator(
                          //       color: sh_view_color,
                          //       activeColor: sh_colorPrimary,
                          //       size: const Size.square(7.0),
                          //       activeSize: const Size.square(10.0),
                          //       spacing: EdgeInsets.all(3),
                          //     ),
                          //   ),
                          // ) : Container(),
                        ],
                      ),
                    ),
                    // horizontalHeading(sh_lbl_newest_product, callback: () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => ShViewAllProductScreen(prodcuts: newestProducts, title: sh_lbl_newest_product)));
                    // }),
                  Container(
                    child: GridView.builder(
                      itemCount: categories!.data!.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 11, right: 11, top: spacing_standard_new),
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 9 / 11),
                      scrollDirection: Axis.vertical,
                      controller: ScrollController(keepScrollOffset: false),
                      itemBuilder: (context, index) {

                        return InkWell(
                          onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => CategorySubScreen()));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: networkImage(categories!.data![index].category!.catImgUrl!, aWidth: double.infinity, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                              ),
                              itemTitle(context, categories!.data![index].category!.name!),
                              // itemSubTitle(context, "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", isLongText: false),
                            ],
                          ),
                        ).paddingOnly(left: 5, right: 5, bottom: spacing_standard_new);
                      },
                    ),
                  ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            )
          : Center(child: CircularProgressIndicator(color: appColorPrimary)),
    );
  }
}
