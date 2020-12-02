import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:frabicaapp/datas/product_data.dart';

class ProductScreen extends StatefulWidget {
  final ProductData product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;
  _ProductScreenState(this.product);
  DateTime datafim = null;
  DateTime dataInicio = null;
  String size;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
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
                  "R\$ ${this.product.price.toStringAsFixed(2)}",
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
                  height: 50.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.5),
                    children: <Widget>[
                      gestureDetectorDate(this.dataInicio, "Data Inicio"),
                      gestureDetectorDate(this.dataInicio, "Data Fim"),
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
                        ? () {}
                        : null,
                    child: Text("Adicionar ao Carrinho",
                        style: TextStyle(fontSize: 18.0)),
                    color: primaryColor,
                    textColor: Colors.white,
                  ),
                ), 
                SizedBox(height: 16.0,),
                Text(
                 "Descrição",
                 style: TextStyle(
                   fontSize: 16.0,
                   fontWeight: FontWeight.w500
                 ), 
                ),
                Text(
                  this.product.description,
                  style: TextStyle(
                    fontSize: 16.0
                  )

                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget gestureDetectorDate(DateTime date, String text) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            border: Border.all(
                color: date != null
                    ? Theme.of(context).primaryColor
                    : Colors.grey[500],
                width: 3.0)),
        width: 50.0,
        alignment: Alignment.center,
        child: Text(
          date != null ? date.toString() : text,
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          maxLines: 1,
        ),
      ),
    );
  }
}
