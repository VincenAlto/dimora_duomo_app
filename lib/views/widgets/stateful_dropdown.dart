// import 'package:dimora_duomo/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//NOT USED

// class CustomDropdown extends StatefulWidget {
//   const CustomDropdown({super.key});

//   @override
//   State<CustomDropdown> createState() => _CustomDropdownState();
// }

// class _CustomDropdownState extends State<CustomDropdown> {
//   final _languagesList = ['Italiano', 'English', 'Español'];
//   String? _selectedVal = '';

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Column(
//         children: [
//           ButtonTheme(
//             alignedDropdown: true,
//             child: DropdownButtonFormField(
//                 icon: const Icon(
//                   FontAwesomeIcons.chevronDown,
//                   color: kButtonSecondaryColor,
//                   size: 28,
//                 ),
//                 isExpanded: true,
//                 borderRadius: BorderRadius.circular(30),
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.all(16.0),
//                   fillColor: Colors.white,
//                   filled: true,
//                   hintText: 'Language',
//                   hintStyle:
//                       const TextStyle(fontSize: 18.0, color: kPrimaryColor),
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(30.0)),
//                 ),
//                 items: _languagesList.map((e) {
//                   return DropdownMenuItem(
//                     value: e,
//                     child: Text(e,
//                         style: const TextStyle(
//                             fontSize: 18.0, color: kPrimaryColor)),
//                   );
//                 }).toList(),
//                 onChanged: (val) {
//                   setState(() {
//                     _selectedVal = val as String;
//                   });
//                   debugPrint(_selectedVal);
//                 }),
//           ),
//           const SizedBox(height: 50),
//         ],
//       ),
//     );
//   }
// }
