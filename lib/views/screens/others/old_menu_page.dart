// import 'package:dimora_duomo/constants.dart';
// import 'package:dimora_duomo/controllers/controllers.dart';
// import 'package:dimora_duomo/views/screens/screens.dart';
// import 'package:dimora_duomo/views/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

// class OldMenuPage extends GetView<MenuController> {
//   // final selectedRoom = Get.arguments;
//   final arguments = Get.arguments;
//   late final roomSelected = arguments[0];
//   late final locationSelected = arguments[1];
//   late final hourSelected = arguments[2];
//   final MenuController menuController = Get.put(MenuController());

//   OldMenuPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Menu'),
//         foregroundColor: kPrimaryColor,
//       ),
//       body: GetX<MenuController>(
//         init: MenuController(),
//         builder: (controller) => SafeArea(
//           child: Scrollbar(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Flexible(
//                     child: ListView.builder(
//                         itemCount: menuController.foods.length,
//                         itemBuilder: (BuildContext context, index) {
//                           return MenuCard(
//                             food: menuController.foods[index],
//                             index: index,
//                             // quantity l'ho aggiunto io adesso
//                             quantity: 0,
//                           );
//                         }),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
//           child: CustomButton(
//             inputText: 'Checkout',
//             icon: FontAwesomeIcons.arrowRight,
//             color: kButtonSecondaryColor,
//             iconColor: kTertiaryColor,
//             onClick: () => {
//               // Get.to(() => CheckoutPage(),
//               //     arguments: [roomSelected, locationSelected, hourSelected]),
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class MenuCard extends GetView<MenuController> {
// //   final FoodModel food; // food = menuController.foods[index]
// //   final int index;
// //   final MenuController menuController = Get.find();
// //   final FirestoreDB database = FirestoreDB();

// //   MenuCard({
// //     super.key,
// //     required this.food,
// //     required this.index,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return GetX<MenuController>(
// //       init: MenuController(),
// //       builder: (controller) => Card(
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
// //         child: ListTile(
// //           leading: !menuController.order.containsKey(food.name)
// //               ? null
// //               : IconButton(
// //                   icon: const Icon(Icons.delete, color: Colors.red),
// //                   onPressed: () => menuController.removeOrder(food.name),
// //                 ),
// //           title: Text(
// //             menuController.foods[index].name, // = food.name
// //             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //           ),
// //           trailing: menuController.order.containsKey(food.name)
// //               ? const IconButton(
// //                   icon: Icon(Icons.check_circle, color: Colors.black87),
// //                   onPressed: null,
// //                 )
// //               : IconButton(
// //                   icon: const Icon(Icons.add, color: Colors.black87),
// //                   onPressed: () {
// //                     //ADD SELECTED FOOD TO LIST ORDER WITH QUANTITY = 1
// //                     menuController.addOrderOld(
// //                         menuController.foods[index].name, 1);

// //                     // ADD SELECTED FOOD TO LIST WORDS WITH QUANTITY = 1
// //                     // **FUNZIA**
// //                     //menuController.addWord(menuController.foods[index].name, 1);

// //                     //openBottomSheet(menuController, index, database);
// //                   },
// //                 ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // void openBottomSheet(menuController, index, database) {
// //   Get.bottomSheet(
// //     Container(
// //       height: 300,
// //       color: Colors.white,
// //       child: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //             Text(menuController.foods[index].name,
// //                 style: const TextStyle(
// //                     fontSize: 20.0, fontWeight: FontWeight.bold)),
// //             Row(
// //               children: [
// //                 const Text('Quantity:', style: TextStyle(fontSize: 20.0)),
// //                 const Spacer(),
// //                 IconButton(
// //                   iconSize: 32.0,
// //                   onPressed: () {},
// //                   icon: const Icon(Icons.remove),
// //                 ),
// //                 //Container needed to fix - + buttons position
// //                 // Obx(() => Container(
// //                 //       width: 50,
// //                 //       alignment: Alignment.center,
// //                 //       child:
// //                 //       //Text(menuController.order[index].quantity),
// //                 //       // Text(menuController.count.value.toString(),
// //                 //       //     style: const TextStyle(fontSize: 32.0)),
// //                 //     )),
// //                 // Increment Button
// //                 IconButton(
// //                   iconSize: 32.0,
// //                   onPressed: () {
// //                     debugPrint(menuController.foods[index].quantity.toString());
// //                   },
// //                   icon: const Icon(Icons.add),
// //                 ),
// //               ],
// //             ),
// //             SizedBox(
// //               height: 50,
// //               width: double.infinity,
// //               child: ElevatedButton(
// //                 child: const Text(
// //                   'Add',
// //                   style: TextStyle(fontSize: 18.0),
// //                 ),
// //                 onPressed: () {
// //                   menuController.addOrder(menuController.foods[index].name, 1);
// //                   //debugPrint(menuController.count.value.toString());
// //                   //menuController.food.nome,
// //                   //menuController.foods[index].name,
// //                   //menuController.count[index].value

// //                   //QUESTA aggiunge l'ordine al database
// //                   // database.addOrderDB(OrderModel(
// //                   //     name: menuController.order['name'],
// //                   //     quantity: menuController.order['quantity']));
// //                 },
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     ),
// //   );
// // }
