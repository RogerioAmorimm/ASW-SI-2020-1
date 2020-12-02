import 'package:flutter/material.dart';
import 'package:frabicaapp/Tabs/DrawerTileTab.dart';
import 'package:frabicaapp/helpers/login_helper.dart';
import 'package:frabicaapp/screns/logim_screen.dart';
import 'package:scoped_model/scoped_model.dart';

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
    final primaryColor = Theme.of(context).accentColor;

    return Drawer(
        child: Stack(
      children: <Widget>[
        _bildDrawerBack(),
        ListView(
          padding: EdgeInsets.only(left: 32.0, top: 16.0),
          children: <Widget>[
            Container(
              height: 210.0,
              padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
              margin: EdgeInsets.only(bottom: 8.0),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 8.0,
                    left: 0.0,
                    child: Text(
                      "Descomplica \nHospedagem",
                      style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                      left: 20.0,
                      bottom: 5.0,
                      child: ScopedModelDescendant<LoginHelper>(
                        builder: (context, child, model) {
                          return Column(
                            children: <Widget>[
                              Icon(
                                Icons.supervised_user_circle,
                                size: 50.0,
                                color: primaryColor,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Olá ${model.isLoggedIn() ? model.userData["name"] : ""}",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                              GestureDetector(
                                child: Text(
                                  model.isLoggedIn()
                                      ? "Sair "
                                      : "Entre ou Cadastre-se >",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  if (!model.isLoggedIn()){
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ));}else{
                                    model.signOut();
                                  }
                                },
                              ),
                            ],
                          );
                        },
                      ))
                ],
              ),
            ),
            //TODO:arrumar o DrawerTileTab
            Divider(),
            DrawerTileTab(Icons.home, "Inicio", this.pageController, 0),
            DrawerTileTab(Icons.list, "Produtos", this.pageController, 1),
            DrawerTileTab(Icons.playlist_add_check, "Meus Pedidos",
                this.pageController, 2),
          ],
        ),
      ],
    ));
  }
}
