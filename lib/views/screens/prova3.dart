// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dimora_duomo/constants.dart';
// import 'package:dimora_duomo/controllers/controllers.dart';
// import 'package:dimora_duomo/models/models.dart';
// import 'package:dimora_duomo/views/screens/prova2.dart';
// import 'package:dimora_duomo/views/screens/screens.dart';
// import 'package:dimora_duomo/views/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

// class Prova3 extends StatelessWidget {
//   Prova3({super.key});

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
//           icon: const Icon(Icons.logout),
//           onPressed: () {
//             AuthService().signOut();
//             AuthController.instance.logOut();
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
//               // height: MediaQuery.of(context).size.height * 0.7,
//               decoration: const BoxDecoration(
//                 color: kTertiaryColor,
//                 borderRadius: BorderRadius.all(Radius.circular(30)),
//               ),
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         color: kTertiaryColor,
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                       ),
//                       child: StreamBuilder<QuerySnapshot>(
//                         stream: FirebaseFirestore.instance
//                             .collection('orders')
//                             .snapshots(),
//                         builder: (BuildContext context,
//                             AsyncSnapshot<QuerySnapshot> snapshot) {
//                           if (snapshot.hasError) {
//                             return const Text('Something went wrong');
//                           }

//                           if (snapshot.connectionState ==
//                               ConnectionState.waiting) {
//                             return const Text("Loading");
//                           }
//                           QuerySnapshot querySnapshot = snapshot.requireData;
//                           return ListView.builder(
//                             itemCount: querySnapshot.docs.length,
//                             itemBuilder: (context, index) {
//                               // Access the User instance
//                               // querySnapshot.docs[index].data;

//                               return Text(
//                                   querySnapshot.docs[index].data.toString());
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ]),
//       )),
//       bottomNavigationBar: BottomAppBar(
//         color: kBackgroundColor,
//         elevation: 0,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
//           child: CustomButton(
//             inputText: 'Insert',
//             icon: FontAwesomeIcons.check,
//             color: kButtonSecondaryColor,
//             iconColor: kTertiaryColor,
//             onClick: () => {Get.to(() => Prova2())},
//           ),
//         ),
//       ),
//     );
//   }

//   Widget getListOrders(orders) {
//     if (orders != null) {
//       if (orders) orders.forEach((i) => print(i['name']));
//       return Text(orders[0]['name'].toString());
//     }
//     // return const SizedBox();
//     return const Text('no');
//   }
// }
