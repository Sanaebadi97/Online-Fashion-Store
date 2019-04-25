import 'package:Sana_Shop/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.pinkAccent, // navigation bar color
    statusBarColor: Colors.pinkAccent, // status bar color
  ));

  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.pinkAccent
    ),
  ));
}
