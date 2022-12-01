import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class DrinkModel {
  final String name;

  const DrinkModel({required this.name});

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory DrinkModel.fromSnapshot(DocumentSnapshot snap) {
    return DrinkModel(name: snap['name']);
  }

  String toJson() => json.encode(toMap());
}
