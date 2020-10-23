import 'package:flutter/material.dart';
import 'package:frabicaapp/helpers/global_consts.dart';
import 'package:frabicaapp/screns/logim_screen.dart';

void main() => runApp(new Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Factory",
      theme: ThemeData(
          primarySwatch: GlobalConst.PrimarySwatch,
          primaryColor: GlobalConst.PrimaryColor),
      debugShowCheckedModeBanner: false,
      home: LogimScreen(),
    );
  }
}
