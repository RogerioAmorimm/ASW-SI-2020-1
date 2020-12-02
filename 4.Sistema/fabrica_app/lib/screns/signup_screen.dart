import 'package:flutter/material.dart';
import 'package:frabicaapp/helpers/login_helper.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  final _emailController = TextEditingController();
  final _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scafoldKey,
        appBar: AppBar(
          title: Text("Criar Conta"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<LoginHelper>(
          builder: (context, child, model) {
            return model.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Form(
                    key: _formKey,
                    child: ListView(
                      padding: EdgeInsets.all(16.0),
                      children: <Widget>[
                        TextFormField(
                          controller: _nameController,
                          decoration:
                              InputDecoration(hintText: "Nome Completo"),
                          validator: (text) {
                            if (text.isEmpty || text.length < 2)
                              return "Nome invalido";
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(hintText: "E-mail"),
                          keyboardType: TextInputType.emailAddress,
                          validator: (text) {
                            if (text.isEmpty || !text.contains("@"))
                              return "E-mail invalido";
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          controller: _passController,
                          decoration: InputDecoration(hintText: "Senha"),
                          obscureText: true,
                          validator: (text) {
                            if (text.isEmpty || text.length < 6)
                              return "Senha invalida";
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        SizedBox(
                          height: 44.0,
                          child: RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Map<String, dynamic> userData = {
                                  "name": _nameController.text.trim(),
                                  "email": _emailController.text.trim(),
                                };
                                model.signUp(
                                    userData: userData,
                                    pass: _passController.text.trim(),
                                    onSucess: onSucess,
                                    onFail: onFail(model.getErroMSG()));
                              }
                            },
                            child: Text(
                              "Criar Conta",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            textColor: Colors.white,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ));
  }

  onSucess() {
    _scafoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário criado com sucesso"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  onFail(String erro) {
    if (erro != "") {
      _scafoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Falha ao criar usuário  \nError: ${erro}"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ));
    }
  }
}
