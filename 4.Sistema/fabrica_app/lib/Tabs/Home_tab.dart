import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:frabicaapp/helpers/global_consts.dart';
import 'package:frabicaapp/helpers/opcoes.dart';
import 'package:transparent_image/transparent_image.dart';
//dark mode

class HomeTab extends StatelessWidget {
  HomeTab(String title, {List<Color> listColors}) {
    _title = title;
    _listColors = listColors;
  }

  String _title;
  List<Color> _listColors;

  @override
  Widget build(BuildContext context) {
    Widget _bildBodyBack() => Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: _listColors != null
                  ? _listColors
                  : [
                      Color.fromARGB(255, 32, 32, 32),
                      Color.fromARGB(255, 64, 64, 64),
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft),
        ));
    return Stack(children: <Widget>[
      _bildBodyBack(),
      CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          floating: true,
          snap: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(_title),
            centerTitle: true,
          ),
        ),
        FutureBuilder<QuerySnapshot>(
          future: Firestore.instance
              .collection("home")
              .orderBy("pos")
              .getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SliverToBoxAdapter(
                child: Container(
                  height: 500.0,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              );
            } else {
              return SliverStaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                staggeredTiles: snapshot.data.documents.map((doc) {
                  return StaggeredTile.count(doc.data["x"], doc.data["y"]);
                }).toList(),
                children: snapshot.data.documents.map((doc) {
                  return FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: doc.data["image"],
                      fit: BoxFit.cover);
                }).toList(),
              );
            }
          },
        ),
      ])
    ]);
  }
}
