import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:dimora_duomo/custom_icons_icons.dart';
import 'package:dimora_duomo/views/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final String roomSelected = Get.arguments;
  final InputController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
              if (!controller.orderSubmitted.value) {
                Get.back();
              }
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Column(children: [
              // Container ROOM NUMBER
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
                    style: const TextStyle(color: Colors.black, fontSize: 18.0),
                    children: [
                      const TextSpan(
                        text: 'ROOM NUMBER: ',
                        //style: TextStyle(fontWeight: FontWeight.w300)
                      ),
                      TextSpan(
                          text: roomSelected,
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              // Material(
              //   elevation: 5,
              //   shadowColor: Colors.grey[300],
              //   child: Container(
              //     color: kBackgroundColor,
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height * 0.07,
              //     alignment: Alignment.center,
              //     child: Text(
              //       roomSelected,
              //       style: const TextStyle(
              //           fontSize: 24,
              //           color: kPrimaryColor,
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              // Container(
              //   color: Colors.pink[200],
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 0.25,
              //   alignment: Alignment.bottomCenter,
              //   child: const Text(
              //     'Our services.',
              //     style: TextStyle(
              //       fontSize: 24,
              //       color: kPrimaryColor,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: [
                      CustomCard(
                        inputText: 'Book \nyour breakfast.',
                        icon: CustomIcons.coffee,
                        orderSubmitted: controller.orderSubmitted.value,
                        //Check is order is already submitted
                        onClick: controller.orderSubmitted.value
                            ? () {
                                Get.snackbar(
                                  'Order already submitted',
                                  'You can order again tomorrow.',
                                  colorText: kBackgroundColor,
                                  backgroundColor: kButtonSecondaryColor,
                                );
                              }
                            //if not go to Breakfast Setting Page
                            : () => Get.to(() => const BreakfastSettingsPage(),
                                arguments: roomSelected),
                        color: kSecondaryColor,
                      ),
                      const SizedBox(height: 15.0),
                      CustomCard(
                        inputText: 'Look at room \nservices.',
                        icon: CustomIcons.tray,
                        onClick: () {},
                        orderSubmitted: false,
                        color: kSecondaryColor,
                      ),
                      const SizedBox(height: 15.0),
                      CustomCard(
                        inputText: 'Contact us on Whatsapp.',
                        icon: CustomIcons.whatsapp,
                        onClick: () {},
                        orderSubmitted: false,
                        color: kSecondaryColor,
                      ),
                    ],
                  ),
                ),
              )
              // Expanded(
              //   child: Container(
              //     // color: Colors.pink[300],
              //     padding: const EdgeInsets.only(top: 25),
              //     width: MediaQuery.of(context).size.width,
              //     child: Column(
              //       children: <Widget>[
              //         CustomButton(
              //             inputText: 'Book your breakfast',
              //             icon: FontAwesomeIcons.arrowRight,
              //             color: kButtonColor,
              //             iconColor: kTertiaryColor,
              //             onClick: () => {
              //                   // Get.to(() => BreakfastPage(),
              //                   //     arguments: roomSelected)
              //                   //Get.to(() => MenuPage(), arguments: stanza)
              //                   // Navigator.push(
              //                   //     context,
              //                   //     MaterialPageRoute(
              //                   //       builder: (context) => MenuPage(
              //                   //         selectedRoomBreakfast: stanza,
              //                   //         /*widget.value*/
              //                   //       ),
              //                   //     ))
              //                 }),
              //         SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              //         CustomButton(
              //             inputText: 'Look at room services',
              //             icon: FontAwesomeIcons.arrowRight,
              //             color: kButtonColor,
              //             iconColor: kTertiaryColor,
              //             onClick: () => {
              //                   // Get.to(() => RoomServicesPage(),
              //                   //     arguments: roomSelected)
              //                 }),
              //         SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              //         CustomButton(
              //           inputText: 'Contact us on whatsapp',
              //           icon: FontAwesomeIcons.whatsapp,
              //           color: kButtonColor,
              //           iconColor: kTertiaryColor,
              //           onClick: () => {},
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ]),
          ),
        ),
      ),
    );
  }
}
