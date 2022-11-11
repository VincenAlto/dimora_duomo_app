// import 'package:dimora_duomo/constants.dart';
// import 'package:dimora_duomo/controllers/controllers.dart';
// import 'package:dimora_duomo/models/models.dart';
// import 'package:dimora_duomo/services/firebase.dart';
// import 'package:dimora_duomo/views/screens/screens.dart';
// import 'package:dimora_duomo/views/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

// class CheckoutPage extends GetView<MenuController> {
//   // final roomSelected = Get.arguments;
//   final arguments = Get.arguments;
//   late final roomSelected = arguments[0];
//   late final locationSelected = arguments[1];
//   late final hourSelected = arguments[2];
//   CheckoutPage({super.key});

//   final MenuController menuController = Get.find();
//   final FirestoreDB database = FirestoreDB();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Checkout'),
//         foregroundColor: kPrimaryColor,
//       ),
//       body: GetBuilder<MenuController>(
//         init: MenuController(),
//         builder: (controller) => SafeArea(
//           child: Scrollbar(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Flexible(
//                     child: menuController.order.isEmpty
//                         ? const Center(child: Text('Your cart is empty'))
//                         : ListView.builder(
//                             itemCount: menuController.order.length,
//                             itemBuilder: (BuildContext context, index) {
//                               return OrderCards(
//                                   order: menuController.order.keys
//                                       .elementAt(index),
//                                   index: index,
//                                   quantity: menuController.order.values
//                                       .elementAt(index));
//                               //order: menuController.order[index]);
//                             }),
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
//             inputText: 'Submit',
//             icon: FontAwesomeIcons.arrowRight,
//             color: kButtonSecondaryColor,
//             iconColor: kTertiaryColor,
//             onClick: () => {
//               // HERE ADD ORDER TO FIRESTORE DATABASE

//               menuController.order.forEach((key, value) {
//                 debugPrint('Added Order $roomSelected: $key: $value');

//                 database.addOrderDB(
//                   OrderModel(
//                     room: int.parse(roomSelected),
//                     name: key,
//                     quantity: value,
//                     location: locationSelected,
//                     hour: hourSelected,
//                   ),
//                 );
//               }),
//               //Get.to(() => const ServicesPage())
//               Get.defaultDialog(
//                   title: 'Thank you!',
//                   content: Column(
//                     children: const [
//                       Text('Your order was successfully submitted!'),
//                       SizedBox(height: 10.0)
//                     ],
//                   ),
//                   contentPadding: const EdgeInsets.all(16.0),
//                   titlePadding: const EdgeInsets.all(16.0),
//                   backgroundColor: kBackgroundColor,
//                   confirmTextColor: kSecondaryColor,
//                   buttonColor: kPrimaryColor,
//                   barrierDismissible: true,
//                   actions: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.6,
//                       child: CustomButton(
//                         inputText: 'Home Page',
//                         icon: FontAwesomeIcons.arrowRight,
//                         color: kButtonSecondaryColor,
//                         iconColor: kTertiaryColor,
//                         onClick: () {
//                           Get.to(() => HomePage(), arguments: roomSelected);
//                           //Pulisce la mappa ordine
//                           menuController.order.clear();
//                         },
//                       ),
//                     ),
//                   ])

//               // database.addOrderDB(
//               //   OrderModel(
//               //       room: 102,
//               //       name: menuController.order.keys.toString(),
//               //       quantity: menuController.order.values.toList()),
//               //       ),
//               // );

//               //debugPrint(menuController.order.toString());
//               // };
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class OrderCards extends GetView<MenuController> {
//   final String order;
//   final int quantity;
//   final int index;
//   final MenuController menuController = Get.find();

//   OrderCards({
//     super.key,
//     required this.order,
//     required this.quantity,
//     required this.index,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
//       child: ListTile(
//         title: Text(
//           order,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         trailing: SizedBox(
//           width: 130,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               IconButton(
//                 iconSize: 24.0,
//                 onPressed: () {
//                   // menuController.decreaseOrder2(order, quantity);
//                 },
//                 icon: const Icon(Icons.remove),
//               ),
//               Container(
//                 width: 25,
//                 alignment: Alignment.center,
//                 child: Text(
//                   quantity.toString(),
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               IconButton(
//                 iconSize: 24.0,
//                 onPressed: () {
//                   menuController.increaseOrder(order, quantity);
//                   debugPrint('order: ${menuController.order.toString()}');
//                 },
//                 icon: const Icon(Icons.add),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
