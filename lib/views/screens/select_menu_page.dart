import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:dimora_duomo/custom_icons_icons.dart';
import 'package:dimora_duomo/views/screens/screens.dart';
import 'package:dimora_duomo/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SelectMenuPage extends GetView<MenuController> {
  SelectMenuPage({
    super.key,
  });

  final arguments = Get.arguments;

  late final roomSelected = arguments[0];

  late final locationSelected = arguments[1];

  late final hourSelected = arguments[2];

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
      body: GetX<MenuController>(
        init: MenuController(),
        builder: (controller) => SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.spa,
                children: [
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
                  const SizedBox(height: 50),
                  // CONTAINER TEXT BREAKFAST
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Choose what you want \nto have for breakfast!',
                      style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: [
                          CustomCardMenu(
                            inputText: 'Drinks.',
                            color: kTertiaryColor,
                            icon: CustomIcons.coffee,
                            onClick: () {
                              Get.to(() => MenuPage(), arguments: [
                                roomSelected,
                                locationSelected,
                                hourSelected,
                                'Drinks.',
                              ]);
                            },
                          ),
                          CustomCardMenu(
                            inputText: 'Foods.',
                            color: kTertiaryColor,
                            icon: CustomIcons.restaurant,
                            onClick: () {
                              Get.to(() => MenuPage(), arguments: [
                                roomSelected,
                                locationSelected,
                                hourSelected,
                                'Foods.',
                              ]);
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: menuController.order.isEmpty
                                ? const Text(
                                    '0 product quantity selected.',
                                    style: TextStyle(
                                      color: kTertiaryColor,
                                      fontSize: 18.0,
                                    ),
                                  )
                                : Text(
                                    ' ${menuController.order.values.reduce((sum, element) => sum + element)} product quantity selected.',
                                    style: const TextStyle(
                                      color: kTertiaryColor,
                                      fontSize: 18.0,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
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
              Get.to(() => CheckOutOrderPage(),
                  arguments: [roomSelected, locationSelected, hourSelected]),
            },
          ),
        ),
      ),
    );
  }
}
