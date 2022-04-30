import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:small_hurry/integrations/network/rest_apis.dart';
import 'package:small_hurry/main/utils/AppColors.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/shopHop/models/category_sub_category.dart';
import 'package:small_hurry/shopHop/models/product.dart';
import 'package:small_hurry/shopHop/screens/product_detail.dart';
import 'package:small_hurry/shopHop/utils/ShWidget.dart';

import '../utils/ShConstant.dart';

class CategorySubScreen extends StatefulWidget {
  const CategorySubScreen({Key? key}) : super(key: key);

  @override
  _CategorySubScreenState createState() => _CategorySubScreenState();
}

class _CategorySubScreenState extends State<CategorySubScreen> with TickerProviderStateMixin {

  CategorySubCategory? categories;
  Product? products;
  bool isLoading = true;
  var position = 0;

  @override
  void initState() {
    super.initState();
    loadCategories();
    loadProducts();
  }



  loadCategories() async {
    CategorySubCategory category = await getCategories();

    setState(() {
      categories = category;
      if(categories != null) {
        isLoading = false;
      }
    });
    print(category);
  }

  loadProducts() async {
    Product product = await getProducts();

    setState(() {
      products = product;
      if(products != null) {
        isLoading = false;
      }
    });
    print(product);
  }

  // @override
  // void setState(fn) {
  //   if (mounted) super.setState(fn);
  // }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: categories != null ? categories!.data!.length : 15, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        context,
        "Small Hurry",
        showBack: true,
        isImage: true,
        actions: [
          cartIcon(context, 5, iconColor: appWhite),
        ],
      ),
      body: categories != null ? SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 50,
                      color: appLight_bitter_lemon, //Theme.of(context).cardColor,
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
                            tabs: List.generate(categories!.data!.length, (index) => _HurryTabWidget(title: categories!.data![index].category!.name!)),

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
                      children: List.generate(categories!.data!.length, (index) => LoadSubCategory(key: ObjectKey(index),subCategoryObj: categories!.data![index].subCategories!), growable: true),
                    ),
                  ),
                ),)
              ],
            ),

            products != null ? GridView.builder(
              itemCount: 1,
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
                         Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetail()));
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
                                child: networkImage(products!.data!.defaultImage!, aWidth: double.infinity, fit: BoxFit.cover).cornerRadiusWithClipRRect(8)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget> [
                              itemTitle(context, "₦${products!.data!.originalPrice}", textColor: Theme.of(context).highlightColor, fontSize: 10.0, lineThrough: true),
                              itemTitle(context, "₦${products!.data!.realPrice}", fontSize: 12.0,),
                            ],
                          ),
                          itemSubTitle(context, products!.data!.productName, colorThird: true),
                           Text(products!.data!.attributes!.first.attributeValName!, style: TextStyle(color: Colors.grey, fontSize: 10,),)
                        ],
                      ),
                    ).paddingOnly(left: 5, bottom: spacing_standard_new),
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
            ) : const Center(child: CircularProgressIndicator(color: appColorPrimary)),

          ],
        ),
      ) : const Center(child: CircularProgressIndicator(color: appColorPrimary)),
    );
  }

  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();
  }


  void _onTabChanged() {
    setState(() { });
  }
}



class _HurryTabWidget extends StatelessWidget {

  _HurryTabWidget({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 13),),
    );
  }
}

class LoadSubCategory extends StatefulWidget {
  const LoadSubCategory({required Key key, required this.subCategoryObj}) : super(key: key);

  final List<SubCategories> subCategoryObj;

  @override
  _LoadSubCategoryState createState() => _LoadSubCategoryState();
}

class _LoadSubCategoryState extends State<LoadSubCategory> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.builder(
                    itemCount: widget.subCategoryObj.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return Container(
                        alignment: Alignment.center,
                        width: 120.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(widget.subCategoryObj[index].name!),
                              ],
                            ),
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
                      );
                    }),
        ),
      ],
    );
  }
}



