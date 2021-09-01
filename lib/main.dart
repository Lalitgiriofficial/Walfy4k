import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:walfy4k/Utils/MyThemes.dart';
import 'package:walfy4k/pages/homepage.dart';

void main() {
  runApp(MyApp());
 SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.LightTheme(context),
        home: HomePage());
  }
}
