import 'package:flutter/material.dart';
import 'package:small_hurry/main/utils/AppColors.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShImages.dart';
import 'package:small_hurry/shopHop/utils/ShStrings.dart';

class ShProfileFragment extends StatefulWidget {
  static String tag = '/ShProfileFragment';

  @override
  ShProfileFragmentState createState() => ShProfileFragmentState();
}

class ShProfileFragmentState extends State<ShProfileFragment> {
  var emailCont = TextEditingController();
  var passwordCont = TextEditingController();
  var confirmPasswordCont = TextEditingController();
  var firstNameCont = TextEditingController();
  var lastNameCont = TextEditingController();
  String? selectedValue = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // child: Center(child: Text("Coming Soon", style: TextStyle(fontWeight: FontWeight.w900),)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: appColorPrimary,
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(spacing_standard_new),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: spacing_standard,
                        margin: EdgeInsets.all(spacing_control),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(ic_user),
                            radius: 55,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(spacing_control),
                      margin: EdgeInsets.only(bottom: 30, right: 20),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: sh_white, border: Border.all(color: sh_colorPrimary, width: 1)),
                      child: Icon(
                        Icons.camera_alt,
                        color: sh_colorPrimary,
                        size: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                  ],
                ),
              ),
            ),
            //
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  width: double.infinity,
                  height: 80,
                  // color: appColorPrimary,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(35.0),),
                    color: appColorPrimary,
                  ),
                  child: Center(child: Column(
                    children: [
                      Text('Oluseyi Famade', style: TextStyle(fontWeight: FontWeight.bold, color: appColorPrimaryLight),),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('080683374534', style: TextStyle(fontWeight: FontWeight.normal, color: appColorPrimaryLight),),
                            Text('|', style: TextStyle(fontWeight: FontWeight.bold, color: appColorPrimaryLight),),
                            Text('famadeoluseyi@gmail.com', style: TextStyle(fontWeight: FontWeight.normal, color: appColorPrimaryLight),),
                          ],
                        ),
                      ),
                    ],
                  )),

                ),

                Center(
                  child: Container(
                    padding: EdgeInsets.all(spacing_standard),
                    margin: EdgeInsets.only(top: 55.00,),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: sh_white, border: Border.all(color: sh_colorPrimary, width: 3)),
                    child: Icon(
                      Icons.mode_edit,
                      color: sh_colorPrimary,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),



            ListTile(
                leading: const Icon(Icons.shopping_basket),
                title: const Text("My Orders", style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () => print("My Orders")
            ),
            ListTile(
                leading: const Icon(Icons.location_on_outlined),
                title: const Text("Manage Address", style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () => print("Manage Address")
            ),
            ListTile(
                leading: const Icon(Icons.monitor_heart_rounded),
                title: const Text("Wishlist", style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () => print("Wishlist")
            ),
            ListTile(
                leading: const Icon(Icons.doorbell_outlined),
                title: const Text("Notification", style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () => print("Notification")
            ),
            const Divider(
              height: 10,
              thickness: 2,
              color: Colors.blueGrey,
            ),

            ListTile(
                leading: const Icon(Icons.live_help_sharp),
                title: const Text("Help", style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () => print("Help")
            ),
            ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Change Password", style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () => print("Change password")
            ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout", style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () => print("Logout")
            ),
          ],
        ),
      ),
    );
  }
}
