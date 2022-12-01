import 'dart:io';
import 'package:dimora_duomo/views/screens/screens.dart';
import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:dimora_duomo/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String roomSelected = Get.arguments;

  bool orderValue = false;

  final InputController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.resetOrderFlag();
  }

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
            icon: const Icon(Icons.logout),
            onPressed: () {
              AuthService().signOut();
              AuthController.instance.logOut();
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
              const SizedBox(height: 10.0),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: [
                      CustomCard(
                        inputText: 'Book \nyour breakfast.',
                        icon: CustomIcons.coffee,
                        orderSubmitted: controller.checkOrderLocallySaved(),
                        //Check is order is already submitted
                        onClick: controller.checkOrderLocallySaved()
                            ? () {
                                // Get.snackbar(
                                //   'Order already submitted',
                                //   'You can order again tomorrow.',
                                //   colorText: kBackgroundColor,
                                //   backgroundColor: kButtonSecondaryColor,
                                // );
                                Get.defaultDialog(
                                  title: 'Order already submitted',
                                  middleText: 'Do you want change the order?',
                                  backgroundColor: kSecondaryColor,
                                  confirm: ElevatedButton(
                                      onPressed: (() {
                                        Get.to(
                                            () => const BreakfastSettingsPage(),
                                            arguments: roomSelected);
                                      }),
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          backgroundColor: kBackgroundColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50.0))),
                                      child: const Text(
                                        'Change',
                                        style: TextStyle(
                                            color: kButtonSecondaryColor),
                                      )),
                                  cancel: ElevatedButton(
                                      onPressed: (() {
                                        Get.back();
                                      }),
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          backgroundColor: kBackgroundColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50.0))),
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color: kButtonSecondaryColor),
                                      )),
                                );
                              }
                            //if not go to Breakfast Setting Page
                            : () => Get.to(() => const BreakfastSettingsPage(),
                                arguments: roomSelected),
                        color: kSecondaryColor,
                      ),
                      const SizedBox(height: 15.0),

                      //EMAIL TEXT
                      // Text(
                      //   FirebaseAuth.instance.currentUser!.email!,
                      //   style: const TextStyle(color: kTertiaryColor),
                      // ),

                      //SHORTCUT TO STAFF PAGE
                      // ElevatedButton(
                      //     onPressed: () {
                      //       Get.to(() => StaffPage());
                      //     },
                      //     child: const Text('staff')),

                      //CARD SERVICES NOT USED ANYMORE
                      // CustomCard(
                      //   inputText: 'Look at room \nservices.',
                      //   icon: CustomIcons.tray,
                      //   onClick: () {},
                      //   orderSubmitted: false,
                      //   color: kSecondaryColor,
                      // ),

                      // BUTTONS TO RESET HOUR
                      // Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       ElevatedButton(
                      //         style: ElevatedButton.styleFrom(
                      //             backgroundColor: kButtonSecondaryColor,
                      //             foregroundColor: kBackgroundColor),
                      //         child: const Text(
                      //           '1-1-2023',
                      //           style: TextStyle(fontSize: 24),
                      //         ),
                      //         onPressed: () {
                      //           setState(() {
                      //             controller.now = DateTime(2023, 01, 01);
                      //             debugPrint(controller.now.toString());
                      //           });
                      //         },
                      //       ),
                      //       ElevatedButton(
                      //           style: ElevatedButton.styleFrom(
                      //               backgroundColor: kButtonSecondaryColor,
                      //               foregroundColor: kBackgroundColor),
                      //           child: const Text(
                      //             'now',
                      //             style: TextStyle(fontSize: 24),
                      //           ),
                      //           onPressed: () {
                      //             setState(() {
                      //               controller.now = DateTime.now();
                      //               GetStorage().write('order', true);
                      //               debugPrint(controller.now.toString());
                      //             });
                      //           }),
                      //     ]),
                      // Text(
                      //   'Order status: ${controller.checkOrderLocallySaved().toString()}',
                      //   style: const TextStyle(
                      //       color: kTertiaryColor, fontSize: 18),
                      // ),

                      // Text(
                      //   'Saved date: ${controller.checkDataOrdineLocallySaved().toString()}',
                      //   style: const TextStyle(
                      //       color: kTertiaryColor, fontSize: 18),
                      // ),
                      const SizedBox(height: 15.0),
                      CustomCard(
                        inputText: 'Contact us on Whatsapp.',
                        icon: CustomIcons.whatsapp,
                        onClick: () {
                          openWhatsApp();
                        },
                        orderSubmitted: false,
                        color: kSecondaryColor,
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  openWhatsApp() async {
    String whatsapp = '+393398742237';
    String message = 'Room $roomSelected';
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp&text=$message";
    var whatappURLIos = "https://wa.me/$whatsapp?text=${Uri.parse(message)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrlString(whatappURLIos)) {
        await launchUrlString(whatappURLIos,
            mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar('$context', "WhatsApp no installed");
      }
    } else {
      // android , web
      if (await canLaunchUrlString(whatsappURlAndroid)) {
        await launchUrlString(whatsappURlAndroid);
      } else {
        Get.snackbar('$context', "WhatsApp no installed");
      }
    }
  }
}
