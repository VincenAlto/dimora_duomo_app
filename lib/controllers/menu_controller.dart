import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dimora_duomo/models/models.dart';
import 'package:dimora_duomo/services/firebase.dart';

class MenuController extends GetxController {
  final FirestoreDB database = FirestoreDB();

  //equivalent of RxList<FoodModel> foods = RxList<FoodModel>([]);
  var foods = <FoodModel>[].obs;
  var drinks = <DrinkModel>[].obs;
  var order = <String, int>{}.obs;

  @override
  onInit() {
    super.onInit();
    foods.bindStream(database.getFoods());
    drinks.bindStream(database.getDrinks());
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
  addOrder(String nmae) {
    //Set the quantity
    int quatnity = returnQuantity(nmae);

    //Check if item is already in the order
    if (order.containsKey(nmae)) {
      //if so, increases its quantity
      increaseOrder(nmae, quatnity);
    } else {
      //if not, set its quantity = 1
      order[nmae] = 1;
    }

    update();
    debugPrint('ORDER MAP AFTER FOOD WAS ADDED: $order');
    debugPrint(order.length.toString());
  }

  // Print as String quantity of specific item
  printQuantity(String nmae) {
    // debugPrint('$nmae quantity is ${order[nmae].toString()}');
    if (order.containsKey(nmae)) {
      return order[nmae].toString();
    } else {
      return '0';
    }
  }

  // Return item quantity as int
  returnQuantity(String nmae) {
    if (order.containsKey(nmae)) {
      return order[nmae];
    } else {
      return 0;
    }
  }

  // Increase the quantity of a food max 10
  increaseOrder(String nmae, int quatnity) {
    if (quatnity < 10) {
      order[nmae] = quatnity + 1;
    }

    update();
  }

  // Decrease the quantity of an item AND remove it if its quantity < 0
  decreaseOrder(String nmae) {
    //Set the quantity
    int quatnity = returnQuantity(nmae);

    //Check if item is already in the order
    if (order.containsKey(nmae)) {
      //if so, decreases its quantity
      if (quatnity > 1) {
        order[nmae] = quatnity - 1;
      } else {
        order.remove(nmae);
      }
    }

    update();
  }

//NOT USED ANYMORE
  //remove a single item and its quantity from the Map Order
  removeOrder(String nmae) {
    order.remove(nmae);

    update();
  }

//NOT USED ANYMORE
  //Remove the whole map order after the order was added on firebase
  removeMapOrder() {
    debugPrint('Mappa prima del remove: $order');

    order.clear();
    update();

    debugPrint('Mappa dopo il remove: $order');
  }
}
