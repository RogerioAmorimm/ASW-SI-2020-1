import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frabicaapp/Tabs/Drawer_tab.dart';
import 'package:frabicaapp/Tabs/ProductsTab.dart';

class BookingTab extends StatelessWidget {
  BookingTab(this._pageControl);

  PageController _pageControl;

  Widget _buildBodyHomeTab() {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          
          var dividedTiles = ListTile.divideTiles(
                  tiles: snapshot.data.documents
                      .map((doc) => ProductTab(doc))
                      .toList(),
                  color: Colors.grey[500])
              .toList();

          return ListView(
            children: dividedTiles,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Casas"),
        centerTitle: true,
      ),
      body: _buildBodyHomeTab(),
      drawer: DrawerTab(_pageControl),
    );
  }
}
