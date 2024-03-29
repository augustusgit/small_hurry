import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/integrations/network/rest_apis.dart';
import 'package:small_hurry/main/utils/AppColors.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:small_hurry/shopHop/screens/ShHomeScreen.dart';
import 'package:small_hurry/shopHop/screens/ShSignUp.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShStrings.dart';
import 'package:small_hurry/shopHop/utils/prefs.dart';

class ShSignIn extends StatefulWidget {
  static String tag = '/ShSignIn';

  @override
  ShSignInState createState() => ShSignInState();
}

class ShSignInState extends State<ShSignIn> {
  var emailCont = TextEditingController();
  var passwordCont = TextEditingController();
  // var phoneNumberCont = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var autoValidate = false;
  var isLoading = false;
  var emailNode = FocusNode();
  var passwordNode = FocusNode();


  loginIn() async {
    hideKeyboard(context);
    if (formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});

      Map req = {"email": emailCont.text, "password": passwordCont.text, "userMethod": 3, "rememberMe": 1};

      await sendPostRequest(req, '/login').then((value) {
        saveLoggedUserInfo(value['data']['user']['first_name'], value['data']['user']['last_name'], value['data']['user']['phone'], value['data']['user']['email'], value['data']['user']['id'], value['data']['token'], value['data']['user']['image_url']);
        toast(value['message']);
        isLoading = false;
        finish(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShHomeScreen(
        )));
      }).catchError((e) {
        isLoading = false;
        toast(e.toString());
      });
    } else {
      isLoading = false;
      autoValidate = true;
    }

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      blurEffectIntensity: 4,
      progressIndicator: const SpinKitFadingCircle(
        color: appTextColorSecondary,
        size: 90.0,
      ),
      dismissible: false,
      opacity: 0.4,
      color: appColorPrimary,
      child: Scaffold(
        appBar: customAppBar(
          context,
          "Login",
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
        body: Container(
          height: height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: <Widget>[
                    //       Container(
                    //         decoration: boxDecoration(showShadow: false, bgColor: const Color(0xFFF8F7F7), radius: 8, color: const Color(0xFFDADADA)),
                    //         padding: EdgeInsets.all(0),
                    //         child: CountryCodePicker(onChanged: print, showFlag: true, padding: EdgeInsets.all(5)),
                    //       ),
                    //       SizedBox(
                    //         width: spacing_standard_new,
                    //       ),
                    //       Expanded(
                    //         child: TextFormField(
                    //           keyboardType: TextInputType.phone,
                    //           autofocus: false,
                    //           controller: phoneNumberCont,
                    //           textCapitalization: TextCapitalization.words,
                    //           style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                    //           decoration: InputDecoration(
                    //               filled: true,
                    //               fillColor: sh_editText_background,
                    //               focusColor: sh_editText_background_active,
                    //               hintText: sh_hint_last_name,
                    //               hintStyle: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                    //               contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    //               focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, width: 0.5)),
                    //               enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, style: BorderStyle.solid, width: 0))),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
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
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, style: BorderStyle.solid, width: 0))),
                          focusNode: emailNode,
                          onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(passwordNode),
                          textInputAction: TextInputAction.next,
                          validator: (s) {
                            if (s!.isEmpty) return 'Field is required';
                            return null;
                          },
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
                          focusNode: passwordNode,
                          validator: (s) {
                            if (s!.isEmpty) return 'Field is required';
                            return null;
                          },
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
                        color: appLight_bitter_lemon,
                        onPressed: () => {
                          loginIn(),
                        },
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
                            icon: Image.asset('images/shophop/gsignin.png', width: 35, height: 35,),
                            // Icon( // <-- Icon
                            //   Icons.android_rounded,
                            //   size: 40.0,
                            //   color: sh_white,
                            // ),
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
        ),
      ),
    );
  }
}
