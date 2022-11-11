// import 'package:dimora_duomo/constants.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomTextField extends StatefulWidget {
//   final String placeholder;
//   final List<String> list;

//   const CustomTextField(
//       {super.key, required this.placeholder, required this.list});

//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   late TextEditingController textEditingController;
//   late FixedExtentScrollController scrollController;
//   int index = 0;

//   @override
//   void initState() {
//     super.initState();

//     textEditingController = TextEditingController(text: null);
//     scrollController = FixedExtentScrollController(initialItem: index);
//   }

//   @override
//   void dispose() {
//     textEditingController.dispose();
//     scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(50),
//       onTap: (() {
//         scrollController.dispose();
//         scrollController = FixedExtentScrollController(initialItem: index);

//         showCupertinoModalPopup(
//             context: context,
//             builder: (contex) => CupertinoActionSheet(
//                   actions: [buildPicker()],
//                   cancelButton: CupertinoActionSheetAction(
//                     child: const Text(
//                       'Cancel',
//                       style: TextStyle(color: kPrimaryColor),
//                     ),
//                     onPressed: () => Get.back(),
//                   ),
//                 ));
//       }),
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width * 0.8,
//         height: 50,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50),
//             color: kBackgroundColor,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.shade400,
//                 spreadRadius: 1,
//                 blurRadius: 8,
//               ),
//             ],
//           ),
//           child: TextField(
//             textAlign: TextAlign.center,
//             controller: textEditingController,
//             readOnly: true,
//             enabled: false,
//             style: const TextStyle(fontSize: 24.0),
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: widget.placeholder,
//                 hintStyle: const TextStyle(color: kPrimaryColor)),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildPicker() => Container(
//         color: kBackgroundColor,
//         height: 200,
//         child: StatefulBuilder(
//           builder: (context, setState) => GestureDetector(
//             behavior: HitTestBehavior.translucent,
//             onTap: () {
//               textEditingController.text = widget.list[index];
//               Get.back();
//             },
//             child: CupertinoPicker(
//               scrollController: scrollController,
//               itemExtent: 64,
//               children: List.generate(widget.list.length, (index) {
//                 final location = widget.list[index];
//                 //final isSelected = this.index == index;
//                 return Center(
//                     child:
//                         Text(location, style: const TextStyle(fontSize: 24.0)));
//               }),
//               onSelectedItemChanged: (index) {
//                 setState(() {
//                   this.index = index;
//                 });
//                 textEditingController.text = widget.list[index];
//                 final location = widget.list[index];
//                 debugPrint('Selected location: $location');
//               },
//             ),
//           ),
//         ),
//       );
// }



//Da cancellare perchè è la versione stateful