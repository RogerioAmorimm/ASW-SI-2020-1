import 'package:flutter/material.dart';
import 'package:frabicaapp/Tabs/ImputTab.dart';
import 'package:frabicaapp/screns/home_scren.dart';

class LogimScreen extends StatefulWidget {
  @override
  _LogimScreenState createState() => _LogimScreenState();
}

class _LogimScreenState extends State<LogimScreen> {
  Widget _bildColorBack() => Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 27, 65, 102),
          Color.fromARGB(255, 82, 135, 163),
          Color.fromARGB(255, 142, 194, 215),
          Color.fromARGB(255, 210, 254, 255),
        ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _bildColorBack(),
            Container(),
            SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(22.0),
              child: Column(
                children: <Widget>[
                 
                  Image(
                    image: AssetImage("images/logo.png"),
                  ),
                  InputField(
                    icon: Icons.person_outline,
                    hint: "Usuário",
                    obscure: false,
                  ),
                  InputField(
                    icon: Icons.lock_outline,
                    hint: "Senha",
                    obscure: true,
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  SizedBox(
                      height: 50.0,
                      width: 100.0,
                      child: RaisedButton(
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        color: Color.fromARGB(255, 255, 122, 0),
                        child: Text("Entrar"),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0) ),
                        
                      )),
                ],
              ),
            )),
          ],
        ));
  }
}
