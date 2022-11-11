import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel {
  //final String? id;
  final String name;

  const FoodModel({/*this.id,*/ required this.name});

  // @override
  // List<Object?> get props {
  //   return [/*id,*/ name];
  // }

  // FoodModel copyWith({String? id, String? name}) {
  //   return FoodModel(/*id: id ?? this.id,*/ name: name ?? this.name);
  // }

  Map<String, dynamic> toMap() {
    return {/*'id': id, */ 'name': name};
  }

  factory FoodModel.fromSnapshot(DocumentSnapshot snap) {
    return FoodModel(/*id: snap['id'],*/ name: snap['name']);
  }

  String toJson() => json.encode(toMap());

  // @override
  // bool get stringify => true;
}
