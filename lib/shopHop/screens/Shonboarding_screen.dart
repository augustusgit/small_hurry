import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/main.dart';
import 'package:small_hurry/main/utils/AppColors.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/main/utils/dots_indicator/dots_indicator.dart';
import 'package:small_hurry/shopHop/screens/ShHomeScreen.dart';
import 'package:small_hurry/shopHop/screens/ShSignIn.dart';
import 'package:small_hurry/shopHop/screens/ShSignUp.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShImages.dart';
import 'package:small_hurry/shopHop/utils/ShStrings.dart';
import 'package:small_hurry/shopHop/utils/widgets/ShSliderWidget.dart';

class ShOnboardingScreen extends StatefulWidget {
  static var tag = "/ShOnboardingScreen";

  @override
  _ShOnboardingScreenState createState() => _ShOnboardingScreenState();
}

class _ShOnboardingScreenState extends State<ShOnboardingScreen> {
  var mSliderList = <String>[ic_walk_11, ic_walk_22, ic_walk_33];
  var mHeadingList = <String>["delivery in minutes", "day or night", "Small Hurry!"];
  var mSubHeadingList = <String>[
    "We make around your city Affordable,easy and efficient.",
    "Shop the most trending fashion on the biggest shopping website",
    "Grab the best seller pieces at bargain prices."
  ];
  var position = 0;

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.white);
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    return Scaffold(
      appBar: customAppBar(
        context,
        "Small Hurry",
        showBack: false,
        actions: [
          Tooltip(
            message: 'Dark Mode',
            child: Switch(
              value: appStore.isDarkModeOn,
              activeColor: appColorPrimary,
              onChanged: (s) {
                appStore.toggleDarkMode(value: s);
                setState(() {});
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(spacing_large, spacing_large, spacing_large, spacing_standard_new),
                  child: Column(
                    children: <Widget>[
                      text(mHeadingList[position], textColor: sh_textColorPrimary, fontSize: textSizeLarge, fontFamily: fontBold),
                      SizedBox(height: 5.0),
                    ],
                  ),
                ),
                ShCarouselSlider(
                  viewportFraction: 0.8,
                  height: MediaQuery.of(context).size.height * 0.5,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                  items: mSliderList.map((slider) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: width * 0.9,
                          decoration: BoxDecoration(
                            color: sh_white,
                            borderRadius: BorderRadius.all(Radius.circular(spacing_standard)),
                            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), spreadRadius: spacing_control_half, blurRadius: 10, offset: Offset(1, 3))],
                          ),
                          margin: EdgeInsets.all(spacing_standard_new),
                          child: Center(
                              child: Image.asset(
                                  slider, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.cover)),
                        );
                      },
                    );
                  }).toList(),
                  onPageChanged: (index) {
                    position = index;
                    setState(() {});
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(spacing_large),
                  child: Column(
                    children: <Widget>[
                      DotsIndicator(
                        dotsCount: 3,
                        position: position,
                        decorator: DotsDecorator(color: sh_view_color, activeColor: sh_colorPrimary, activeSize: const Size.square(14.0), spacing: EdgeInsets.all(spacing_control)),
                      ),
                      SizedBox(height: spacing_standard),
                      InkWell(
                        onTap: () {
                          ShSignIn().launch(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            text(sh_lbl_continue_without_login),
                            text(sh_lbl_sign_in, textColor: sh_textColorPrimary, fontFamily: fontBold),
                          ],
                        ),
                      ),
                      SizedBox(height: spacing_standard),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: MaterialButton(
                          padding: EdgeInsets.all(spacing_standard),
                          child: Text(sh_text_register, style: TextStyle(fontSize: 18)),
                          textColor: sh_white,
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                          color: sh_colorPrimary,
                          onPressed: () {
                            finish(context);
                            ShSignUp().launch(context);
                          },
                        ),
                      ),
                      SizedBox(height: spacing_standard_new),
                      InkWell(
                        onTap: () {
                          ShSignIn().launch(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            text(sh_lbl_already_have_a_account),
                            text(sh_lbl_sign_in, textColor: sh_textColorPrimary, fontFamily: fontBold),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ShSliderWidget extends StatelessWidget {
  var mSliderList = <String>[ic_walk_1, ic_walk_2, ic_walk_3];

  ShSliderWidget(this.mSliderList);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final Size cardSize = Size(width, width / 1.8);

    return ShCarouselSlider(
      viewportFraction: 0.9,
      height: cardSize.height,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: mSliderList.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: cardSize.height,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 0,
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                    imageUrl: slider,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: cardSize.height),
              ),
            );
          },
        );
      }).toList(),
      onPageChanged: (index) {},
    );
  }
}
