import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:dimora_duomo/models/models.dart';
import 'package:dimora_duomo/services/firebase.dart';
import 'package:dimora_duomo/views/screens/screens.dart';
import 'package:dimora_duomo/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class StaffPage extends StatelessWidget {
  StaffPage({super.key});
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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
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
                      decoration: const BoxDecoration(
                        color: kTertiaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: ListView.builder(
                          itemCount: menuController.orderList.length,
                          itemBuilder: (BuildContext context, index) {
                            return StaffCard(
                              order: menuController.orderList[index],
                              index: index,
                              quantity: 0,
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      )),
      bottomNavigationBar: BottomAppBar(
        color: kBackgroundColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
          child: CustomButton(
            inputText: 'Insert',
            icon: FontAwesomeIcons.check,
            color: kButtonSecondaryColor,
            iconColor: kTertiaryColor,
            onClick: () => {},
          ),
        ),
      ),
    );
  }
}

class StaffCard extends StatelessWidget {
  //dynamic = FoodModel or DrinkModel depends what's menu selected
  final OrderListModel order; // food = menuController.foods[index]
  final int index;
  final int quantity;

  StaffCard({
    super.key,
    required this.order,
    required this.index,
    required this.quantity,
  });

  final MenuController menuController = Get.find();
  final FirestoreDB database = FirestoreDB();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      // dense: true,
      title: Text(
        'Room: ${order.room.toString()}',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        children: [
          const SizedBox(height: 5),
          Row(children: [
            getName(),
            const SizedBox(width: 5),
            getQuantity(),
          ]),
          const SizedBox(height: 5),
          Row(children: [
            Text(order.location),
            const SizedBox(width: 5),
            Text(order.hour),
          ]),
        ],
      ),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: kBackgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0))),
        child: const Text(
          'Accept',
          style: TextStyle(color: kSecondaryColor),
        ),
      ),
    );
  }

  Widget getName() {
    if (order.name != '') {
      return Text(order.name);
    }
    return const SizedBox();
  }

  Widget getQuantity() {
    if (order.quantity != 0) {
      return Text('x${order.quantity.toString()}');
    }
    return const SizedBox();
  }
}
