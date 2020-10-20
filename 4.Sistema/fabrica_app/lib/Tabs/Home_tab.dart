import 'package:flutter/material.dart';
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
          //floating: true,
          //snap: true,
          backgroundColor: Colors.transparent,
          // elevation: 0.0,
          expandedHeight: 400.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
                margin: EdgeInsets.all(20.0),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/logo.png"))))),
          ),
        ),
        SliverToBoxAdapter(
          child: FadeInImage.assetNetwork(placeholder: "images/grid.png", image: "images/grid.png", )                     
        ),
         SliverToBoxAdapter()
      ])
    ]);
  }
}
// //TODO: Refatorar essa parte do code para melhor aproveitamento
//             FutureBuilder<QuerySnapshot>(
//               future: Firestore.instance
//                   .collection("home")
//                   .orderBy("pos")
//                   .getDocuments(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return SliverToBoxAdapter(
//                     child: Container(
//                       height: 500.0,
//                       alignment: Alignment.center,
//                       child: CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                       ),
//                     ),
//                   );
//                 } else {
//                   return SliverStaggeredGrid.count(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 1.0,
//                     crossAxisSpacing: 1.0,
//                     staggeredTiles: snapshot.data.documents.map((doc) {
//                       return StaggeredTile.count(doc.data["x"], doc.data["y"]);
//                     }).toList(),
//                     children: snapshot.data.documents.map((doc) {
//                       return FadeInImage.memoryNetwork(
//                           placeholder: kTransparentImage,
//                           image: doc.data["image"],
//                           fit: BoxFit.cover);
//                     }).toList(),
//                   );
//                 }
//               },
//             )
//           ],
//         )
