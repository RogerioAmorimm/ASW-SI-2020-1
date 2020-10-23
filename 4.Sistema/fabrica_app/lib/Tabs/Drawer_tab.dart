import 'package:flutter/material.dart';
import 'package:frabicaapp/Tabs/DrawerTileTab.dart';

//TODO: refatorar e colocar padrões de projeto
class DrawerTab extends StatelessWidget {
 
  final PageController pageController;
 
  DrawerTab(this.pageController);
  
  Widget _bildDrawerBack() => Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 82, 135, 163),
          Color.fromARGB(255, 82, 135, 163),
          Colors.white,
        ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
      ));
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(
      children: <Widget>[
        _bildDrawerBack(),
        ListView(
          padding: EdgeInsets.only(left: 32.0, top: 16.0),
          children: <Widget>[
            Container(
              height: 170.0,
              padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
              margin: EdgeInsets.only(bottom: 8.0),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 15.0,
                      left: 0.0,
                      child: Container(
                        child: Image(
                          image: AssetImage("images/logo-nav.png"),
                          width: 250.0,
                          color: Colors.white,
                        ),
                      )),
                  Positioned(
                      left: 60.0,
                      bottom: 10.0,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.supervised_user_circle,
                            size: 55.0,
                            color: Color.fromARGB(255, 255, 122, 0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          GestureDetector(
                            child: Text(
                              "Usuario",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ))
                ],
              ),
            ),
            //TODO:arrumar o DrawerTileTab
            Divider(), 
            DrawerTileTab(Icons.home, "Inicio", this.pageController, 0),
            DrawerTileTab(Icons.list, "Produtos",this.pageController, 1),
            DrawerTileTab(Icons.playlist_add_check, "Meus Pedidos",this.pageController, 2),
          ],
        ),
      ],
    ));
  }
}
