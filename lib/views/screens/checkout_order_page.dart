import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:dimora_duomo/models/models.dart';
import 'package:dimora_duomo/services/firebase.dart';
import 'package:dimora_duomo/views/screens/order_submitted.dart';
import 'package:dimora_duomo/views/screens/screens.dart';
import 'package:dimora_duomo/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CheckOutOrderPage extends GetView<MenuController> {
  final arguments = Get.arguments;
  late final roomSelected = arguments[0];
  late final locationSelected = arguments[1];
  late final hourSelected = arguments[2];
  CheckOutOrderPage({super.key});

  final InputController dropdownController = Get.find();
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
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<MenuController>(
        init: MenuController(),
        builder: (controller) => SafeArea(
          child: Scrollbar(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Column(
                children: [
                  //ROOM NUMBER CONTAINER
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: kTertiaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: const TextStyle(
                            color: Colors.black, fontSize: 18.0),
                        children: [
                          const TextSpan(
                            text: 'ROOM NUMBER: ',
                            //style: TextStyle(fontWeight: FontWeight.w300)
                          ),
                          TextSpan(
                              text: roomSelected,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: kTertiaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: menuController.order.isEmpty
                          ? const Center(child: Text('Your cart is empty'))
                          : SingleChildScrollView(
                              child: ListView.builder(
                                  //Adjust the height of ListView
                                  shrinkWrap: true,
                                  //Disable ListView Scroll to use SingleChildScrollView
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: menuController.order.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return OrderCards(
                                        order: menuController.order.keys
                                            .elementAt(index),
                                        index: index,
                                        quantity: menuController.order.values
                                            .elementAt(index));
                                  }),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: kBackgroundColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
          child: CustomButton(
            inputText: 'Submit',
            icon: FontAwesomeIcons.arrowRight,
            color: kButtonSecondaryColor,
            iconColor: kTertiaryColor,
            onClick: () => {
              if (menuController.order.isEmpty)
                {
                  Get.snackbar(
                    'Attention',
                    'Your order is empty',
                    colorText: kBackgroundColor,
                    backgroundColor: kButtonSecondaryColor,
                  )
                }
              else
                {
                  // HERE ADD ORDER TO FIRESTORE DATABASE
                  menuController.order.forEach((key, value) {
                    debugPrint('Added Order $roomSelected: $key: $value');

                    database.addOrderDB(
                      OrderModel(
                        room: int.parse(roomSelected),
                        name: key,
                        quantity: value,
                        location: locationSelected,
                        hour: hourSelected,
                      ),
                    );
                  }),

                  // Set OrderStatus = TRUE after users complete the order
                  dropdownController.changeOrderStatus(true),
                  debugPrint(
                      dropdownController.orderSubmitted.value.toString()),
                  // Show Order submitted screen immediatly
                  Future.delayed(const Duration(seconds: 0), () {
                    Get.to(() => const OrderSubmitted());
                  }),
                  // After 3 seconds go back to HomePage
                  Future.delayed(const Duration(seconds: 3), () {
                    Get.to(() => HomePage(), arguments: roomSelected);
                  }),
                },
            },
          ),
        ),
      ),
    );
  }
}

//List of item inside the cart/checkout page
class OrderCards extends GetView<MenuController> {
  final String order;
  final int quantity;
  final int index;

  const OrderCards({
    super.key,
    required this.order,
    required this.quantity,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        order,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      leading: SizedBox(
        child: Container(
          width: 25,
          alignment: Alignment.centerLeft,
          child: Text(
            'x${quantity.toString()}',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
