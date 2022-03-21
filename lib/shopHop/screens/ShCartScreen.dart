import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_hurry/shopHop/screens/ShCartFragment.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShStrings.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';

class ShCartScreen extends StatefulWidget {
  static String tag = '/ShCartScreen';

  @override
  ShCartScreenState createState() => ShCartScreenState();
}

class ShCartScreenState extends State<ShCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        "Cart",
        showBack: true,
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
      body: ShCartFragment(),
    );
  }
}
