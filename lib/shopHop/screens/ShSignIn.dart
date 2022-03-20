import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/main.dart';
import 'package:small_hurry/main/utils/AppColors.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/main/utils/codePicker/country_code_picker.dart';
import 'package:small_hurry/shopHop/screens/ShHomeScreen.dart';
import 'package:small_hurry/shopHop/screens/ShSignUp.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShImages.dart';
import 'package:small_hurry/shopHop/utils/ShStrings.dart';

class ShSignIn extends StatefulWidget {
  static String tag = '/ShSignIn';

  @override
  ShSignInState createState() => ShSignInState();
}

class ShSignInState extends State<ShSignIn> {
  var emailCont = TextEditingController();
  var passwordCont = TextEditingController();
  var phoneNumberCont = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: customAppBar(
        context,
        "Login",
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
      body: Container(
        height: height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        decoration: boxDecoration(showShadow: false, bgColor: const Color(0xFFF8F7F7), radius: 8, color: const Color(0xFFDADADA)),
                        padding: EdgeInsets.all(0),
                        child: CountryCodePicker(onChanged: print, showFlag: true, padding: EdgeInsets.all(5)),
                      ),
                      SizedBox(
                        width: spacing_standard_new,
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          autofocus: false,
                          controller: phoneNumberCont,
                          textCapitalization: TextCapitalization.words,
                          style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: sh_editText_background,
                              focusColor: sh_editText_background_active,
                              hintText: sh_hint_last_name,
                              hintStyle: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, width: 0.5)),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.transparent, style: BorderStyle.none, width: 0))),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing_xlarge,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  controller: emailCont,
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: sh_editText_background,
                      focusColor: sh_editText_background_active,
                      hintText: sh_hint_Email,
                      hintStyle: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, width: 0.5)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.transparent, style: BorderStyle.none, width: 0))),
                ),
                SizedBox(
                  height: spacing_standard_new,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  obscureText: true,
                  style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                  controller: passwordCont,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: sh_editText_background,
                      focusColor: sh_editText_background_active,
                      hintStyle: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                      hintText: sh_hint_password,
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, width: 0.5)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.transparent, style: BorderStyle.none, width: 0))),
                ),
                SizedBox(
                  height: spacing_xlarge,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  // height: double.infinity,
                  child: MaterialButton(
                    padding: EdgeInsets.all(spacing_standard),
                    child: text(sh_lbl_sign_in, fontSize: textSizeNormal, fontFamily: fontMedium, textColor: sh_white),
                    textColor: sh_white,
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                    color: sh_colorPrimary,
                    onPressed: () => {
                      ShHomeScreen().launch(context),
                    },
                  ),
                ),
                // SizedBox(height: spacing_standard_new),
                // SizedBox(
                //   width: double.infinity,
                //   height: 50,
                //   // height: double.infinity,
                //   child: MaterialButton(
                //     padding: EdgeInsets.all(spacing_standard),
                //     child: text("Google", fontSize: textSizeNormal, fontFamily: fontMedium, textColor: sh_colorPrimary),
                //     textColor: sh_white,
                //     shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0), side: BorderSide(color: sh_colorPrimary, width: 1)),
                //     color: sh_white,
                //     onPressed: () => {ShSignUp().launch(context)},
                //   ),
                // ),
                // SizedBox(height: spacing_standard_new),
                // SizedBox(
                //   width: double.infinity,
                //   height: 50,
                //   // height: double.infinity,
                //   child: MaterialButton(
                //     padding: EdgeInsets.all(spacing_standard),
                //     child: text("Facebook", fontSize: textSizeNormal, fontFamily: fontMedium, textColor: sh_white),
                //     textColor: sh_white,
                //     shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0), side: BorderSide(color: sh_colorPrimary, width: 1)),
                //     color: sh_colorPrimary,
                //     onPressed: () => {ShSignUp().launch(context)},
                //   ),
                // ),
                SizedBox(
                  height: spacing_xlarge,
                ),
                Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider()
                      ),

                      Text("or connect with your account"),

                      Expanded(
                          child: Divider()
                      ),
                    ]
                ),
                SizedBox(
                  height: spacing_xlarge,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                    primary: sh_semi_white,
                    textStyle: TextStyle(color: sh_colorPrimary,)),
                        onPressed: () {},
                        icon: Icon( // <-- Icon
                          Icons.android_rounded,
                          size: 40.0,
                          color: sh_colorPrimary,
                        ),
                        label: Text('Google', style: TextStyle(color: sh_colorPrimary),), // <-- Text
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon( // <-- Icon
                          Icons.facebook,
                          size: 40.0,
                        ),
                        label: Text('Facebook'), // <-- Text
                      ),
                    ]
                ),

                SizedBox(
                  height: spacing_xlarge,
                ),
                InkWell(
                  onTap: () {
                    ShSignUp().launch(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      text("Don't have an account?"),
                      text(sh_lbl_sign_up, textColor: sh_textColorPrimary, fontFamily: fontBold),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
