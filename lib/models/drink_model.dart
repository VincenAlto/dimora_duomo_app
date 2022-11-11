import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class DrinkModel {
  //final String? id;
  final String name;

  const DrinkModel({/*this.id,*/ required this.name});

  Map<String, dynamic> toMap() {
    return {/*'id': id, */ 'name': name};
  }

  factory DrinkModel.fromSnapshot(DocumentSnapshot snap) {
    return DrinkModel(/*id: snap['id'],*/ name: snap['name']);
  }

  String toJson() => json.encode(toMap());
}
