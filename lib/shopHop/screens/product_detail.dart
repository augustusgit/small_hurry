import 'package:flutter/material.dart';
import 'package:small_hurry/main/utils/AppColors.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShWidget.dart';
import 'package:small_hurry/shopHop/utils/widgets/accordion.dart';



class ProductDetail extends StatefulWidget {

  const ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  var position = 0;


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    var sliderImages = Container(
      height: 380,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Image.asset("images/shophop/img/products/shoes.jpeg" , width: width, height: width * 1.05, fit: BoxFit.cover);
        },
        onPageChanged: (index) {
          position = 4;
          setState(() {});
        },
      ),
    );

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              changeStatusColor(innerBoxIsScrolled ? Colors.white : Colors.transparent);
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 460,
                  floating: false,
                  pinned: true,
                  titleSpacing: 0,
                  backgroundColor: sh_white,
                  iconTheme: IconThemeData(color: sh_textColorPrimary),
                  actionsIconTheme: IconThemeData(color: sh_textColorPrimary),
                  actions: <Widget>[
                    Container(
                      padding: EdgeInsets.all(spacing_standard),
                      margin: EdgeInsets.only(right: spacing_standard_new),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.1)),
                      child: Icon(Icons.favorite_border, color: sh_textColorPrimary, size: 18),
                    ),
                    cartIcon(context, 3)
                  ],
                  title: text(innerBoxIsScrolled ? "Giovanni Shoes" : "", textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontMedium),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: <Widget>[
                        sliderImages,
                        itemTitle(context, "₦456"),
                        itemSubTitle(context, "Fillz Spaghetti Patsa", colorThird: true),
                        const Text('200g', style: TextStyle(color: Colors.grey, fontSize: 10,),)
                      ],
                    ),
                    collapseMode: CollapseMode.pin,
                  ),
                ),

              ];
            },
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only( left: 10,top: 8.0),
                  child: Text('Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  color: iconColorSecondary,
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                ),
                Accordion(
                  title: 'Attribute Data',
                  content:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam bibendum ornare vulputate. Curabitur faucibus condimentum purus quis tristique.',
                ),
                Container(
                  padding: EdgeInsets.only( left: 10,top: 8.0),
                  child: Text('Recommended Products', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  color: iconColorSecondary,
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Card(
                      semanticContainer: true,
                      child: IconButton(
                        highlightColor: appLayout_background,
                        focusColor: appLayout_background,
                        icon: Icon(
                          Icons.add,
                        ),
                        onPressed: () {
                          //statements
                          print('IconButton is pressed');
                        },
                      ),
                    ),
                    Card(
                      color: appColorPrimary,
                      child: Text('2', style: TextStyle(color: Colors.white)),
                    ),
                    Card(
                      semanticContainer: true,
                      child: IconButton(
                        highlightColor: appLayout_background,
                        focusColor: appLayout_background,
                        icon: Icon(
                          Icons.add,
                        ),
                        onPressed: () {
                          //statements
                          print('IconButton is pressed');
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
