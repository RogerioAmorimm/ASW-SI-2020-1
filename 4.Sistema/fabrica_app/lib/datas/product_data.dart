import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData{
  String category;
  String id;
  String title;
  String description;
  double price;
  List images;
  Timestamp endDate;
  Timestamp startDate;  

  //TODO:INCREMENTAR OS HELPERS
  ProductData.fromDocument(DocumentSnapshot snapshot){
    
    this.id = snapshot.documentID;
    this.title = snapshot.data["title"];
    this.description = snapshot.data["description"];
    this.price =  double.parse( snapshot.data["price"].toString());
    this.images = snapshot.data["images"];
    this.endDate = snapshot.data["endDate"];
    this.startDate = snapshot.data["startDate"];
  }

}