import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:small_hurry/main/store/AppStore.dart';
import 'package:small_hurry/main/utils/AppTheme.dart';
import 'package:small_hurry/shopHop/screens/ShSplashScreen.dart';

AppStore appStore = AppStore();
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ShSplashScreen(),
        theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
      ),
    );
  }
}

