import 'package:flutter/material.dart';


class InputField extends StatelessWidget {

  InputField({this.icon,this.hint, this.obscure});

  final IconData icon;
  final String hint;
  final bool obscure;
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(this.icon, color: Color.fromARGB(255, 255, 122, 0),),
        hintText: this.hint,
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),  
        contentPadding: EdgeInsets.only(
          left: 5.0,
          right: 30.0,
          bottom: 30.0,
          top: 30.0
        )
      ),      
      style:  TextStyle(color: Colors.white),
      obscureText: this.obscure,
    );
  }
}