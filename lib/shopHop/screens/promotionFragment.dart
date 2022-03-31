import 'package:flutter/material.dart';

class PromotionFragment extends StatefulWidget {
  const PromotionFragment({Key? key}) : super(key: key);

  @override
  _PromotionFragmentState createState() => _PromotionFragmentState();
}

class _PromotionFragmentState extends State<PromotionFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Promotion Coming Soon", style: TextStyle(fontWeight: FontWeight.w900),)),);
  }
}
