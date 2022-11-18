// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:io';
import 'package:dimora_duomo/views/screens/screens.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:dimora_duomo/custom_icons_icons.dart';
import 'package:dimora_duomo/views/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String roomSelected = Get.arguments;

  bool orderValue = false;

  // late DateTime dataOrdine;
  // String dataOrdineFormatted = '';
  // late DateTime adesso;
  // String adessoFormatted = '';

  // String oraFormat = '';
  final InputController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.resetOrderFlag();

    // adesso = DateTime.now();
    // adessoFormatted = DateFormat('yyyy-MM-dd hh:mm:ss').format(adesso);
    // debugPrint('adesso: $adessoFormatted');

    // // check if dataOrdineFormatted IS BEFORE adessoFormatted
    // debugPrint('dataOrdineFormatted: $dataOrdineFormatted');
    // debugPrint(
    //     'data ordine salvata: ${GetStorage().read('dataOrdineFormatted').toString()}');
    // if (GetStorage().read('dataOrdineFormatted').toString().isNotEmpty) {
    //   dataOrdineFormatted = GetStorage().read('dataOrdineFormatted').toString();
    //   if (dataOrdineFormatted.compareTo(adessoFormatted) < 0) {
    //     GetStorage().write('order', false);
    //     debugPrint('dataOrdineFormatted: $dataOrdineFormatted');
    //     debugPrint('adessoFormatted: $adessoFormatted');
    //   }
    // }

    // debugPrint('Read: ${GetStorage().read('order').toString()}');
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
            icon: const Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              // if (!controller.checkOrderLocallySaved()) {
              //   Get.back();
              // }
              Get.to(() => SelectRoomPage());
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
                      // CustomCard(
                      //   inputText: 'Look at room \nservices.',
                      //   icon: CustomIcons.tray,
                      //   onClick: () {},
                      //   orderSubmitted: false,
                      //   color: kSecondaryColor,
                      // ),
                      // ElevatedButton(
                      //   child: const Text(
                      //     'True',
                      //     style: TextStyle(fontSize: 24),
                      //   ),
                      //   onPressed: () {
                      //     setState(() {
                      //       GetStorage().write('order', true);
                      //       debugPrint(
                      //           'Read: ${GetStorage().read('order').toString()}');

                      //       dataOrdine = DateTime.now();
                      //       dataOrdineFormatted =
                      //           DateFormat('yyyy-MM-dd hh:mm:ss')
                      //               .format(dataOrdine);
                      //       GetStorage().write(
                      //           'dataOrdineFormatted', dataOrdineFormatted);
                      //       debugPrint(
                      //           'dataOrdineLocal: ${GetStorage().read('dataOrdineFormatted').toString()}');

                      //       debugPrint(
                      //           'orderLocal: ${GetStorage().read('order').toString()}');
                      //     });
                      //   },
                      // ),
                      // ElevatedButton(
                      //     child: const Text(
                      //       'False',
                      //       style: TextStyle(fontSize: 24),
                      //     ),
                      //     onPressed: () {
                      //       setState(() {
                      //         adesso = DateTime.now();
                      //         adessoFormatted =
                      //             DateFormat('yyyy-MM-dd hh:mm:ss')
                      //                 .format(adesso);
                      //         debugPrint('adesso: $adessoFormatted');
                      //         if (dataOrdineFormatted
                      //                 .compareTo(adessoFormatted) <
                      //             0) {
                      //           GetStorage().write('order', false);
                      //         }

                      //         debugPrint(
                      //             'Read: ${GetStorage().read('order').toString()}');
                      //       });
                      //     }),

                      Text(
                        'Order status: ${controller.checkOrderLocallySaved().toString()}',
                        style: const TextStyle(
                            color: kTertiaryColor, fontSize: 18),
                      ),

                      Text(
                        'Saved date: ${controller.checkDataOrdineLocallySaved().toString()}',
                        style: const TextStyle(
                            color: kTertiaryColor, fontSize: 18),
                      ),
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
      if (await canLaunch(whatappURLIos)) {
        await launch(whatappURLIos, forceSafariVC: false);
      } else {
        Get.snackbar('$context', "WhatsApp no installed");
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURlAndroid)) {
        await launch(whatsappURlAndroid);
      } else {
        Get.snackbar('$context', "WhatsApp no installed");
      }
    }
  }
}
