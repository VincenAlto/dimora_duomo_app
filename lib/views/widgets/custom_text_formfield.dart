// import 'package:dimora_duomo/controllers/controllers.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

 //NOT USED

// class CustomTextFormField extends GetView<InputController> {
//   final roomController = TextEditingController();
//   CustomTextFormField({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       keyboardType: defaultTargetPlatform == TargetPlatform.iOS
//           ? const TextInputType.numberWithOptions(decimal: false, signed: true)
//           : TextInputType.number,
//       inputFormatters: <TextInputFormatter>[
//         FilteringTextInputFormatter.digitsOnly
//       ],
//       maxLength: 3,
//       onFieldSubmitted: (value) => debugPrint('salamaleko: $value'),
//       controller: roomController,
//       decoration: InputDecoration(
//         // contentPadding: const EdgeInsets.all(16.0),
//         fillColor: Colors.white,
//         filled: true,
//         hintText: 'Room number',
//         hintStyle: const TextStyle(fontSize: 18.0, color: Colors.black54),
//         border: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(30.0)),
//       ),
//     );
//   }
// }
