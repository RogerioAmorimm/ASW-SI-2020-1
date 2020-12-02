import 'package:flutter/material.dart';
import 'package:frabicaapp/datas/product_data.dart';
import 'package:frabicaapp/screns/product_screen.dart';

class ProductTile extends StatelessWidget {
  final ProductData data;
  final String type;

  ProductTile(this.type, this.data);
  //TODO: ajustar os helpers
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductScreen(data),
        ));
      },
      child: Card(
          child: this.type == "grid"
              ? this._BuildGridProduct(context)
              : this._BuildListProduct(context)),
    );
  }

  Widget _BuildGridProduct(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 0.8,
          child: Image.network(
            this.data.images[0],
            fit: BoxFit.cover,
          ),
        ),
        Expanded(child: containerPorduct(context))
      ],
    );
  }

  Container containerPorduct(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            this.data.title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            "R\$ ${this.data.price.toStringAsFixed(2)}",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17.0),
          ),
        ],
      ),
    );
  }

  Widget _BuildListProduct(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Image.network(
            this.data.images[0],
            fit: BoxFit.cover,
            height: 250.0,
          ),
        ),
        Flexible(
          flex: 1,
          child: containerPorduct(context),
        ),
      ],
    );
  }
}
