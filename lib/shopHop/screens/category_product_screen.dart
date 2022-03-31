import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';
import 'package:small_hurry/shopHop/utils/widgets/segmented_widget.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class CategoryProductScreen extends StatefulWidget {
  const CategoryProductScreen({Key? key}) : super(key: key);

  @override
  _CategoryProductScreenState createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {

  int _index = 0;
  int? groupValue = 0;
  int _currentSelection = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        "Small Hurry",
        showBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: SegmentedWidget(
                onChanged: (i) {
                  setState(() => _index = i);
                },
                index: _index,
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).secondaryHeaderColor,
                children: [
                  Text('Text'),
                  Icon(Icons.thumb_up, size: 32),
                  Column(
                    children: <Widget>[
                      Text('Hello', textScaleFactor: 0.8),
                      Text('World', textScaleFactor: 1.25),
                    ],
                  ),
                  FlutterLogo(),
                  Text('Hello'),
                  Text('World'),
                ],
              ),
            ),

            Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: CupertinoSlidingSegmentedControl<int>(
                backgroundColor:  CupertinoColors.white,
                thumbColor: Theme.of(context).secondaryHeaderColor,
                padding: EdgeInsets.all(8),
                groupValue: groupValue,
                children: {
                  0: buildSegment("Promotions"),
                  1: buildSegment("Announcements"),
                },
                onValueChanged: (value){
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
            ),

            MaterialSegmentedControl(
              children: _children,
              selectionIndex: _currentSelection,
              borderColor: Colors.grey,
              selectedColor: Colors.redAccent,
              unselectedColor: Colors.white,
              borderRadius: 8.0,
              disabledChildren: _disabledIndices,
              onSegmentChosen: (int index) {
                setState(() {
                  _currentSelection = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSegment(String text){
    return Container(
      child: Text(text,style: TextStyle(fontSize: 22,
          color: Colors.black),),
    );
  }

  List<int> _disabledIndices = [];

  int _randomInt() {
    return Random.secure().nextInt(_children.length);
  }

  Map<int, Widget> _children = {
    0: Text('Hummingbird'),
    1: Text('Kiwi'),
    2: Text('Rio'),
    3: Text('Telluraves')
  };
}
