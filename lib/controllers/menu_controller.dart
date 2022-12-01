import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dimora_duomo/models/models.dart';
import 'package:dimora_duomo/services/firebase.dart';

class MenuController extends GetxController {
  final FirestoreDB database = FirestoreDB();

  static MenuController instance = Get.find();

  //equivalent of RxList<FoodModel> foods = RxList<FoodModel>([]);
  var foods = <FoodModel>[].obs;
  var drinks = <DrinkModel>[].obs;
  //Map to save item and quantity
  var order = <String, int>{}.obs;
  //List converted from Map order used to write on Firestore
  List<Map<String, dynamic>> order2 = <Map<String, dynamic>>[];
  //List of OrderDbModel reed from Firestore
  var listOrder = <OrderDbModel>[].obs;

  @override
  onInit() {
    super.onInit();
    foods.bindStream(database.getFoods());
    drinks.bindStream(database.getDrinks());
    listOrder.bindStream(database.getOrders());
  }

  // ********* ORDER METHOD

//Add item to Order OLD
  // addOrderOld(String nmae, int quatnity) {
  //   //Set in the Order Map nmae as key and quatnity as value

  //   if (order.containsKey(nmae)) {
  //     // Get.snackbar(
  //     //   '$nmae already added',
  //     //   'You can set the quantity later',
  //     //   colorText: kBackgroundColor,
  //     //   backgroundColor: kButtonSecondaryColor,
  //     // );
  //   } else {
  //     order[nmae] = quatnity;
  //     // order[nmae] = quatnity;
  //   }
  //   // Get.snackbar(
  //   //   '$nmae added to checkout',
  //   //   'You can set the quantity later',
  //   //   colorText: kBackgroundColor,
  //   //   backgroundColor: kButtonSecondaryColor,
  //   // );

  //   update();
  //   debugPrint('ORDER MAP AFTER FOOD WAS ADDED: $order');
  // }

//NEW ORDER ADD

  //Add item to Order Map
  addOrder(String name) {
    //Set the quantity
    int quantity = returnQuantity(name);

    //Check if item is already in the order
    if (order.containsKey(name)) {
      //if so, increases its quantity
      increaseOrder(name, quantity);
    } else {
      //if not, set its quantity = 1
      order[name] = 1;
    }

    update();
    debugPrint('ORDER MAP AFTER FOOD WAS ADDED: $order');
    debugPrint('ORDER LENGTH: ${order.length.toString()}');
  }

  // Print as String quantity of specific item
  printQuantity(String name) {
    // debugPrint('$nmae quantity is ${order[nmae].toString()}');
    if (order.containsKey(name)) {
      return order[name].toString();
    } else {
      return '0';
    }
  }

  // Return item quantity as int
  returnQuantity(String name) {
    if (order.containsKey(name)) {
      return order[name];
    } else {
      return 0;
    }
  }

  // Increase the quantity of a food max 10
  increaseOrder(String name, int quantity) {
    if (quantity < 10) {
      order[name] = quantity + 1;
    }

    update();
  }

  // Decrease the quantity of an item AND remove it if its quantity < 0
  decreaseOrder(String name) {
    //Set the quantity
    int quantity = returnQuantity(name);

    //Check if item is already in the order
    if (order.containsKey(name)) {
      //if so, decreases its quantity
      if (quantity > 1) {
        order[name] = quantity - 1;
      } else {
        order.remove(name);
      }
    }

    update();
  }

//NOT USED ANYMORE
  //remove a single item and its quantity from the Map Order
  removeOrder(String name) {
    order.remove(name);

    update();
  }

  //Remove the whole map order after the order was added on firebase
  removeMapOrder() {
    debugPrint('Mappa prima del remove: $order');

    order.clear();
    update();

    debugPrint('Mappa dopo il remove: $order');
  }

  // Convert MapOrder to List of MapOrders to send to Firestore
  orderMapToOrdineList() {
    debugPrint('order2 prima: ${order2.toString()}');
    debugPrint('order invece prima: ${order.toString()}');

    order.forEach((key, value) => order2.add({'name': key, 'quantity': value}));

    debugPrint('order2 dopo: ${order2.toString()}');
  }
}
