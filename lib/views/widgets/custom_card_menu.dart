import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardMenu extends StatelessWidget {
  final String inputText;
  final IconData icon;
  final VoidCallback onClick;
  final Color color;

  CustomCardMenu({
    super.key,
    required this.inputText,
    required this.icon,
    required this.onClick,
    required this.color,
  });

  final MenuController menuController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: InkWell(
        onTap: () => onClick(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(30.0)),
            child: Container(
              height: 100,
              width: 250,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                inputText,
                style: const TextStyle(
                    color: kBackgroundColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(30.0)),
            child: Container(
              height: 100,
              alignment: Alignment.center,
              // padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                // TEXT COUNTER PRODUCT SELECTED IN TOTAL
                // subtitle: (menuController.order.isEmpty)
                //     ? null
                //     : Text(
                //         '${menuController.order.length} selected products.',
                //         style: const TextStyle(
                //           color: kSecondaryColor,
                //           fontSize: 18,
                //         ),
                //       ),
                trailing: Icon(
                  icon,
                  size: 64,
                  color: kBackgroundColor,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
