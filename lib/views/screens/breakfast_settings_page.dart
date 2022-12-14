import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:dimora_duomo/models/models.dart';
import 'package:dimora_duomo/views/screens/order_submitted.dart';
import 'package:dimora_duomo/views/screens/screens.dart';
import 'package:dimora_duomo/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:dimora_duomo/services/firebase.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../widgets/stateful_radio_button.dart';

class BreakfastSettingsPage extends StatefulWidget {
  const BreakfastSettingsPage({super.key});

  @override
  State<BreakfastSettingsPage> createState() => _BreakfastSettingsPageState();
}

class _BreakfastSettingsPageState extends State<BreakfastSettingsPage> {
  final String roomSelected = Get.arguments;

  final InputController dropdownController = Get.find();
  final FirestoreDB database = FirestoreDB();
  bool isLocated = false;
  var locationSelected = '';
  var hourSelected = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR
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
      body: GetBuilder<InputController>(
        init: InputController(),
        builder: (controller) => SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container ROOM NUMBER
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  alignment: Alignment.centerLeft,
                  //width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: kTertiaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style:
                          const TextStyle(color: Colors.black, fontSize: 18.0),
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
                const SizedBox(height: 50),
                // CONTAINER TEXT LOCATION BREAKFAST
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Where and when \ndo you want to have breakfast?',
                    style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 32.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                // TWO RADIO BUTTON TO CHOOSE BREAKFAST LOCATION
                StatefulRadioButton(
                  onAnswer: (ans) {
                    setState(() {
                      locationSelected = ans;
                      isLocated = true;
                      debugPrint('stateful ans: $locationSelected');
                    });
                  },
                ),
                const Text(
                  'AT (HOURS)',
                  style: TextStyle(
                      color: kTertiaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w200),
                ),
                // DROPDOWN HOUR
                CustomDropDown(
                  hintText: 'Hours',
                  //Check locationSelected == At the Bar, to show bar hours
                  list: (locationSelected == locations[0]) ? hours : hoursBar,
                  onAnswer: (ans) {
                    hourSelected = ans;

                    debugPrint('Stampa \$hourSelected: $hourSelected');
                  },
                  isLocated: isLocated,
                ),
                const SizedBox(height: 25)
              ],
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
            inputText: 'Continue',
            icon: FontAwesomeIcons.arrowRight,
            color: kButtonSecondaryColor,
            iconColor: kTertiaryColor,
            onClick: () => {
              debugPrint('Stampa \$locationSelected: $locationSelected'),
              //Check Location Selected == At The Bar and hour is setted correctly
              if (locationSelected == locations[1] &&
                  hourSelected == hoursBar[0])
                {
                  FirebaseFirestore.instance
                      .collection('orders')
                      .withConverter(
                          fromFirestore: OrderDbModel.fromFirestore,
                          toFirestore: (OrderDbModel orderDbModel, options) =>
                              orderDbModel.toFirestore())
                      .doc(roomSelected)
                      .set(OrderDbModel(
                          room: int.parse(roomSelected),
                          location: locationSelected,
                          hour: hourSelected,
                          status: 'Pending',
                          orders: null))
                      .then((_) => debugPrint('Added'))
                      .catchError((error) => debugPrint('Add failed: $error')),
                  //OLD ADD NOT USED
                  // database.addOrderDB(
                  //   OrderModel(
                  //     id: 'gsdgs',
                  //     room: int.parse(roomSelected),
                  //     name: '',
                  //     quantity: 0,
                  //     location: locationSelected,
                  //     hour: hourSelected,
                  //   ),
                  // ),

                  // After added order set orderLocal value = true
                  GetStorage().write('order', true),
                  // dropdownController.dataOrdine = DateTime.now(),
                  dropdownController.dataOrdineFormatted =
                      DateFormat('yyyy-MM-dd').format(DateTime.now()),
                  GetStorage().write('dataOrdineFormatted',
                      dropdownController.dataOrdineFormatted),

                  // Show Order submitted screen immediatly
                  Future.delayed(const Duration(seconds: 0), () {
                    Get.to(() => const OrderSubmitted());
                  }),
                  // After 3 seconds go back to HomePage
                  Future.delayed(const Duration(seconds: 3), () {
                    Get.to(() => const HomePage(), arguments: roomSelected);
                  }),
                }
              //Check Location Selected == In My Room and hour is setted correctly
              else if ((locationSelected == locations[0] &&
                  hourSelected != hoursBar[0] &&
                  hourSelected != ''))
                {
                  Get.to(() => SelectMenuPage(), arguments: [
                    roomSelected,
                    locationSelected,
                    hourSelected,
                  ]),
                }
              // if nothing is selected
              else
                {
                  Get.snackbar(
                    'Attention',
                    'You have to set location and hour for your breakfast',
                    colorText: kBackgroundColor,
                    backgroundColor: kButtonSecondaryColor,
                  ),
                }
            },
          ),
        ),
      ),
    );
  }
}
