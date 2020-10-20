import 'package:flutter/material.dart';

//TODO: refatorar e colocar padrões de projeto
class DrawerTileTab extends StatelessWidget {
  DrawerTileTab(this.icon, this.text);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Container(
            height: 60.0,
            child: Row(
              children: <Widget>[
                Icon(
                  this.icon,
                  size: 32.0,
                  color: Color.fromARGB(255, 255, 122, 0),
                ),
                SizedBox(width: 32.0,),
                Text(
                  this.text,
                  style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            )),
      ),
    );
  }
}
