import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/main/utils/AppColors.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/shopHop/screens/ShSearchScreen.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShStrings.dart';

class SearchAddressBar extends StatelessWidget {
  const SearchAddressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
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
            minWidth: screenWidth * 0.77,
            height: screenWidth * 0.12,
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            height: screenWidth * 0.15,
            width: screenWidth * 0.23,
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
    );
  }
}
