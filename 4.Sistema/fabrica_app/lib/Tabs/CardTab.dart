import 'package:flutter/material.dart';
import 'package:frabicaapp/helpers/opcoes.dart';

class CardTab extends StatelessWidget {
  CardTab({this.opcao});

  final Opcao opcao;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10.0),
        elevation: 20.0,     
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
        color: Color.fromARGB(255, 255, 122, 0),
          child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                this.opcao.icon,
                size: 70.0,
                color: Colors.white,
              ),
              Text(this.opcao.title, style: TextStyle(color: Colors.white),)
            ],
          ),
        ));
  }
}
