import 'package:flutter/material.dart';
import 'package:operator_forvia/dashboard.dart';
import 'package:operator_forvia/style/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forvia Dashboard',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.primaryBg),
      home: Dashboard(),
    );
  }
}
