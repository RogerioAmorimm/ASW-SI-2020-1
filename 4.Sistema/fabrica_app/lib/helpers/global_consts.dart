import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frabicaapp/helpers/opcoes.dart' ;

//TODO: LEVA TODAS AS VARIAVES DE USO COMUM E PERSONALISAÇÃO, COMO CORES DE TEMAS, ANGULOS, MEDIDAS E ETC. CENTRALIZAR TAIS TIPO PARA DIMINUIR IMPACTOS NA ARQUITETURA.
class GlobalConst {
  //constant public themes
  static const PrimarySwatch = Colors.blue;
  static const PrimaryColor = Color.fromARGB(255, 4, 125, 141);

  //constant public Home
  static const HomeTitle = "Descomplica Hospedagens";
  static const List<Color> ListOfColorsHome = [
 
    Color.fromARGB(255, 82, 135, 163),
    Color.fromARGB(255, 142, 194, 215),
 
  ];

 static const List<Opcao> ListaIcon = [
   const Opcao(title: 'Rendimento', icon: Icons.attach_money),
   const Opcao(title: 'Medicina', icon: Icons.favorite),
   const Opcao(title: 'Farmácia', icon: Icons.healing),
   const Opcao(title: 'Afazeres', icon: Icons.assignment),
   const Opcao(title: 'Paciente', icon: Icons.accessibility_new),
   const Opcao(title: 'Conta', icon: Icons.account_circle),
 ]; 


 
}
