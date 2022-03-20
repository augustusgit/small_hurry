import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/main/utils/dots_indicator/dots_indicator.dart';
import 'package:small_hurry/shopHop/screens/ShHomeScreen.dart';
import 'package:small_hurry/shopHop/screens/ShSignIn.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShImages.dart';
import 'package:small_hurry/shopHop/utils/ShStrings.dart';
import 'package:small_hurry/shopHop/utils/widgets/ShSliderWidget.dart';

class ShWalkThroughScreen extends StatefulWidget {
  static var tag = "/ShWalkThroughScreen";

  @override
  _ShWalkThroughScreenState createState() => _ShWalkThroughScreenState();
}

class _ShWalkThroughScreenState extends State<ShWalkThroughScreen> {
  var mSliderList = <String>[ic_walk_1, ic_walk_2, ic_walk_3];
  var mHeadingList = <String>["Hi, Welcome", "Most Unique Styles!", "Shop Till You Drop!"];
  var mSubHeadingList = <String>[
    "We make around your city Affordable,easy and efficient.",
    "Shop the most trending fashion on the biggest shopping website",
    "Grab the best seller pieces at bargain prices."
  ];
  var position = 1;

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
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    autoPlay: true,
                  ),
                  items: mSliderList.map(
                        (item) => Container(
                      child: Center(
                        child: Image.asset(
                          item,
                          fit: BoxFit.fill,
                          width: width,
                          height: MediaQuery.of(context).size.height,
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Positioned(
              bottom: -width * 0.2,
              right: -width * 0.2,
              child: DotsIndicator(
                dotsCount: 3,
                position: position,
                decorator: DotsDecorator(color: sh_view_color, activeColor: sh_colorPrimary, activeSize: const Size.square(14.0), spacing: EdgeInsets.all(spacing_control)),
              ),
            ),
          ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(spacing_large),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: MaterialButton(
                            padding: EdgeInsets.all(spacing_standard),
                            child: Text(sh_text_start_to_shopping, style: TextStyle(fontSize: 18)),
                            textColor: sh_white,
                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
                            color: sh_colorPrimary,
                            onPressed: () {
                              finish(context);
                              ShHomeScreen().launch(context);
                            },
                          ),
                        ),
                        SizedBox(height: spacing_standard),
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
      viewportFraction: 1.0,
      height: MediaQuery.of(context).size.height, //cardSize.height,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: mSliderList.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 0,
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Image.asset(
                  slider, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.cover)
              ),
            );
          },
        );
      }).toList(),
      onPageChanged: (index) {},
    );
  }
}
