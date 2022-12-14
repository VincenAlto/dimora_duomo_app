import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:dimora_duomo/models/models.dart';
import 'package:dimora_duomo/services/firebase.dart';
import 'package:dimora_duomo/views/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// GetView<MenuController>
class StaffPage extends StatefulWidget {
  const StaffPage({super.key});

  @override
  State<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  final MenuController menuController = Get.find();

  final FirestoreDB database = FirestoreDB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/DD_Appbar.png',
          fit: BoxFit.cover,
          width: 250,
        ),
        centerTitle: true,
        // Remove back button AppBar
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            AuthService().signOut();
            AuthController.instance.logOut();
          },
        ),
      ),
      body: GetBuilder<MenuController>(
        init: MenuController(),
        builder: (controller) => SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Column(children: [
              const SizedBox(height: 20),
              //CONTAINER LIST MENU
              Expanded(
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.7,
                  decoration: const BoxDecoration(
                    color: kTertiaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          decoration: const BoxDecoration(
                            color: kTertiaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Scrollbar(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: menuController.listOrder.length,
                                itemBuilder: (BuildContext context, index) {
                                  return StaffCard(
                                    order: menuController.listOrder[index],
                                    index: index,
                                    quantity: 0,
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: kBackgroundColor,
      //   elevation: 0,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
      //     child: CustomButton(
      //       inputText: 'Insert',
      //       icon: FontAwesomeIcons.check,
      //       color: kButtonSecondaryColor,
      //       iconColor: kTertiaryColor,
      //       onClick: () => {},
      //     ),
      //   ),
      // ),
    );
  }
}

class StaffCard extends StatefulWidget {
  //dynamic = FoodModel or DrinkModel depends what's menu selected
  final OrderDbModel order; // food = menuController.foods[index]
  final int index;
  final int quantity;

  const StaffCard({
    super.key,
    required this.order,
    required this.index,
    required this.quantity,
  });

  @override
  State<StaffCard> createState() => _StaffCardState();
}

class _StaffCardState extends State<StaffCard> {
  final MenuController menuController = Get.find();

  final FirestoreDB database = FirestoreDB();
  bool isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuController>(
      init: MenuController(),
      builder: (controller) => Card(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        // color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    // width: MediaQuery.of(context).size.width * 0.25,
                    child: Column(
                      children: [
                        Text(
                          widget.order.room.toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(widget.order.hour),
                        Text(widget.order.location),
                      ],
                    ),
                  ),
                  Flexible(
                    // width: MediaQuery.of(context).size.width * 0.5,
                    child: widget.order.orders == null
                        ? const Center(child: Text('No orders'))
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.order.orders != null
                                ? widget.order.orders?.length
                                : 0,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Text(
                                    'x${widget.order.orders![index]['quantity'].toString()}',
                                    // textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    widget.order.orders![index]['name']
                                        .toString(),
                                    // textAlign: TextAlign.start,
                                  ),
                                ],
                              );
                            },
                          ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: isButtonDisabled
                      ? null
                      : ()
                      // async {
                      //     await FirebaseFirestore.instance
                      //         .collection("orders")
                      //         .doc(widget.order.room.toString())
                      //         .delete()
                      //         .then(
                      //           (doc) => debugPrint(
                      //               "Document deleted ${widget.order.room.toString()}"),
                      //           onError: (e) =>
                      //               debugPrint("Error updating document $e"),
                      //         );
                      //     setState(() {
                      //       isButtonDisabled = true;
                      //     });
                      //   },
                      {
                          FirebaseFirestore.instance
                              .collection("orders")
                              .doc(widget.order.room.toString())
                              .update({
                            'status': 'Accepted',
                          });
                          setState(() {
                            isButtonDisabled = true;
                          });
                        },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      backgroundColor: kBackgroundColor,
                      foregroundColor: kSecondaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                  child: const Text('Accept'),
                ),
              )
            ],
          ),
        ),
      ),
    );

    // Text(order.orders![0]['name'].toString());

    // ListTile(
    //   contentPadding:
    //       const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
    //   // dense: true,
    //   title: Text(
    //     'Room: ${order.room.toString()}',
    //     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //   ),
    //   subtitle: Column(
    //     children: [
    //       const SizedBox(height: 5),
    //       Row(children: [
    //         // getName(),
    //         const SizedBox(width: 5),
    //         // getQuantity(),
    //       ]),
    //       const SizedBox(height: 5),
    //       Row(children: [
    //         Text(order.location),
    //         const SizedBox(width: 5),
    //         Text(order.hour),
    //       ]),
    //     ],
    //   ),
    //   trailing: ElevatedButton(
    //     onPressed: () {},
    //     style: ElevatedButton.styleFrom(
    //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //         backgroundColor: kBackgroundColor,
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(50.0))),
    //     child: const Text(
    //       'Accept',
    //       style: TextStyle(color: kSecondaryColor),
    //     ),
    //   ),
    // );
  }
}
