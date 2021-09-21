import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meru_app/widgets.dart';

void main() {
  runApp(MeruApp());
}

class MeruApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Meru Marketplace',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        fontFamily: 'Apercu Pro',
        primaryColor: Colors.white,
        accentColor: Color(0xff03bfb6),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 18.0),
        ),
        dividerColor: Colors.transparent,
      ),
      home: Container(
        color: Color(0xfff1f5f9),
        child: SafeArea(
          child: MeruScaffold(),
        ),
      ),
    );
  }
}
