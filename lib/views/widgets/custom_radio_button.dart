// import 'package:dimora_duomo/constants.dart';
// import 'package:dimora_duomo/controllers/controllers.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// //NOT USED

// class CustomRadioButton extends StatelessWidget {
//   final InputController controller = Get.find();

//   final void Function(String) onAnswer;

//   CustomRadioButton({super.key, required this.onAnswer});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         customR('In my Room', 1),
//         const SizedBox(height: 10),
//         customR('At the Bar', 2)
//       ],
//     );
//   }

//   Widget customR(String inputText, int index) {
//     return Obx(
//       () => SizedBox(
//         width: double.infinity,
//         height: 60,
//         child: OutlinedButton(
//           style: OutlinedButton.styleFrom(
//               backgroundColor: (controller.checkSelectedRB(index))
//                   ? kButtonSecondaryColor
//                   : null,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0)),
//               side: const BorderSide(width: 2.0, color: kButtonSecondaryColor)),
//           onPressed: () {
//             controller.setSelectedRB(index);
//             onAnswer(inputText);
//           },
//           child: Row(
//             children: [
//               const Spacer(),
//               Text(inputText,
//                   style: TextStyle(
//                       color: (controller.checkSelectedRB(index))
//                           ? kBackgroundColor
//                           : kTertiaryColor,
//                       fontSize: 24.0,
//                       fontWeight: (controller.checkSelectedRB(index))
//                           ? FontWeight.bold
//                           : FontWeight.w200)),
//               const Spacer(),
//               Icon(
//                 controller.checkSelectedRB(index)
//                     ? Icons.check_circle_outline
//                     : null,
//                 color: kTertiaryColor,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
