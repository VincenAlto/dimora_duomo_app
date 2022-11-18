import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:dimora_duomo/custom_icons_icons.dart';
import 'package:dimora_duomo/services/firebase.dart';
import 'package:dimora_duomo/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  final arguments = Get.arguments;

  late final roomSelected = arguments[0];
  late final locationSelected = arguments[1];
  late final hourSelected = arguments[2];
  late final menuSelected = arguments[3];

  final MenuController menuController = Get.find();

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
        body: Obx(
          () => SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
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
                            //ListTile above menu list
                            ListTile(
                              title: Text(
                                menuSelected,
                                style: const TextStyle(fontSize: 20),
                              ),
                              trailing: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  menuSelected == 'Drinks.'
                                      ? CustomIcons.coffee
                                      : CustomIcons.restaurant,
                                  color: kBackgroundColor,
                                  size: 32,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: kTertiaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: ListView.builder(
                                    itemCount: menuSelected == 'Drinks.'
                                        ? menuController.drinks.length
                                        : menuController.foods.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return MenuCard(
                                        food: menuSelected == 'Drinks.'
                                            ? menuController.drinks[index]
                                            : menuController.foods[index],
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
                  ],
                )),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: kBackgroundColor,
          elevation: 0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
            child: CustomButton(
              inputText: 'Insert',
              icon: FontAwesomeIcons.check,
              color: kButtonSecondaryColor,
              iconColor: kTertiaryColor,
              onClick: () => {
                Get.back(),
              },
            ),
          ),
        ));
  }
}

class MenuCard extends StatelessWidget {
  //dynamic = FoodModel or DrinkModel depends what's menu selected
  final dynamic food; // food = menuController.foods[index]
  final int index;
  final int quantity;

  MenuCard({
    super.key,
    required this.food,
    required this.index,
    required this.quantity,
  });

  final MenuController menuController = Get.find();
  final FirestoreDB database = FirestoreDB();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        // leading: !menuController.order.containsKey(food.name)
        //     ? null
        //     : IconButton(
        //         icon: const Icon(Icons.delete, color: Colors.red),
        //         onPressed: () => menuController.removeOrder(food.name),
        //       ),
        title: Text(
          food.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: SizedBox(
          width: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                iconSize: 24.0,
                onPressed: () {
                  menuController.decreaseOrder(food.name);
                },
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: kPrimaryColor,
                ),
              ),
              Container(
                  width: 25,
                  alignment: Alignment.center,
                  child: Text(
                    menuController.printQuantity(food.name),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  )
                  // (menuController.order.containsKey(food.name))
                  //     ? Text(menuController.order[food.name].toString())
                  //     : const Text('0')
                  //
                  ),
              IconButton(
                iconSize: 24.0,
                onPressed: () {
                  menuController.addOrder(food.name);
                  // if (menuController.order.containsKey(food.name)) {
                  //   menuController.increaseOrder(
                  //       food.name, menuController.order[food.name]!);
                  // } else {
                  //   menuController.addOrder(
                  //       menuController.foods[index].name, 1);
                  //   debugPrint('order: ${menuController.order.toString()}');
                  // }
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
