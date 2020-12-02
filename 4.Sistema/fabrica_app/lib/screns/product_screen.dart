import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:frabicaapp/datas/product_data.dart';
import 'package:frabicaapp/screns/home_scren.dart';

enum TipoData { dataInicio, dataFim }

class ProductScreen extends StatefulWidget {
  final ProductData product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;
  _ProductScreenState(this.product);
  final _scfoldKey = GlobalKey<ScaffoldState>();
  DateTime datafim = null;
  DateTime dataInicio = null;
  double _price;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      key: _scfoldKey,
      appBar: AppBar(
        title: Text(this.product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: this
                  .product
                  .images
                  .map((urlImages) => NetworkImage(urlImages))
                  .toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  this.product.title,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${this._price != null ? this._price.toStringAsFixed(2) : this.product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Data",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 55.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.5),
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          DateTime datePick = await showDatePicker(
                              context: context,
                              initialDate: new DateTime.now(),
                              firstDate: new DateTime(2018),
                              lastDate: new DateTime(2022));
                          setState(() {
                            this.dataInicio = datePick;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              border: Border.all(
                                  color: this.dataInicio != null
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey[500],
                                  width: 3.0)),
                          width: 50.0,
                          alignment: Alignment.center,
                          child: Text(
                            this.dataInicio != null
                                ? this.dataInicio.toString()
                                : "Data Inicio",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                            maxLines: 1,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          DateTime datePick = await showDatePicker(
                              context: context,
                              initialDate: new DateTime.now(),
                              firstDate: new DateTime(2018),
                              lastDate: new DateTime(2022));
                          setState(() {
                            if (this.dataInicio != null &&
                                this.dataInicio.compareTo(datePick) < 0) {
                              this.datafim = datePick;
                              this._price = this.product.price *
                                  datePick.difference(this.dataInicio).inDays;
                            } else {
                              this.datafim = null;
                              this
                                  ._scfoldKey
                                  .currentState
                                  .showSnackBar(SnackBar(
                                    content: Text(
                                        "Data Fim não pode ser menor que inicial"),
                                    backgroundColor: Colors.redAccent,
                                    duration: Duration(seconds: 2),
                                  ));
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              border: Border.all(
                                  color: this.datafim != null
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey[500],
                                  width: 3.0)),
                          width: 50.0,
                          alignment: Alignment.center,
                          child: Text(
                            this.datafim != null
                                ? this.datafim.toString()
                                : "Data Fim",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ], //todo: parte da data
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: this.dataInicio != null && this.datafim != null
                        ? () async {
                             
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                          }
                        : null,
                    child: Text("Adicionar ao Carrinho",
                        style: TextStyle(fontSize: 18.0)),
                    color: primaryColor,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Descrição",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                Text(this.product.description, style: TextStyle(fontSize: 16.0))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
