import 'package:cloud_firestore/cloud_firestore.dart';

class OrderDbModel {
  final int room;
  final String location;
  final String hour;
  final String status;
  final List<Map<String, dynamic>>? orders;

  OrderDbModel({
    required this.room,
    required this.location,
    required this.hour,
    required this.status,
    this.orders,
  });

  factory OrderDbModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return OrderDbModel(
      room: data?['room'],
      location: data?['location'],
      hour: data?['hour'],
      status: data?['status'],
      orders: data?['orders'] is Iterable ? List.from(data?['orders']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "room": room,
      "location": location,
      "hour": hour,
      "status": status,
      if (orders != null) "orders": orders,
    };
  }
}

// class OrderItems {
//   String name;
//   int quantity;

//   OrderItems({
//     required this.name,
//     required this.quantity,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       "name": name,
//       "quantity": quantity,
//     };
//   }

//   @override
//   String toString() {
//     return '$name, $quantity';
//   }

//   factory OrderItems.fromJson(Map<dynamic, dynamic> json) => OrderItems(
//         name: json['name'],
//         quantity: json['quantity'],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "quantity": quantity,
//       };
// }
