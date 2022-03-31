import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/main.dart';
import 'package:small_hurry/main/utils/AppColors.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/main/utils/codePicker/country_code_picker.dart';
import 'package:small_hurry/shopHop/screens/ShHomeScreen.dart';
import 'package:small_hurry/shopHop/screens/ShSignIn.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShImages.dart';
import 'package:small_hurry/shopHop/utils/ShStrings.dart';

class ShSignUp extends StatefulWidget {
  static String tag = '/ShSignUp';

  @override
  ShSignUpState createState() => ShSignUpState();
}

class ShSignUpState extends State<ShSignUp> {
  var emailCont = TextEditingController();
  var passwordCont = TextEditingController();
  var confirmPasswordCont = TextEditingController();
  var phoneNumberCont = TextEditingController();
  var fullNameCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: customAppBar(
        context,
        "Register",
        showBack: true,
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
      body: SingleChildScrollView(
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
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, style: BorderStyle.solid, width: 0))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                controller: fullNameCont,
                textCapitalization: TextCapitalization.words,
                style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: sh_editText_background,
                    focusColor: sh_editText_background_active,
                    hintText: sh_hint_first_name,
                    hintStyle: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, width: 0.5)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, style: BorderStyle.solid, width: 0))),
              ),
              SizedBox(
                height: spacing_standard_new,
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
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, style: BorderStyle.solid, width: 0))),
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
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, style: BorderStyle.solid, width: 0))),
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: false,
                obscureText: true,
                style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                controller: confirmPasswordCont,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: sh_editText_background,
                    focusColor: sh_editText_background_active,
                    hintStyle: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                    hintText: sh_hint_confirm_password,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, width: 0.5)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, style: BorderStyle.solid, width: 0))),
              ),
              SizedBox(
                height: spacing_xlarge,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: spacing_standard),
                child: text("Please click here to review our Privacy Notice \n regarding your personal data", textColor: appTextColorSecondary, fontSize: textSizeSMedium, maxLine: 6, isLongText: true),
              ),

              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: spacing_standard_new),
                child: text("By becoming a member, you accept our Terms and \n Conditions.", textColor: appTextColorSecondary, maxLine: 6, fontSize: textSizeSMedium, isLongText: true),
              ),
              SizedBox(
                width: double.infinity,
                // height: double.infinity,
                height: 50,
                child: MaterialButton(
                  padding: EdgeInsets.all(spacing_standard),
                  child: text(sh_lbl_sign_up, fontSize: textSizeNormal, fontFamily: fontMedium, textColor: sh_white),
                  textColor: sh_white,
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  color: appLight_bitter_lemon,
                  onPressed: () => {Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ShHomeScreen()))},
                ),
              ),
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
                          primary: appColorPrimaryLight,
                          textStyle: TextStyle(color: sh_colorPrimary,)),
                      onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ShHomeScreen()));},
                      icon: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset('images/shophop/gsignin.png', width: 35, height: 35,),
                      ),
                      label: Text('Google', style: TextStyle(color: appTextColorSecondary),), // <-- Text
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: appLight_facebook_blue,
                          textStyle: TextStyle(color: sh_colorPrimary,)),
                      onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ShHomeScreen()));},
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
                  ShSignIn().launch(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    text(sh_lbl_already_have_a_account),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: text(sh_lbl_sign_in, textColor: sh_textColorPrimary, fontFamily: fontBold),
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
