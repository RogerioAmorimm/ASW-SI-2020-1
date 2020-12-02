import 'package:flutter/material.dart';
import 'package:frabicaapp/helpers/global_consts.dart';
import 'package:frabicaapp/helpers/login_helper.dart';
import 'package:frabicaapp/screns/home_scren.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(new Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<LoginHelper>(
      model: LoginHelper(),
      child: MaterialApp(
        title: "Factory",
        theme: ThemeData(
            primarySwatch: GlobalConst.PrimarySwatch,
            primaryColor: GlobalConst.PrimaryColor),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
