import 'package:flutter/material.dart';
import 'package:swd_test_3_2/screens/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        backgroundColor: Colors.grey.shade300
      ),
      home:Home(),
    );
  }
}
