import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/main/utils/AppColors.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShStrings.dart';
import 'package:small_hurry/shopHop/utils/widgets/search_address_bar.dart';

import '../../integrations/utils/constants.dart';


class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  var addressCont = TextEditingController();
  bool? checkedValue = false;
  bool? checkedValue1 = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var bottomButtons = Container(
      height: 65,
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: sh_shadow_color, blurRadius: 10, spreadRadius: 2, offset: Offset(0, 3))], color: sh_white),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              child: Container(
                child: text('Order and Pay', textColor: sh_white, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
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
                text("₦70", textColor: sh_textColorPrimary, fontFamily: fontBold, fontSize: textSizeLargeMedium),
              ],
            ),
          ),

        ],
      ),
    );

    return Scaffold(
      appBar: customAppBar(
        context,
        "Small Hurry",
        showBack: true,
        isImage: true,
      ),

      body: Container(
        height: height,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.only(bottom: 70),
                child: Column(
                  children: [
                    const SearchAddressBar(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ListTile(
                          // leading: const Icon(Icons.shopping_basket),
                          title: const Text("Add a note", style: TextStyle(fontWeight: FontWeight.bold),),
                          onTap: () => print("addnote")
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              controller: addressCont,
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
                              textInputAction: TextInputAction.next,
                              validator: (s) {
                                if (s!.isEmpty) return 'Field is required';
                                if (!s.isDigit()) return 'Please enter valid data';
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: <Widget> [
                            Checkbox(
                              value: checkedValue1,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValue1 = newValue;
                                });
                              }, //  <-- leading Checkbox
                            ),
                            Text('Contact Address'),
                            Checkbox(
                              value: checkedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValue = newValue;
                                });
                              }, //  <-- leading Checkbox
                            ),
                            Text('Home Address'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ListTile(
                        // leading: const Icon(Icons.shopping_basket),
                          title: const Text("Payment Method", style: TextStyle(fontWeight: FontWeight.bold),),
                          onTap: () => print("add")
                      ),
                    ),

                    Container(
                      height: 60,
                      width: screenWidth,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget> [
                            // Icon(Icons.tab_unselected_outlined),
                            SizedBox(width: 10.0,),
                            Image.asset('images/shophop/card1.png', width: 40.0, ),
                            Column(
                              children: const [
                                SizedBox(height: 8,),
                                Text('Yakubu Zaki'),
                                Text('5133760912386482', style: TextStyle(fontSize: 10),),
                              ],
                            ),
                            ElevatedButton(
                                child: Text(
                                    "Change card",
                                    style: TextStyle(fontSize: 10)
                                ),
                                style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all<Color>(appLight_bitter_lemon),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                            side: BorderSide(color: appLight_bitter_lemon)
                                        )
                                    )
                                ),
                                onPressed: () => null
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 1),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: ListTile(
                            leading: Card(child: Icon(Icons.add, color: appColorPrimary,)),
                            title: Text('Add Payment Card',style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ListTile(
                        // leading: const Icon(Icons.shopping_basket),
                          title: const Text("Payment Summary", style: TextStyle(fontWeight: FontWeight.bold),),
                          onTap: () => print("add")
                      ),
                    ),
                    Container(
                      height: 60,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 1),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: ListTile(
                          leading: Icon(Icons.shopping_bag, color: appColorPrimary),
                          title: Text('Choose your promo',style: TextStyle(fontWeight: FontWeight.bold),),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),

                    Container(
                      height: 60,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 1),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: ListTile(
                          leading: Card(child: Icon(Icons.add,color: appColorPrimary,)),
                          title: Text('Add Invoice Details',style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),

                    Container(
                      height: 60,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 1),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: ListTile(
                          leading: Text('Product Total',style: TextStyle(fontWeight: FontWeight.bold),),
                          trailing: Text('₦1200,00',style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),

                    Container(
                      height: 60,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 1),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: ListTile(
                          leading: Text('Delivery Fee',style: TextStyle(fontWeight: FontWeight.bold),),
                          trailing: Text('₦500,00',style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),

                    Container(
                      height: 60,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 1),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: ListTile(
                          leading: Text('VAT',style: TextStyle(fontWeight: FontWeight.bold),),
                          trailing: Text('₦200,00',style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),

                    Container(
                      height: 60,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 1),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: ListTile(
                          leading: Text('Total',style: TextStyle(fontWeight: FontWeight.bold,color: appColorPrimary),),
                          trailing: Text('₦1200,00',style: TextStyle(fontWeight: FontWeight.bold, color: appColorPrimary),),
                        ),
                      ),
                    ),
                    Divider(),

                    Container(
                      height: 30,
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Image.asset('images/shophop/card1.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Image.asset('images/shophop/card2.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Image.asset('images/shophop/card3.png'),
                          ),
                        ],
                      ),
                    ),

                  ],
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
