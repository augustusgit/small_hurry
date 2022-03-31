import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/main/utils/AppColors.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/shopHop/models/ShCategory.dart';
import 'package:small_hurry/shopHop/models/ShProduct.dart';
import 'package:small_hurry/shopHop/screens/product_detail.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShExtension.dart';
import 'package:small_hurry/shopHop/utils/ShWidget.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';

class CategorySubScreen extends StatefulWidget {
  const CategorySubScreen({Key? key}) : super(key: key);

  @override
  _CategorySubScreenState createState() => _CategorySubScreenState();
}

class _CategorySubScreenState extends State<CategorySubScreen> with TickerProviderStateMixin {

  List<ShCategory> list = [];
  List<String> banners = [];
  List<ShProduct> newestProducts = [];
  List<ShProduct> featuredProducts = [];
  var position = 0;
  var colors = [sh_cat_1, sh_cat_2, sh_cat_3, sh_cat_4, sh_cat_5, sh_cat_3, sh_cat_1,];

  @override
  void initState() {
    super.initState();
    fetchData();
  }


  fetchData() async {
    loadCategory().then((categories) {
      setState(() {
        list.clear();
        list.addAll(categories);
      });
    }).catchError((error) {
      toast(error);
    });
    List<ShProduct> products = await loadProducts();
    List<ShProduct> featured = [];
    products.forEach((product) {
      if (product.featured!) {
        featured.add(product);
      }
    });
    List<String> banner = [];
    for (var i = 1; i < 4; i++) {
      banner.add("images/shophop/img/products/banners/b" + i.toString() + ".png");
    }
    setState(() {
      newestProducts.clear();
      featuredProducts.clear();
      banners.clear();
      banners.addAll(banner);
      newestProducts.addAll(products);
      featuredProducts.addAll(featured);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  List title=[
    {"text": "Places"},
    {"text": "Inspiraction"},
    {"text": "Emotion"},
    {"text": "Pride"},
    {"text": "Grocery"},
    {"text": "Workshop"},
    {"text": "Wisdom"}
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: title.length, vsync: this);
    return Scaffold(
      appBar: customAppBar(
        context,
        "Small Hurry",
        showBack: true,
        isImage: true,
        actions: [
          cartIcon(context, 5, iconColor: appWhite),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: Theme.of(context).cardColor,
                      child: TabBar(
                            labelPadding: const EdgeInsets.only(left: 20, right: 20),
                            controller: _tabController,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: appLight_parrot_green,
                            isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.label,
                            // indicator:
                            // CircleTabIndicator(color: appColorPrimary, radius: 4),
                            tabs: List.generate(title.length, (index) => _HurryTabWidget(title: title[index]['text']))

                        ),
                    ),

                    ),
                  ),
              ],
            ),

            Row(
              children: <Widget> [
                Flexible(child: Card(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 60,
                    width: double.maxFinite,
                    // color: appLayout_background,
                    child: TabBarView(
                      controller: _tabController,
                      children: List.generate(title.length, (index) => LoadSubCategory(categoryid: "57",)),
                    ),
                  ),
                ),)
              ],
            ),

            GridView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 11, right: 11, top: spacing_standard_new),
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 9 / 12),
              scrollDirection: Axis.vertical,
              controller: ScrollController(keepScrollOffset: false),
              itemBuilder: (context, index) {

                return Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    InkWell(
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail()));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black12,
                            ),
                          ),
                                child: networkImage(list[index].image!, aWidth: double.infinity, fit: BoxFit.cover).cornerRadiusWithClipRRect(8)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget> [
                              itemTitle(context, "₦867", textColor: Theme.of(context).highlightColor, fontSize: 14.0, lineThrough: true),
                              itemTitle(context, "₦456"),
                            ],
                          ),
                          itemSubTitle(context, list[index].name, colorThird: true),
                          const Text('200g', style: TextStyle(color: Colors.grey, fontSize: 10,),)
                        ],
                      ),
                    ).paddingOnly(left: 5, right: 5, bottom: spacing_standard_new),
                    // Positioned(
                    //   top: 0,
                    //   right: 0,
                    //   child: Container(
                    //     width: 40,
                    //     height: 40,
                    //     child: Card(
                    //       semanticContainer: true,
                    //       child: IconButton(
                    //         highlightColor: appLayout_background,
                    //         focusColor: appLayout_background,
                    //         icon: Icon(
                    //           Icons.add,
                    //         ),
                    //         onPressed: () {
                    //           //statements
                    //           print('IconButton is pressed');
                    //         },
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                );
              },
            ),

          ],
        ),
      ),
    );
  }

}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required Color this.color, required double this.radius});
  //override createBoxPainter

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }

}

class _CirclePainter extends BoxPainter {

  final double radius;
  late Color color;

  _CirclePainter({required this.color, required this.radius});

//override paint
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
      late Paint _paint;
      _paint = Paint()..color = color;
      _paint = _paint..isAntiAlias = true;
      final Offset circleOffset = offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
      canvas.drawCircle(circleOffset, radius, _paint);
  }
}


class _HurryTabWidget extends StatelessWidget {

  _HurryTabWidget({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 13),),
    );
  }
}

class LoadSubCategory extends StatefulWidget {
  LoadSubCategory({Key? key, required this.categoryid}) : super(key: key);

  String categoryid;

  @override
  _LoadSubCategoryState createState() => _LoadSubCategoryState();
}

class _LoadSubCategoryState extends State<LoadSubCategory> {

  int _selectedIndex = 0;
  List info=[
    {"img": "Club"},
    {"img": "room"},
    {"img": "BBQ"},
    {"img": "Love"},
    {"img": "Hotels"},
    {"img": "Wines"},
    {"img": "Phones"},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.builder(
                    itemCount: info.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5, 3, 10, 10),
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: ListTile(
                              title: Text(info[index]['img']),
                              selectedTileColor:Theme.of(context).primaryColor,
                              selectedColor: Theme.of(context).dividerColor,
                              minLeadingWidth: double.maxFinite,
                              selected: index == _selectedIndex,
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    }),
        ),
      ],
    );
  }
}



