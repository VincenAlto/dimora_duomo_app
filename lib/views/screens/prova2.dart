// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dimora_duomo/constants.dart';
// import 'package:dimora_duomo/controllers/controllers.dart';
// import 'package:dimora_duomo/models/models.dart';
// import 'package:dimora_duomo/views/screens/screens.dart';
// import 'package:dimora_duomo/views/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

// class Prova2 extends StatefulWidget {
//   Prova2({super.key});

//   @override
//   State<Prova2> createState() => _Prova2State();
// }

// class _Prova2State extends State<Prova2> {
//   @override
//   void initState() {
//     super.initState();
//     getOrders();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Image.asset(
//           'assets/images/DD_Appbar.png',
//           fit: BoxFit.cover,
//           width: 250,
//         ),
//         centerTitle: true,
//         // Remove back button AppBar
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           icon: const Icon(FontAwesomeIcons.arrowLeft),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//       ),
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
//         child: Column(children: [
//           const SizedBox(height: 20),
//           //CONTAINER LIST MENU
//           Expanded(
//             child: Container(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
//               // height: MediaQuery.of(context).size.height * 0.7,
//               decoration: const BoxDecoration(
//                 color: kTertiaryColor,
//                 borderRadius: BorderRadius.all(Radius.circular(30)),
//               ),
//               child: Center(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 500,
//                       child: ListView.builder(
//                           itemCount: MenuController.instance.listOrder.length,
//                           itemBuilder: (BuildContext context, index) {
//                             return Column(
//                               children: [
//                                 Text(MenuController
//                                     .instance.listOrder[index].room
//                                     .toString()),
//                                 Text(MenuController
//                                     .instance.listOrder[index].hour),
//                                 Text(MenuController
//                                     .instance.listOrder[index].location),
//                                 Text(MenuController
//                                     .instance.listOrder[index].orders
//                                     .toString()),
//                                 const SizedBox(height: 20)
//                               ],
//                             );
//                           }),
//                     ),
//                     ElevatedButton(
//                         onPressed: () async {
//                           final ref = FirebaseFirestore.instance
//                               .collection('orders')
//                               .doc('400')
//                               .withConverter(
//                                 fromFirestore: OrderDbModel.fromFirestore,
//                                 toFirestore: (OrderDbModel city, _) =>
//                                     city.toFirestore(),
//                               );
//                           final docSnap = await ref.get();
//                           final city = docSnap.data(); // Convert to City object
//                           final onlyOrders = docSnap.data()?.orders;
//                           if (city != null) {
//                             for (int i = 0; i < city.orders!.length; i++) {
//                               print(onlyOrders![i]['name']);
//                               print(city.orders![i]['quantity']);
//                             }

//                             print(city.orders![0]['name']);
//                           } else {
//                             print("No such document.");
//                           }
//                         },
//                         child: const Text('ciao')),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ]),
//       )),
//     );
//   }
// }

// getOrders() async {
//   final ref =
//       FirebaseFirestore.instance.collection("orders").doc('400').withConverter(
//             fromFirestore: OrderDbModel.fromFirestore,
//             toFirestore: (OrderDbModel city, _) => city.toFirestore(),
//           );

//   final docSnap = await ref.get();
//   final city = docSnap.data();
// }
