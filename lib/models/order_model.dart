// import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class OrderModel {
//   // String id;
//   int room;
//   // String name;
//   // int quantity;
//   String location;
//   String hour;
//   // List<Map<dynamic, dynamic>> foods; NO
//   // Map<String, int> foods;
//   // String item;
//   // int quantity;
//   // List<Map<String, int>> items;

//   List<String> items;
//   // List<Map<String, int>> items;

//   OrderModel({
//     // required this.id,
//     required this.room,
//     // required this.name,
//     // required this.quantity,
//     required this.location,
//     required this.hour,
//     // required this.foods,
//     // required this.item,
//     // required this.quantity,
//     required this.items,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'room': room,
//       'location': location,
//       'hour': hour,
//       // 'foods': foods,
//       'items': items,
//     };
//   }

//   // @override
//   // String toString() {
//   //   return '$room, $location, $hour, $items';
//   // }

//   // factory OrderModel.fromJson(Map<dynamic, dynamic> json) => OrderModel(
//   //     room: json['room'],
//   //     location: json['location'],
//   //     hour: json['hour'],
//   //     items: List<OrderItems>.from(json['items']));

//   // Map<String, dynamic> toJson() => {
//   //       "room": room,
//   //       "location": location,
//   //       "hour": hour,
//   //       "items": items.toSet(),
//   //     };

//   // factory OrderModel.fromJson(Map<String, dynamic> data) {
//   //   return OrderModel(
//   //     room: data['room'] as int,
//   //     location: data['location'] as String,
//   //     hour: data['hour'] as String,
//   //     items: data['items'] as OrderItems,
//   //   );
//   // }

// //needed to retrive data
//   // factory OrderModel.fromSnapshot(DocumentSnapshot snap) {
//   //   return OrderModel(
//   //     room: snap['name'],
//   //     hour: snap['hour'],
//   //     location: snap['location'],
//   //     // foods: {},
//   //     // item: snap['item'],
//   //     // quantity: snap['quantity'],
//   //     items: snap['items'],
//   //   );
//   // }

//   // String toJson() => json.encode(toMap());

// }
