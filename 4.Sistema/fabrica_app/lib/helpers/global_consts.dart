import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TODO: LEVA TODAS AS VARIAVES DE USO COMUM E PERSONALISAÇÃO, COMO CORES DE TEMAS, ANGULOS, MEDIDAS E ETC. CENTRALIZAR TAIS TIPO PARA DIMINUIR IMPACTOS NA ARQUITETURA.
class GlobalConst {
  //constant public themes
  static const PrimarySwatch = Colors.blue;
  static const PrimaryColor = Color.fromARGB(255, 4, 125, 141);

  //constant public Home
  static const HomeTitle = "Descomplica Hospedagem";
  static const List<Color> ListOfColorsHome = [
    Color.fromARGB(255, 211, 118, 130),
    Color.fromARGB(255, 253, 181, 168),
    ];

}