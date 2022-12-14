import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dimora_duomo/models/models.dart';

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

  // Get a list of orders from Firestore
  Stream<List<OrderDbModel>> getOrders() {
    return FirebaseFirestore.instance
        .collection('orders')
        .where('status', isEqualTo: 'Pending')
        .withConverter(
          fromFirestore: OrderDbModel.fromFirestore,
          toFirestore: (OrderDbModel city, _) => city.toFirestore(),
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

//OLD NOT USED
  // Add a new order to Firestore
  // Future<void> addOrderDB(OrderModel order) {
  //   return _firebaseFirestore.collection('orders').add(order.toMap()).then(
  //       (documentSnapshot) =>
  //           debugPrint("Added order: ${documentSnapshot.id}"));
  // }

//OLD NOT USED
  // Future<void> deleteOrderDB(int order) {
  //   return _firebaseFirestore
  //       .collection('orders')
  //       .where('room', isEqualTo: order)
  //       .get()
  //       .then((querySnapshot) => {querySnapshot.docs.first.reference.delete()});
  // }
}
