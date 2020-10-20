import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frabicaapp/Tabs/Drawer_tab.dart';
import 'package:frabicaapp/Tabs/Home_tab.dart';
import 'package:frabicaapp/helpers/global_consts.dart';

class HomeScreen extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final _pageController = PageController();
  
 
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(GlobalConst.HomeTitle, listColors: GlobalConst.ListOfColorsHome),
          drawer: DrawerTab(),
        )
        
      ],
    );
  }
}