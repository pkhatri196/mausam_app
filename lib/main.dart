import 'package:flutter/material.dart';
import 'package:mausam_app/Activities/homescreen.dart';
import 'package:mausam_app/Activities/loading.dart';
import 'package:mausam_app/Activities/location.dart';
import './Activities/splash.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home:Loading(),
      routes:{
        "/home":(context) => Home(),
        "/loading":(context)=>Loading(),
      },
  ));
}

