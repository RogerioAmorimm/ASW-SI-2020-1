import 'package:flutter/material.dart';

//TODO: refatorar e colocar padrões de projeto
class DrawerTileTab extends StatelessWidget {
  DrawerTileTab(this.icon, this.text, this.pageController, this.page);

  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).accentColor;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          pageController.jumpToPage(page);
        },
        child: Container(
            height: 60.0,
            child: Row(
              children: <Widget>[
                Icon(
                  this.icon,
                  size: 32.0,
                  color: pageController.page == page
                      ? primaryColor
                      : Colors.white,
                ),
                SizedBox(
                  width: 32.0,
                ),
                Text(
                  this.text,
                  style: TextStyle(
                      fontSize: 18.0,
                      color:pageController.page == page
                      ? primaryColor
                      : Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
      ),
    );
  }
}
