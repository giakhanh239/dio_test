import 'package:flutter/material.dart';
import 'package:flutter_app_dio_test/ui/home_screen/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:Home() ,
    );
  }
  
}
