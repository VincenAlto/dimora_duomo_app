import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderListModel {
  int room;
  String name;
  int quantity;
  String location;
  String hour;

  OrderListModel({
    required this.room,
    required this.name,
    required this.quantity,
    required this.location,
    required this.hour,
  });

  Map<String, dynamic> toMap() {
    return {
      'room': room,
      'name': name,
      'quantity': quantity,
      'location': location,
      'hour': hour
    };
  }

  factory OrderListModel.fromSnapshot(DocumentSnapshot snap) {
    return OrderListModel(
        room: snap['room'],
        name: snap['name'],
        hour: snap['hour'],
        location: snap['location'],
        quantity: snap['quantity']);
  }

  String toJson() => json.encode(toMap());
}
