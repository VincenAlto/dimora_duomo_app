import 'dart:convert';

class OrderModel {
  int room;
  String name;
  int quantity;
  String location;
  String hour;

  OrderModel(
      {required this.room,
      required this.name,
      required this.quantity,
      required this.location,
      required this.hour});

  // @override
  // List<Object?> get props {
  //   return [name, quantity];
  // }

  Map<String, dynamic> toMap() {
    return {
      'room': room,
      'name': name,
      'quantity': quantity,
      'location': location,
      'hour': hour
    };
  }

  String toJson() => json.encode(toMap());

  // @override
  // bool get stringify => true;
}
