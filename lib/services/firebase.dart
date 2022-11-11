import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dimora_duomo/models/models.dart';
import 'package:flutter/material.dart';

//final Future<FirebaseApp> initialization = Firebase.initializeApp();
class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Get a list of drinks from Firestore
  Stream<List<DrinkModel>> getDrinks() {
    return _firebaseFirestore
        .collection('drinks')
        .orderBy('name', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => DrinkModel.fromSnapshot(doc)).toList();
    });
  }

  // Get a list of foods from Firestore
  Stream<List<FoodModel>> getFoods() {
    return _firebaseFirestore
        .collection('breakfast')
        .orderBy('name', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => FoodModel.fromSnapshot(doc)).toList();
    });
  }

  // Add a new order to Firestore
  Future<void> addOrderDB(OrderModel order) {
    return _firebaseFirestore.collection('orders').add(order.toMap()).then(
        (documentSnapshot) => debugPrint("Added order: ${documentSnapshot.id}"),
        onError: (e) => debugPrint("Error writing document $e"));
  }
}
